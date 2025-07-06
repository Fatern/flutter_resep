// lib/pages/search_results_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_resep/models/recipe.dart';
import 'package:flutter_resep/services/local_storage_service.dart';
import 'package:flutter_resep/widgets/recipe_card.dart';

// PERUBAHAN: Diubah menjadi StatefulWidget
class SearchResultsPage extends StatefulWidget {
  const SearchResultsPage({super.key});

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  List<String> _favoriteIds = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() {
    if (mounted) {
      setState(() {
        _favoriteIds = LocalStorageService.getFavoriteRecipeIds();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Recipe> filteredRecipes =
        ModalRoute.of(context)!.settings.arguments as List<Recipe>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Pencarian'),
        backgroundColor: const Color(0xFF0D47A1),
      ),
      body:
          filteredRecipes.isEmpty
              ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search_off, size: 80, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'Resep tidak ditemukan',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Text(
                      'Coba kata kunci atau filter yang lain.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              )
              : GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: filteredRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = filteredRecipes[index];
                  // PERUBAHAN: Meneruskan status favorit dan callback
                  return RecipeCard(
                    recipe: recipe,
                    isFavorited: _favoriteIds.contains(recipe.id),
                    onPop: _loadFavorites,
                  );
                },
              ),
    );
  }
}
