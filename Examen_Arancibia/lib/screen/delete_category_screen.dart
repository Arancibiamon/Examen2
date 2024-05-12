import 'package:flutter/material.dart';

class DeleteCategoryScreen extends StatelessWidget {
  const DeleteCategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Borrar categoria'),
        ),
        body: const Center(
          child: Text('Borrar categoria'),
        ),
      );
  }
}