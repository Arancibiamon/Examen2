import 'package:flutter/material.dart';
import 'package:u3_arancibia_millan/models/categorias.dart';
import 'package:u3_arancibia_millan/services/category_service.dart';
import 'package:u3_arancibia_millan/widgets/category_card.dart';
import 'package:provider/provider.dart';
import 'package:u3_arancibia_millan/screen/screen.dart';

class ListCategoryScreen extends StatelessWidget {
  const ListCategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryService>(context);
    if (categoryService.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías'),
      ),
      body: ListView.builder(
        itemCount: categoryService.categorys.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            categoryService.SelectCategory =
                categoryService.categorys[index].copy();
            Navigator.pushNamed(context, 'edit');
          },
          child: CategoryCard(category: categoryService.categorys[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          categoryService.SelectCategory = Listado(
              categoryId: 0,
              categoryName: '',
              categoryState: '');
          Navigator.pushNamed(context, 'edit');
        },
      ),
    );
  }
}
