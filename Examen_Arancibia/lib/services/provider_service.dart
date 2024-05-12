import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:u3_arancibia_millan/models/proveedores.dart';

class ProvidersService extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8050';
  final String _user = 'test';
  final String _pass = 'test2023';

  List<Listado> providers = [];
  Listado? SelectProvider;
  bool isLoading = true;
  bool isEditCreate = true;

  ProvidersService() {
    loadProviders();
  }
  Future loadProviders() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_list_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.get(url, headers: {'authorization': basicAuth});
    final providersMap = Providers.fromJson(response.body);
    providers = providersMap.listado;
    isLoading = false;
    notifyListeners();
  }

  Future editOrCreateProvider(Listado provider) async {
    isEditCreate = true;
    notifyListeners();
    if (provider.providerId == 0) {
      await this.createProvider(provider);
    } else {
      await this.updateProvider(provider);
    }

    isEditCreate = false;
    notifyListeners();
  }

  Future<String> updateProvider(Listado provider) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_edit_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: provider.toJson(), headers: {
      'authorization': basicAuth,
      'Content-Type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    
    //actualizamos el listado
    final index = providers
        .indexWhere((element) => element.providerId == provider.providerId);
    providers[index] = provider;

    return '';
  }

  Future createProvider(Listado provider) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_add_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: provider.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    this.providers.add(provider);
    return '';
  }

  Future deleteProvider(Listado provider, BuildContext context) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_del_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: provider.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    this.providers.clear(); //borra todo el listado
    loadProviders();
    Navigator.of(context).pushNamed('list');
    return '';
  }
}
