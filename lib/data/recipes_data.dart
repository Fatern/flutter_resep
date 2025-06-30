// lib/data/recipes_data.dart

import '../models/recipe.dart';

const List<Recipe> recipesData = [
  Recipe(
    id: 'r1',
    name: 'Nasi Goreng Spesial',
    imageUrl: 'assets/images/ast 2.jpeg',
    cookingTimeMinutes: 15,
    estimatedCostCategory: 'Hemat',
    ingredients: [
      '2 piring nasi putih',
      '2 butir telur',
      '3 siung bawang putih',
      'Kecap manis secukupnya',
      'Garam dan merica',
    ],
    instructions: [
      'Tumis bawang putih hingga harum.',
      'Masukkan telur, orak-arik hingga matang.',
      'Masukkan nasi, aduk rata.',
      'Tambahkan kecap, garam, dan merica. Aduk hingga semua tercampur.',
      'Sajikan hangat dengan irisan timun.',
    ],
    tips: [
      'Gunakan nasi yang sudah dingin agar tidak lengket.',
      'Tambahkan potongan ayam atau sosis untuk variasi.',
    ],
  ),
  Recipe(
    id: 'r2',
    name: 'Ayam Bakar Madu',
    imageUrl: 'assets/images/aset 3.jpeg',
    cookingTimeMinutes: 45,
    estimatedCostCategory: 'Menengah',
    ingredients: [
      '1 ekor ayam, potong 4',
      '5 sdm madu',
      '3 sdm kecap manis',
      '4 siung bawang putih, haluskan',
      'Garam dan lada',
    ],
    instructions: [
      'Campurkan madu, kecap manis, bawang putih, garam, dan lada.',
      'Lumuri ayam dengan campuran bumbu, diamkan 30 menit.',
      'Bakar ayam di atas bara api atau teflon hingga matang di kedua sisi.',
      'Olesi sisa bumbu sesekali saat membakar.',
    ],
    tips: [
      'Gunakan api kecil agar ayam matang merata dan tidak gosong.',
      'Sajikan dengan sambal terasi dan lalapan.',
    ],
  ),
  Recipe(
    id: 'r3',
    name: 'Tumis Kangkung Terasi',
    imageUrl: 'assets/images/aset 4.jpeg',
    cookingTimeMinutes: 10,
    estimatedCostCategory: 'Hemat',
    ingredients: [
      '1 ikat kangkung',
      '2 siung bawang putih, iris',
      '1 buah cabai merah, iris',
      '1 sdt terasi bakar',
      'Garam dan gula',
    ],
    instructions: [
      'Tumis bawang putih dan cabai hingga harum.',
      'Masukkan terasi, aduk hingga larut.',
      'Masukkan kangkung, aduk cepat dengan api besar.',
      'Tambahkan garam dan gula, koreksi rasa.',
      'Masak sebentar hingga kangkung layu, jangan terlalu lama.',
    ],
    tips: [
      'Pilih kangkung yang masih segar dan muda.',
      'Masak dengan api besar agar kangkung tetap renyah.',
    ],
  ),
  Recipe(
    id: 'r4',
    name: 'Soto Ayam Lamongan',
    imageUrl: 'assets/images/aset 5.jpeg',
    cookingTimeMinutes: 60,
    estimatedCostCategory: 'Menengah',
    ingredients: [
      '1/2 ekor ayam',
      '2 liter air',
      'Bumbu soto instan',
      'Soun, tauge, seledri',
      'Koya (kerupuk udang dan bawang putih goreng dihaluskan)',
    ],
    instructions: [
      'Rebus ayam hingga empuk, angkat dan suwir-suwir.',
      'Masukkan bumbu soto instan ke dalam air kaldu rebusan ayam, didihkan.',
      'Siapkan mangkuk, tata soun, tauge, dan suwiran ayam.',
      'Siram dengan kuah soto panas.',
      'Taburi dengan seledri dan koya.',
    ],
    tips: [
      'Sajikan dengan perasan jeruk nipis dan sambal untuk rasa yang lebih segar dan pedas.',
    ],
  ),
];
