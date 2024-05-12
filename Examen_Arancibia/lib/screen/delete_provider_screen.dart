import 'package:flutter/material.dart';

class DeleteProviderScreen extends StatelessWidget {
  const DeleteProviderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Borrar proveedor'),
        ),
        body: const Center(
          child: Text('Borrar proveedor'),
        ),
      );
  }
}