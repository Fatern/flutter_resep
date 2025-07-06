// lib/pages/detail_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_resep/services/local_storage_service.dart';
import '../models/recipe.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late List<String> _favoriteIds;
  bool _isFavorited = false;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() {
    _favoriteIds = LocalStorageService.getFavoriteRecipeIds();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final recipe = ModalRoute.of(context)!.settings.arguments as Recipe;
        setState(() {
          _isFavorited = _favoriteIds.contains(recipe.id);
        });
      }
    });
  }

  void _toggleFavorite() {
    final recipe = ModalRoute.of(context)!.settings.arguments as Recipe;
    setState(() {
      if (_isFavorited) {
        _favoriteIds.remove(recipe.id);
      } else {
        _favoriteIds.add(recipe.id);
      }
      _isFavorited = !_isFavorited;
      LocalStorageService.saveFavoriteRecipeIds(_favoriteIds);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFavorited
              ? '${recipe.name} ditambahkan ke favorit'
              : '${recipe.name} dihapus dari favorit',
        ),
        backgroundColor: _isFavorited ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final recipe = ModalRoute.of(context)!.settings.arguments as Recipe;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            actions: [
              IconButton(
                icon: Icon(
                  _isFavorited ? Icons.bookmark : Icons.bookmark_border,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: _toggleFavorite,
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                recipe.name,
                style: const TextStyle(
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      blurRadius: 8,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
              background: Image.asset(
                recipe.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _buildInfoChip(
                        Icons.timer_outlined,
                        '${recipe.cookingTimeMinutes} Menit',
                        Colors.orange,
                      ),
                      const SizedBox(width: 12),
                      _buildInfoChip(
                        Icons.attach_money,
                        recipe.estimatedCostCategory,
                        Colors.green,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Bahan-bahan'),
                  const SizedBox(height: 8),
                  _buildIngredientList(recipe.ingredients),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Langkah-langkah'),
                  const SizedBox(height: 8),
                  _buildInstructionList(recipe.instructions),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Tips'),
                  const SizedBox(height: 8),
                  _buildTipsCard(recipe.tips),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildInfoChip(IconData icon, String label, Color color) {
    return Chip(
      avatar: Icon(icon, color: color, size: 20),
      label: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      backgroundColor: color.withAlpha(26), // PERBAIKAN: Menggunakan withAlpha
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: color.withAlpha(77),
        ), // PERBAIKAN: Menggunakan withAlpha
      ),
    );
  }

  Widget _buildIngredientList(List<String> ingredients) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          ingredients
              .map(
                (ingredient) => Padding(
                  padding: const EdgeInsets.only(bottom: 6.0, left: 8.0),
                  child: Text(
                    '• $ingredient',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              )
              .toList(),
    );
  }

  Widget _buildInstructionList(List<String> instructions) {
    return Column(
      children: List.generate(instructions.length, (index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color(0xFF0D47A1),
            foregroundColor: Colors.white,
            child: Text('${index + 1}'),
          ),
          title: Text(
            instructions[index],
            style: const TextStyle(fontSize: 16),
          ),
        );
      }),
    );
  }

  Widget _buildTipsCard(List<String> tips) {
    return Card(
      color: Colors.amber.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.amber.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              tips
                  .map(
                    (tip) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.lightbulb_outline,
                            color: Colors.amber.shade800,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              tip,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.brown.shade800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
