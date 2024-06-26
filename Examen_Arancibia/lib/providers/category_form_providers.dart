import 'package:flutter/material.dart';
import 'package:u3_arancibia_millan/models/categorias.dart';

class CategoryFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Listado category;
  CategoryFormProvider(this.category);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
