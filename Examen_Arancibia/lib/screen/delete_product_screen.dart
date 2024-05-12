import 'package:flutter/material.dart';

class DeleteProductScreen extends StatelessWidget {
  const DeleteProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Borrar producto'),
        ),
        body: const Center(
          child: Text('Borrar producto'),
        ),
      );
  }
}