// lib/pages/detail_page.dart

import 'package:flutter/material.dart';
import '../models/recipe.dart';

class DetailPage extends StatelessWidget {
  final Recipe recipe;

  const DetailPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  recipe.imageUrl,
                  width: double.infinity,
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.2),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Chip(
                    label: Text("Detail"),
                    backgroundColor: Color(0xFFE0F2F1),
                    labelStyle: TextStyle(color: Colors.black87),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    recipe.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.timer, size: 16, color: Colors.orange),
                      const SizedBox(width: 4),
                      Text('${recipe.cookingTimeMinutes} Menit'),
                      const SizedBox(width: 16),
                      const Icon(
                        Icons.bar_chart,
                        size: 16,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 4),
                      Text(recipe.estimatedCostCategory),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Bahan-bahan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...recipe.ingredients.map(
                    (item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        "• $item",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Langkah-langkah',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...recipe.instructions.asMap().entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        '${entry.key + 1}. ${entry.value}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  if (recipe.tips.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    const Text(
                      'Tips',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...recipe.tips.map(
                      (tip) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          '• $tip',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
