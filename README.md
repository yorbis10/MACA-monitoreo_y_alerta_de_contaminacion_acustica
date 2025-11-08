![marca.png](https://i.postimg.cc/hjr0qm6d/marca.png)

# MACA - MONITOREO Y ALERTA DE CONTAMINACIÓN ACÚSTICA EN AMBIENTES EDUCATIVOS

## 💻 Desarrollado por:
🧑🏽‍💻Yorbis Aragón Bedoya  
👨🏻‍💻 Daniel Álvarez Echeverry

<!-- ## 👨‍🏫 Asesores
- María Nelcy González  
- Silvana Vallejo Córdoba  
- Juan David Tamayo  -->

##🧩 Introducción

MACA es un sistema IoT de bajo costo diseñado para monitorear y alertar sobre los niveles de contaminación acústica en instituciones de educación superior.
El proyecto busca contribuir al bienestar ambiental y académico, promoviendo espacios más saludables mediante la recolección y visualización de datos en tiempo real.

## ⚙️ Características principales  
- 📡 **Monitoreo en tiempo real** de niveles de ruido ambiental.  
- 🎛️ **Sensores de sonido** integrados (compatibles con MAX4466, INMP441, SEN0232).  
- 💾 **Procesamiento local** mediante **ESP32** para adquisición y envío de datos.  
- ☁️ **Conectividad IoT** con soporte para **MQTT** y plataformas en la nube.  
- 📊 **Visualización de datos** en dashboards web o móviles.  
- 🚨 **Alertas configurables** ante niveles de ruido que superen los umbrales establecidos.  
- 🔋 **Bajo consumo energético** y fácil integración en entornos educativos. 

## 🎯 Objetivo General
Desarrollar un sistema de bajo costo utilizando sensores de sonido y placas ESP32 para el monitoreo en tiempo real de la contaminación acústica.

## 🎯 Objetivos Específicos
- Diseñar un prototipo para adquirir variables acústicas (intensidad, frecuencia, duración).
- Implementar una plataforma central para reportes, alertas y visualización.
- Validar el sistema mediante pruebas funcionales, de precisión y usabilidad.

## 📌 Contexto
La **Resolución 627 de 2006** del Ministerio de Ambiente en Colombia establece límites permisibles para la exposición al ruido. Sin embargo, en entornos educativos no se suele hacer medición ni control, afectando la concentración y salud de los estudiantes.

## ⚙️ Metodología
Se utilizó una metodología híbrida:
- **Waterfall** para el desarrollo del hardware.
- **Scrum** con 6 sprints para el desarrollo del software.

## 🧪 Alcance del Sistema
- Medición en vivo del ruido ambiental.
- Alerta automática cuando se exceden los límites.
- Visualización en tiempo real vía plataforma web (Grafana).
- Registro y análisis de datos en base de datos relacional y NoSQL.

## 🧩 Arquitectura del Sistema
![Arquitectura-del-sistema-drawio.png](https://i.postimg.cc/4x9qR85H/Arquitectura-del-sistema-drawio.png)

## 🛠️ Tecnologías Utilizadas
- **Hardware:** ESP32, Sensor de sonido, Pantalla OLED.
- **Backend:** Node.js, Broker MQTT, MySQL.
- **Frontend:** Grafana para visualización.
- **Despliegue:** VPS (Ubuntu), Nginx.

## 📊 Resultados
Durante una prueba de 30 días:
- Se registraron más de **250,000 mediciones** en aulas, biblioteca y cafetería.
- El **bloque 5 y la cafetería** presentaron los niveles más altos.
- El sistema mostró un **coeficiente de determinación R² de 0.97** y un **MAE del 2.5%**, comparable con equipos profesionales.


## 📚 Referencias
- [Manual de Efectos de Ruido – EPA](https://www.nonoise.org/library/handbook/handbook.htm)
- [Estudios de impacto del ruido en estudiantes](http://dspace.tecnologicosudamericano.edu.ec/jspui/handle/123456789/610)
- [Diseño de sistemas de monitoreo IoT acústico](https://hdl.handle.net/20.500.12867/3479)

## 🎥 Mockups
![1.png](https://i.postimg.cc/3JcQT0QV/1.png)
![3.png](https://i.postimg.cc/h4Mq23yS/3.png)
![7.png](https://i.postimg.cc/SR13k33C/7.png)
![8.png](https://i.postimg.cc/qqvWf4bp/8.png)
![9.png](https://i.postimg.cc/vBzCScvP/9.png)
![10.png](https://i.postimg.cc/nzZ6kvqj/10.png)
![11.png](https://i.postimg.cc/tgFKWrnG/11.png)
![12.png](https://i.postimg.cc/htQWP4Sj/12.png)


