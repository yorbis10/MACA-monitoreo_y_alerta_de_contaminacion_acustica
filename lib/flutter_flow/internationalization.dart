import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // RegistroUsuario
  {
    'w531dvea': {
      'es': 'MACA',
      'en': 'MACA',
    },
    'ndp48nv5': {
      'es': 'Crear Cuenta',
      'en': 'Create Account',
    },
    'hbjiirfp': {
      'es': 'Comencemos completando el formulario a continuación.',
      'en': 'Let\'s get started by filling out the form below.',
    },
    'wn2568he': {
      'es': 'Nombre Competo',
      'en': 'Full Name',
    },
    '1ezchuqn': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'y2ar1ncb': {
      'es': 'Telefono',
      'en': 'Phone',
    },
    '360n3j5u': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'cx5sg8yj': {
      'es': 'Confirmar Contraseña',
      'en': 'Confirm Password',
    },
    'h5p1lte6': {
      'es': 'Crear Cuenta',
      'en': 'Create Account',
    },
    'jdn1og69': {
      'es': 'Si ya tienes una cuenta  ',
      'en': 'If you already have an account',
    },
    'lrlqcvhm': {
      'es': 'Ingresa Aqui',
      'en': 'Enter Here',
    },
    'ahq13p5f': {
      'es': 'El nombre es obligatorio',
      'en': 'Name is required',
    },
    'wg7lk5y0': {
      'es': 'El nombre debe contener minimo 3 caracteres',
      'en': 'The name must contain at least 3 characters',
    },
    '2goszjsj': {
      'es': 'El nombre no debe exceder mas de 150  caracteres',
      'en': 'The name must not exceed more than 150 characters',
    },
    'coyeycp0': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'qu5rlvyo': {
      'es': 'El correo es obligatorio Ej. info@ssaragon.com\n',
      'en': 'Email is required E.g. info@ssaragon.com',
    },
    'p8dmshzk': {
      'es': 'Cantidad de caracteres  del correo no es correcto',
      'en': 'The number of characters in the email is not correct',
    },
    'k0fa5zbs': {
      'es': 'El formato del correo no es valido',
      'en': 'The email format is not valid',
    },
    '6u1ee103': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'uqxanzuz': {
      'es': 'El número de telefono es obligatoria',
      'en': 'The phone number is required',
    },
    'ovv327b6': {
      'es': 'Solo números,  ej: 4441122',
      'en': 'Numbers only, ex: 4441122',
    },
    'koy67ut4': {
      'es': 'No puede tenes mas de 15 caracteres',
      'en': 'You cannot have more than 15 characters',
    },
    'm3jlci3n': {
      'es': 'El numero ingresado no es correcto',
      'en': 'The number entered is not correct',
    },
    'sf49vlcn': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '5i54izd0': {
      'es': 'La contraseña es obligatoria',
      'en': 'Password is required',
    },
    'h0nh5vvp': {
      'es': 'Debe ingresar MInimo 6 caracteres',
      'en': 'You must enter at least 6 characters',
    },
    '1vighw4l': {
      'es': 'La contraseña no debe superar los 25 caracteres',
      'en': 'The password must not exceed 25 characters',
    },
    'zsw95hs0': {
      'es': 'La contraseña no cumple con los requisitos de seguridad\n',
      'en': 'The password does not meet the security requirements',
    },
    'k9by210k': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'qbl2e27w': {
      'es': 'La confirmacion de contraseña es obligatoria',
      'en': 'Password confirmation is required',
    },
    '9gipsxa4': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'hvkuw0ar': {
      'es': 'Inicio',
      'en': 'Start',
    },
  },
  // login
  {
    'fcf8sww7': {
      'es': 'MACA',
      'en': 'MACA',
    },
    'jbm0vj4k': {
      'es': 'Monitoreo y Alerta de Contaminación Acústica ',
      'en': 'Noise Pollution Monitoring and Alerts',
    },
    '2inq44ae': {
      'es': 'Ingresa tus datos',
      'en': 'Enter your details',
    },
    'dh2q240o': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'io5j2n68': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'll2nvrhv': {
      'es': 'Iniciar sesión',
      'en': 'Login',
    },
    '1qhjel88': {
      'es': 'Registrate aquí',
      'en': 'Register here',
    },
    'kahc4m9v': {
      'es': '¿Olvidaste la clave?',
      'en': 'Forgot your password?',
    },
    'mxnp4isy': {
      'es': 'El correo es obligatorio',
      'en': 'Email is required',
    },
    'e9kxbi64': {
      'es': 'Cantidad de caracteres  del correo no es correcto',
      'en': 'The number of characters in the email is not correct',
    },
    '5uz2zhht': {
      'es': 'El formato del correo no es valido',
      'en': 'The email format is not valid',
    },
    'qhhm4jv8': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Please choose an option from the drop-down menu',
    },
    'djmyy7bb': {
      'es': 'La contraseña es obligatoria',
      'en': 'Password is required',
    },
    'ksapcnjs': {
      'es': 'Debe ingresar MInimo 6 caracteres',
      'en': 'You must enter at least 6 characters',
    },
    '9inopavz': {
      'es': 'La contraseña no debe superar los 6 caracteres',
      'en': 'The password must not exceed 6 characters',
    },
    '1st2vfhx': {
      'es': 'La contraseña no cumple con los requisitos de seguridad',
      'en': 'The password does not meet the security requirements',
    },
    '12wfpksk': {
      'es': 'Por favor elija una opción del menú desplegable',
      'en': 'Please choose an option from the drop-down menu',
    },
    'mfyuz3o2': {
      'es': 'Inicio',
      'en': 'Start',
    },
  },
  // PaginaInicio
  {
    'w8wi580t': {
      'es': 'MACA',
      'en': 'MACA',
    },
    '70bb80nr': {
      'es': 'Monitoreo y Alerta de Contaminación Acústica ',
      'en': 'Noise Pollution Monitoring and Alerts',
    },
    '4979asxn': {
      'es': 'Ingresar',
      'en': 'Get into',
    },
    'csgbpopf': {
      'es': 'Inicio',
      'en': 'Start',
    },
  },
  // RuidoEnVivo
  {
    'h3s495y9': {
      'es': 'Medicion en Vivo',
      'en': 'Live Measurement',
    },
    '7yfbc8ae': {
      'es': 'Inicio',
      'en': 'Start',
    },
  },
  // PerfilAdmin
  {
    '8bbey2lz': {
      'es': 'Perfil de Administración',
      'en': 'Administration Profile',
    },
    'xvk4rsfx': {
      'es': 'Editar Perfil',
      'en': 'Edit Profile',
    },
    'co45f8bl': {
      'es': 'Cambiar Contraseña',
      'en': 'Change Password',
    },
    '76so17et': {
      'es': 'Panel de Administacion',
      'en': 'Administration Panel',
    },
    'arntewcq': {
      'es': 'Cerrar sesión',
      'en': 'Log out',
    },
    'm0s6wl0q': {
      'es': '__',
      'en': '__',
    },
  },
  // EditarPerfil
  {
    'ljsg1yzt': {
      'es': 'Correo',
      'en': 'Mail',
    },
    '44hzli87': {
      'es': 'Nombre completo',
      'en': 'Full name',
    },
    'qcj0dfrx': {
      'es': 'Número de teléfono',
      'en': 'Phone number',
    },
    '257l0k26': {
      'es': 'Guardar Cambios',
      'en': 'Save Changes',
    },
    'ncna7nbx': {
      'es': 'Editar perfil',
      'en': 'Edit profile',
    },
  },
  // RecuperarClave
  {
    '9pse8kx0': {
      'es': 'Has olvidado tu contraseña',
      'en': 'You have forgotten your password',
    },
    '7jf3k6dt': {
      'es':
          'Le enviaremos un correo electrónico con un enlace para restablecer su contraseña; ingrese el correo electrónico asociado con su cuenta a continuación.',
      'en':
          'We\'ll send you an email with a link to reset your password; enter the email associated with your account below.',
    },
    'r27uk1z7': {
      'es': 'Correo electronico',
      'en': 'Email',
    },
    'qupeivy8': {
      'es': 'Escribe tu correo electronico....',
      'en': 'Enter your email....',
    },
    'zoz80tix': {
      'es': 'El correo es obligatorio  Ej. info@ssaragon.com',
      'en': 'Email is required E.g. info@ssaragon.com',
    },
    'ja56n979': {
      'es': 'Cantidad de caracteres  del correo no es correcto',
      'en': 'The number of characters in the email is not correct',
    },
    'rbknxa61': {
      'es': 'El formato del correo no es valido',
      'en': 'The email format is not valid',
    },
    'xly0d0zo': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'x9tbcrgr': {
      'es': 'Recuperar',
      'en': 'Recover',
    },
    'xstolvq4': {
      'es': 'Recuperación de Contraseña',
      'en': 'Password Recovery',
    },
    'wa825cy3': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // PerfilUsuario
  {
    'yg1r02kp': {
      'es': 'Editar Perfil',
      'en': 'Edit Profile',
    },
    'g3g3rn49': {
      'es': 'Cambiar Contraseña',
      'en': 'Change Password',
    },
    'w5hdj8z1': {
      'es': 'Eliminar Cuenta',
      'en': 'Delete Account',
    },
    '08powxhm': {
      'es': 'Cerrar sesión',
      'en': 'Log out',
    },
    '3846dk3r': {
      'es': 'Perfil de Usuario',
      'en': 'User Profile',
    },
    'p5cu33np': {
      'es': '__',
      'en': '__',
    },
  },
  // AdministrarUsuarios
  {
    'a6yzujlr': {
      'es': 'Selecciona el usuario',
      'en': 'Select the user',
    },
    '7zg1c4qw': {
      'es': 'Gestionar Usuarios',
      'en': 'Manage Users',
    },
    '4zq0q4kd': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // MenuAministracion
  {
    'p2mp4roa': {
      'es': 'Este es el menu para los usuarios con rol de administrador',
      'en': 'This is the menu for users with administrator role',
    },
    '8ag2yi0d': {
      'es': 'Menu Administracion',
      'en': 'Administration Menu',
    },
    'g6tlcyj2': {
      'es': 'Usuarios',
      'en': 'Users',
    },
    'lxgo8mfb': {
      'es': 'Medición en vivo',
      'en': 'Live measurement',
    },
    'lcykfkva': {
      'es': 'Mapa de Calor',
      'en': 'Heat Map',
    },
    't4s8g4cv': {
      'es': 'Reporte',
      'en': 'Report',
    },
    'yxabhsv4': {
      'es': 'Panel de Administración',
      'en': 'Administration Panel',
    },
    'zwv83t39': {
      'es': 'Inicio',
      'en': 'Start',
    },
  },
  // Detalleusuario
  {
    'oq63vs4h': {
      'es': 'Es Administrador',
      'en': 'He is an Administrator',
    },
    '2v9kn4ay': {
      'es': '',
      'en': '',
    },
    '1swir9bp': {
      'es': 'Eliminar',
      'en': 'Eliminate',
    },
    'm3zjshu0': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // MapaDeCalor
  {
    'vxcl94ux': {
      'es': 'Mapa de Calor',
      'en': 'Heat Map',
    },
    'jwq5qu3k': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Reporte
  {
    'ur8belpj': {
      'es': 'Reporte',
      'en': 'Report',
    },
    'otr21hd3': {
      'es': 'Inicio',
      'en': 'Start',
    },
  },
  // loaderio4fa2ac6b82b493ece426faa81d23b900
  {
    'pcmbljj4': {
      'es': 'loaderio-4fa2ac6b82b493ece426faa81d23b900',
      'en': '',
    },
    'j75o20hv': {
      'es': 'Pruebas de estrés y rendimiento',
      'en': '',
    },
    '9egrcr2u': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // CambiarClave
  {
    'vjyexf7b': {
      'es': 'Cambiar la contraseña',
      'en': 'Change password',
    },
    'io5t7hlr': {
      'es': 'Contraseña actual',
      'en': 'Current password',
    },
    '6xosvjrv': {
      'es': 'Nueva contraseña',
      'en': 'New password',
    },
    'iuovvwrc': {
      'es': 'Confirmar nueva contraseña',
      'en': 'Confirm new password',
    },
    'l9varrp3': {
      'es': 'Cambiar la contraseña',
      'en': 'Change password',
    },
  },
  // EliminarUsuario
  {
    'gftuzb6t': {
      'es': 'Deseas eliminar la cuenta del usuario?',
      'en': 'Do you want to delete the user account?',
    },
    '73fzdvpu': {
      'es': 'Eliminar Cuenta',
      'en': 'Delete Account',
    },
    'qgqt0jia': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
  },
  // Miscellaneous
  {
    '3dx6ti5b': {
      'es': '',
      'en': '',
    },
    '5doy0473': {
      'es': '',
      'en': '',
    },
    'ssei8db2': {
      'es': '',
      'en': 'Error',
    },
    'tkiv6fyr': {
      'es': 'Se envió  correo electrónico de restablecimiento de contraseña',
      'en': 'Password reset email sent',
    },
    's0fyy6rp': {
      'es': 'Correo electronico requerido !',
      'en': 'Email required !',
    },
    'g2hzu2s3': {
      'es': 'Se requiere número de teléfono',
      'en': 'Phone number required',
    },
    'tgm817m2': {
      'es': 'Las contraseñas no coinciden',
      'en': 'Passwords do not match',
    },
    '896fs5r8': {
      'es': 'ingrese el código de verificación enviado por SMS',
      'en': 'Enter the verification code sent by SMS',
    },
    'pf6i6bvm': {
      'es':
          'Ha pasado demasiado tiempo desde el inicio de sesión más reciente. Inicie sesión nuevamente antes de eliminar su cuenta.',
      'en':
          'It\'s been too long since your last login. Please log in again before deleting your account.',
    },
    'edsz3fq0': {
      'es':
          'Ha pasado demasiado tiempo desde el inicio de sesión más reciente. Inicie sesión nuevamente antes de actualizar su correo electrónico.',
      'en':
          'It\'s been too long since your last login. Please log in again before updating your email.',
    },
    '4j62x84a': {
      'es': '¡Confirmación de cambio por correo electrónico enviada!',
      'en': 'Confirmation of change by email sent!',
    },
    '2fh23tou': {
      'es': 'Correo electrónico ya en uso por otra cuenta',
      'en': 'Email already in use by another account',
    },
    'ohsoj2e3': {
      'es':
          'la credencial de autenticación proporcionada es incorrecta, está mal formada o ha caducado',
      'en':
          'The authentication credential provided is incorrect, malformed, or expired',
    },
    '6x6eb5ry': {
      'es': 'Formato del archivo no valido',
      'en': 'Invalid file format',
    },
    'u5bt4k7f': {
      'es': 'Subiendo archivo...',
      'en': 'Uploading file...',
    },
    'bfo0t3jz': {
      'es': 'éxito',
      'en': 'success',
    },
    'jvjxs8xk': {
      'es': 'no se pudieron cargar los datos',
      'en': 'could not load data',
    },
    'szziuwj4': {
      'es': '',
      'en': '',
    },
    '7imp5912': {
      'es': 'Elegir fuente',
      'en': 'Choose font',
    },
    'edh5nsya': {
      'es': 'Galería',
      'en': 'Gallery',
    },
    'yarius84': {
      'es': 'Galería (foto)',
      'en': 'Gallery (photo)',
    },
    'wxdn2kcv': {
      'es': 'Galería (video)',
      'en': 'Gallery (video)',
    },
    '2vx9gs71': {
      'es': 'Camara',
      'en': 'Camera',
    },
    'lj2jlir3': {
      'es': '',
      'en': '',
    },
    '9ni9ee1i': {
      'es': '',
      'en': '',
    },
    '82ofja17': {
      'es': '',
      'en': '',
    },
    'ko5gqag8': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
