import 'package:flutter/material.dart';
import 'package:u3_arancibia_millan/screen/screen.dart';

class AppRoutes {
  static const initialRoute = 'list';
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => const LoginScreen(),
    'list_product': (BuildContext context) => const ListProductScreen(),
    'edit_product': (BuildContext context) => const EditProductScreen(),
    'delete_product': (BuildContext context) => const DeleteProductScreen(),
    'list_category': (BuildContext context) => const ListCategoryScreen(),
    'edit_category': (BuildContext context) => const EditCategoryScreen(),
    'delete_category': (BuildContext context) => const DeleteCategoryScreen(),
    'list_provider': (BuildContext context) => const ListProviderScreen(),
    'edit_provider': (BuildContext context) => const EditProviderScreen(),
    'delete_provider': (BuildContext context) => const DeleteProviderScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }
}
