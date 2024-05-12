import 'package:flutter/material.dart';
import 'package:u3_arancibia_millan/routes/app_routes.dart';
import 'package:u3_arancibia_millan/themes/estilo.dart';
import 'package:u3_arancibia_millan/services/auth_service.dart';
import 'package:u3_arancibia_millan/services/product_service.dart';
import 'package:provider/provider.dart';
import 'providers/providers.dart';
import 'services/auth_service.dart';
import 'services/product_service.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthService()),
          ChangeNotifierProvider(create: (_) => ProductService()),
        ],
        child: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: BaseTheme.baseTheme,
    );
  }
}
