// lib/pages/search_filter_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_resep/data/recipes_data.dart';
import 'package:flutter_resep/models/recipe.dart';

class SearchFilterPage extends StatefulWidget {
  const SearchFilterPage({super.key});

  @override
  State<SearchFilterPage> createState() => _SearchFilterPageState();
}

class _SearchFilterPageState extends State<SearchFilterPage> {
  final _searchController = TextEditingController();
  String? _selectedTime;
  final Map<String, bool> _selectedCosts = {'Hemat': false, 'Menengah': false};

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _applyFilters() {
    final String query = _searchController.text.toLowerCase();

    List<Recipe> filteredRecipes = List.from(recipesData);

    if (query.isNotEmpty) {
      filteredRecipes =
          filteredRecipes.where((recipe) {
            return recipe.name.toLowerCase().contains(query);
          }).toList();
    }

    if (_selectedTime != null) {
      filteredRecipes =
          filteredRecipes.where((recipe) {
            if (_selectedTime == 'Cepat (≤15m)') {
              return recipe.cookingTimeMinutes <= 15;
            }
            if (_selectedTime == 'Sedang (16-30m)') {
              return recipe.cookingTimeMinutes > 15 &&
                  recipe.cookingTimeMinutes <= 30;
            }
            if (_selectedTime == 'Standar (>30m)') {
              return recipe.cookingTimeMinutes > 30;
            }
            return true;
          }).toList();
    }

    final activeCostFilters =
        _selectedCosts.entries
            .where((entry) => entry.value)
            .map((entry) => entry.key)
            .toList();

    if (activeCostFilters.isNotEmpty) {
      filteredRecipes =
          filteredRecipes.where((recipe) {
            return activeCostFilters.contains(recipe.estimatedCostCategory);
          }).toList();
    }

    Navigator.of(
      context,
    ).pushNamed('/search_results', arguments: filteredRecipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search & Filter'),
        backgroundColor: const Color(0xFF0D47A1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari resep...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Waktu Memasak',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10.0,
              children: [
                _buildTimeChip('Cepat (≤15m)'),
                _buildTimeChip('Sedang (16-30m)'),
                _buildTimeChip('Standar (>30m)'),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Kategori Biaya',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildCostCheckbox('Hemat'),
                const SizedBox(width: 10),
                _buildCostCheckbox('Menengah'),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _applyFilters,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D47A1),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text(
                'Terapkan Filter',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeChip(String label) {
    final bool isSelected = _selectedTime == label;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedTime = selected ? label : null;
        });
      },
      selectedColor: Colors.amber[400],
      backgroundColor: Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget _buildCostCheckbox(String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: _selectedCosts[label],
          onChanged: (bool? value) {
            setState(() {
              _selectedCosts[label] = value ?? false;
            });
          },
        ),
        Text(label),
      ],
    );
  }
}
