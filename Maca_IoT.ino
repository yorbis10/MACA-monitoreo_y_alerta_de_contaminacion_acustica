#include <Wire.h>
#include <WiFi.h>
#include <PubSubClient.h>
#include <U8g2lib.h>
#include <Arduino.h>

// ======================= ATENCIÓN =======================
// Cada placa debe tener un nombre ÚNICO en la variable Nombre_Esp32.
// Modifica el nombre antes de cargar el programa en la placa.
// =========================================================

String Nombre_Esp32 = "Bloque1-120"; // Cambiar nombre para cada placa

// Datos de red WiFi
const char* ssid = "Admin";
const char* password = "aD.*/i6t";

// Datos MQTT
const char *mqtt_server = "207.180.207.150"; //vps.macatdea.com
const int mqtt_port = 1883;
const char *mqtt_user = "web_iot_cliente";
const char *mqtt_pass = "Maca2025TdeA+";

// Datos Suscripcion a MQTT
const String Topic_Init = "Maca";
const String DataOut = "/DataOut";
//TOPIC  Maca/DataOut/#

WiFiClient espClient;
PubSubClient client(espClient);

// Configura la pantalla OLED - Display U8g2 (para SH1106 a 128x64)
U8G2_SH1106_128X64_NONAME_F_HW_I2C u8g2(U8G2_R0, /* reset=*/ U8X8_PIN_NONE);

// Configuración del sensor
#define SoundPin 35
#define VREF 3.3
// Factor de conversión para el sensor SEN0232
float factor = 50.0; // Ajusta el valor si es necesario

// Timers
unsigned long lastDisplayUpdate = 0;
unsigned long lastSerialUpdate = 0;
unsigned long lastMqttPublish = 0;

float Nivel_Dba = 0;
String Mensaje_Alerta = "";

void setup_wifi();
void reconnect();
void actualizarDisplay();
void calcularNivel();

void setup() {
  Serial.begin(115200);
  setup_wifi();
  client.setServer(mqtt_server, mqtt_port);

  delay(1500);
  
  Serial.println();
  Serial.print("La direccion MAC de la placa es: ");
  Serial.println(WiFi.macAddress());
  
  // Inicializar la pantalla
  u8g2.begin();
  u8g2.clearBuffer();
  u8g2.setFont(u8g2_font_ncenB14_tr); // u8g2.setFont(u8g2_font_fub30_tr);   Fuente más grande
  u8g2.drawStr(28, 32, "MACA");  // u8g2.drawStr(10, 40, "MACA");    Ajustar posición X,Y
  u8g2.sendBuffer();
  delay(2000);
  u8g2.clearBuffer();
  u8g2.sendBuffer();
}

void loop() {
  if (!client.connected()) {  //Verificar si el ESP32 sigue conectado al broker MQTT
    reconnect();  //Si se cae el MQTT, se vuelve a conectar.
  }
  client.loop();  //Mantiene la conexión activa - servicio MQTT

  unsigned long now = millis();

  // Refrescar pantalla cada 0.5 segundos
  if (now - lastDisplayUpdate > 500) {
    lastDisplayUpdate = now;
    calcularNivel();
    actualizarDisplay();
  }

  // Mostrar en Serial cada 2 segundo
  if (now - lastSerialUpdate > 2000) {
    lastSerialUpdate = now;
    Serial.print("Nivel de sonido: ");
    Serial.print(Nivel_Dba, 1);
    Serial.println(" DB");
  }

  // Publicar en MQTT cada  1min = 60000, 5 min=300000
  if (now - lastMqttPublish > 1000) {
    lastMqttPublish = now;

    String StrMsg = String(Nombre_Esp32) + "@" + String(Nivel_Dba, 2) + "@" + String(Mensaje_Alerta);
    int str_len = StrMsg.length() + 1;
    char char_Msg[str_len];
    StrMsg.toCharArray(char_Msg, str_len);

    Serial.print("Dato enviado al Broker: ");
    Serial.println(StrMsg);

    String StrTopic = Topic_Init + DataOut;
    str_len = StrTopic.length() + 1;
    char char_Topic[str_len];
    StrTopic.toCharArray(char_Topic, str_len);

    client.publish(char_Topic, char_Msg);
  }
}

void calcularNivel() {
  float voltageValue = analogRead(SoundPin) / 4095.0 * VREF;
  Nivel_Dba = voltageValue * factor;

  if (Nivel_Dba <= 20) {
    Mensaje_Alerta = "RUIDO BAJO";
  } else if (Nivel_Dba <= 40) {
    Mensaje_Alerta = "RUIDO MODERADO";
  } else if (Nivel_Dba <= 60) {
    Mensaje_Alerta = "RUIDO NORMAL";
  } else if (Nivel_Dba <= 80) {
    Mensaje_Alerta = "RUIDO ALTO";
  } else if (Nivel_Dba <= 100) {
    Mensaje_Alerta = "RUIDO ELEVADO";
  } else if (Nivel_Dba <= 120) {
    Mensaje_Alerta = "RUIDO DAÑINO";
  } else if (Nivel_Dba <= 130) {
    Mensaje_Alerta = "RUIDO EXTREMO";
  } else {
    Mensaje_Alerta = "FUERA RANGO";
  }
}

void actualizarDisplay() {
  u8g2.clearBuffer();

  // Mensaje Alerta
  u8g2.setFont(u8g2_font_6x13B_tf);
  uint16_t textWidth = u8g2.getStrWidth(Mensaje_Alerta.c_str());
  u8g2.drawStr((128 - textWidth) / 2, 15, Mensaje_Alerta.c_str());

  // Nivel dB
  u8g2.setFont(u8g2_font_fub17_tr);
  String Nivel_DbaStr = String(Nivel_Dba, 1) + " dB";
  textWidth = u8g2.getStrWidth(Nivel_DbaStr.c_str());
  u8g2.drawStr((128 - textWidth) / 2, 40, Nivel_DbaStr.c_str());

  // Barra de progreso
  int progress = map(Nivel_Dba, 0, 130, 0, 120); // Mapea a 120px de ancho
  u8g2.drawFrame(4, 50, 120, 10); // Marco
  u8g2.drawBox(5, 51, progress, 8); // Barra

  u8g2.sendBuffer();
}

void setup_wifi() {
  delay(10); //espera de 10 milisegundos
  Serial.println();
  Serial.print("Conectando a ");
  Serial.println(ssid);

  WiFi.begin(ssid, password); // conexion a wifi

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);  // espera medio segundo para reconectarse
    Serial.print(".");
  }

  Serial.println();
  Serial.println("Conectado a red WiFi!");
  Serial.println("Dirección IP: ");
  Serial.println(WiFi.localIP());
}

void reconnect() {  // reconectar al mqtt
  while (!client.connected()) {
    Serial.print("Intentando conexión MQTT...");
    String clientId = "esp32_";
    clientId += String(random(0xffff), HEX); // id unico
    if (client.connect(clientId.c_str(), mqtt_user, mqtt_pass)) {
      Serial.println("Conectado!");
      String StrTopic = Topic_Init + "//DataIn";
      client.subscribe(StrTopic.c_str());
    } else {
      Serial.print("falló, rc=");
      Serial.print(client.state());
      Serial.println(" intentando de nuevo en 5 segundos");
      delay(5000);
    }
  }
}
