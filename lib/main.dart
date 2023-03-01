import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xpatai/config/bindefy.dart';
import 'package:xpatai/services/auth_service.dart';
import 'package:xpatai/translations/translations.dart';
import 'package:xpatai/utils/keyboard_control.dart';
import 'config/routefy.dart';
import 'config/servicefy.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'config/themefy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  Firebase.initializeApp();

  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Servicefy().init();
  await dotenv.load(fileName: "development.env");
  runApp(DevicePreview(
    enabled: dotenv.env['APP_RELEASE_MODE'] != 'true',
    builder: (context) => MyApp(), // Wrap your app
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver, Keyboard {
  List<String> events = [];

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    events.add(state.toString());
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      enableLog: true,
      //locale: DevicePreview.locale(context),
      //builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: dotenv.env['APP_NAME'] ?? '',
      translations: MyTranslations(),
      locale: const Locale('en', 'US'),
      darkTheme: Themefy.darkTheme(context),
      themeMode: Themefy.themeMode(context),
      theme: Themefy.lightTheme(context),
      defaultTransition: Routefy.defaultTransition,
      home: AuthService().handleAuthState(),
      getPages: Routefy.all(),
      unknownRoute: Routefy.unknownRoute,
      initialBinding: Bindefy(),
    );
  }
}

//TODO: https://javiercbk.github.io/json_to_dart/
//TODO: https://www.figma.com/file/3A6TlYy9cXmuw6kK5NrOQ4/Defipay?node-id=135%3A182&t=mXZb8IijmVnFbofA-0
