// lib/pages/home_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_resep/data/recipes_data.dart';
import 'package:flutter_resep/services/local_storage_service.dart';
import 'package:flutter_resep/widgets/recipe_card.dart';
import 'package:flutter_resep/pages/detail_page.dart'; // Tambahkan ini

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _handleLogout() {
    LocalStorageService.setLoggedInStatus(false);
    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D47A1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1),
        elevation: 0,
        title: Image.asset('assets/images/ReKan.png', height: 28),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: TextButton(
              onPressed: _handleLogout,
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Log Out',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/Bookmarks.png',
              height: 24,
              width: 24,
            ),
            onPressed: () {
              // Navigasi ke halaman favorit
            },
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/Search.png',
              height: 24,
              width: 24,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/search');
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Recipe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Chip(
                    label: const Text('Quick Filter'),
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: const Color(0xFF0D47A1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip('Cepat (≤15m)'),
                  const SizedBox(width: 8),
                  _buildFilterChip('Sedang (16-30m)'),
                  const SizedBox(width: 8),
                  _buildFilterChip('Standar (>30m)'),
                  const SizedBox(width: 8),
                  _buildFilterChip('Hemat'),
                  const SizedBox(width: 8),
                  _buildFilterChip('Menengah'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: recipesData.length,
              itemBuilder: (context, index) {
                final recipe = recipesData[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(recipe: recipe),
                      ),
                    );
                  },
                  child: RecipeCard(recipe: recipe),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Chip(
      label: Text(label),
      labelStyle: const TextStyle(color: Color(0xFF333333)),
      backgroundColor: const Color(0xFFFFD54F),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
