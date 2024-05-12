import 'package:flutter/material.dart';
import 'package:u3_arancibia_millan/providers/provider_form_providers.dart';
import 'package:u3_arancibia_millan/services/provider_service.dart';
import 'package:provider/provider.dart';
import '../ui/input_decorations.dart';

class EditProviderScreen extends StatelessWidget {
  const EditProviderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final providerService = Provider.of<ProvidersService>(context);
    return ChangeNotifierProvider(
        create: (_) => ProviderFormProvider(providerService.SelectProvider!),
        child: _ProviderScreenBody(
          providerService: providerService,
        ));
  }
}

class _ProviderScreenBody extends StatelessWidget {
  const _ProviderScreenBody({
    Key? key,
    required this.providerService,
  }) : super(key: key);

  final ProvidersService providerService;
  @override
  Widget build(BuildContext context) {
    final providerForm = Provider.of<ProviderFormProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Positioned(
                top: 40,
                left: 20,
                child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 40,
                      color: Colors.white,
                    )),
              ),
              Positioned(
                top: 40,
                right: 20,
                child: IconButton(
                    onPressed: () => {},
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      size: 40,
                      color: Colors.white,
                    )),
              )
            ],
          ),
          _ProviderForm(),
        ]),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.delete_forever),
            onPressed: () async {
              if (!providerForm.isValidForm()) return;
              await providerService.deleteProvider(providerForm.provider, context);
            },
            heroTag: null,
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            child: const Icon(Icons.save_alt_outlined),
            onPressed: () async {
              if (!providerForm.isValidForm()) return;
              await providerService.editOrCreateProvider(providerForm.provider);
            },
            heroTag: null,
          ),
        ],
      ),
    );
  }
}

class _ProviderForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providerForm = Provider.of<ProviderFormProvider>(context);
    final provider = providerForm.provider;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: _createDecoration(),
        child: Form(
          key: providerForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                initialValue: provider.providerName,
                onChanged: (value) => provider.providerName = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'el nombre es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Nombre del Proveedor',
                  labelText: 'Nombre',
                ),
              ),
              TextFormField(
                initialValue: provider.providerLastName,
                onChanged: (value) => provider.providerLastName = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'el apellido es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Apellido del Proveedor',
                  labelText: 'Apellido',
                ),
              ),
              TextFormField(
                initialValue: provider.providerEmail,
                onChanged: (value) => provider.providerEmail = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'el e-mail es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'E-mail del Proveedor',
                  labelText: 'E-mail',
                ),
              ),
              const SizedBox(height: 20),
              SwitchListTile.adaptive(
                value: true,
                onChanged: (value) {},
                activeColor: Colors.orange,
                title: const Text('Disponible'),
              )
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _createDecoration() => const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 5),
              blurRadius: 10,
            )
          ]);
}
