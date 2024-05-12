import 'package:flutter/material.dart';
import 'package:u3_arancibia_millan/models/proveedores.dart';
import 'package:u3_arancibia_millan/services/provider_service.dart';
import 'package:u3_arancibia_millan/widgets/provider_card.dart';
import 'package:provider/provider.dart';
import 'package:u3_arancibia_millan/screen/screen.dart';

class ListProviderScreen extends StatelessWidget {
  const ListProviderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final providerService = Provider.of<ProvidersService>(context);
    if (providerService.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proveedores'),
      ),
      body: ListView.builder(
        itemCount: providerService.providers.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            providerService.SelectProvider =
                providerService.providers[index].copy();
            Navigator.pushNamed(context, 'edit');
          },
          child: ProviderCard(provider: providerService.providers[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          providerService.SelectProvider = Listado(
              providerId: 0,
              providerName: '',
              providerLastName: '',
              providerEmail: '',
              providerState: '');
          Navigator.pushNamed(context, 'edit');
        },
      ),
    );
  }
}
