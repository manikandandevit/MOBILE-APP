import 'dart:io';
import 'package:bright_kid/view/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'app_initializer.dart';
import 'controller/auth_controller.dart';
import 'controller/bottom_nav_bar_controller.dart';
import 'controller/home_controller.dart';
import 'Core/Services/ServicesStorage/api_services.dart';
import 'Core/Services/auth_services.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiService>(create: (_) => ApiService()),
        ProxyProvider<ApiService, AuthServices>(
          update: (_, api, __) => AuthServices(api),
        ),
        ChangeNotifierProxyProvider<AuthServices, AuthController>(
          create: (context) => AuthController(context.read<AuthServices>()),
          update: (_, authServices, authController) => authController ?? AuthController(authServices),
        ),
        ChangeNotifierProvider(create: (_) => BottomNavBarController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
      ],
      child: MaterialApp(
        title: "Bright Kid",
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        initialRoute: AppPages.INITIAL,
        routes: AppPages.routes,
        builder: (context, child) {
          final easyLoadingBuilder = EasyLoading.init();

          return AppInitializer(
            child: SafeArea(
              bottom: Platform.isAndroid ? true : false,
              top: false,
              left: false,
              right: false,
              child: easyLoadingBuilder(
                context,
                child ?? const SizedBox(),
              ),
            ),
          );
        },
      ),
    );
  }
}
