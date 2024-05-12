import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email ='';
  String password = '';

  // ignore: non_constant_identifier_names
  bool _is_loading = false;
  bool get isLoading => _is_loading;

  set isLoading(bool value){
    _is_loading = true;
  }

  bool isValidForm(){
    return formKey.currentState?.validate() ?? false;
  }
}