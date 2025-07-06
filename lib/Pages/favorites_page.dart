// lib/pages/favorites_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_resep/data/recipes_data.dart';
import 'package:flutter_resep/models/recipe.dart';
import 'package:flutter_resep/services/local_storage_service.dart';
import 'package:flutter_resep/widgets/recipe_card.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<Recipe> _favoriteRecipes = [];
  // PERUBAHAN: Tidak perlu state _favoriteIds di sini
  // karena semua yang ditampilkan sudah pasti favorit

  @override
  void initState() {
    super.initState();
    _loadFavoriteRecipes();
  }

  void _loadFavoriteRecipes() {
    final favoriteIds = LocalStorageService.getFavoriteRecipeIds();
    final favoriteRecipes =
        recipesData.where((recipe) => favoriteIds.contains(recipe.id)).toList();
    if (mounted) {
      setState(() {
        _favoriteRecipes = favoriteRecipes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resep Favorit'),
        backgroundColor: const Color(0xFF0D47A1),
      ),
      body:
          _favoriteRecipes.isEmpty
              ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.bookmark_remove_outlined,
                      size: 80,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Belum ada resep favorit',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
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
                itemCount: _favoriteRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = _favoriteRecipes[index];
                  return RecipeCard(
                    recipe: recipe,
                    // PERUBAHAN: Selalu true karena ini halaman favorit
                    isFavorited: true,
                    onPop: _loadFavoriteRecipes,
                  );
                },
              ),
    );
  }
}
