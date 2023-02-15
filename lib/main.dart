import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
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
    //print(state.toString());
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
      initialBinding: SessionBinding(),
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
      initialRoute: Routefy.initial,
      getPages: Routefy.all(),
      unknownRoute: Routefy.unknownRoute,
    );
  }
}

class SessionController extends GetxController {
  //@state

  final _isLoggedIn = false.obs;

  //@getters
  bool get isLoggedIn => _isLoggedIn.value;

  //@mutation
  void updateIsLoggedIn(bool value) => _isLoggedIn.value = value;
}

class SessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SessionController>(SessionController());
  }
}

//TODO: https://javiercbk.github.io/json_to_dart/
//TODO: https://www.figma.com/file/3A6TlYy9cXmuw6kK5NrOQ4/Defipay?node-id=135%3A182&t=mXZb8IijmVnFbofA-0
//TODO:

//TODO:
