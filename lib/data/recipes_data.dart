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
  Recipe(
    id: 'r5',
    name: 'Omelet Sayur',
    imageUrl: 'assets/images/omelet sayur.png', // PERBAIKAN
    cookingTimeMinutes: 12,
    estimatedCostCategory: 'Hemat',
    ingredients: [
      '2 butir telur',
      '1/4 paprika, potong dadu',
      '1 batang daun bawang, iris',
      'Garam, merica',
    ],
    instructions: [
      'Kocok lepas telur, garam, dan merica.',
      'Masukkan potongan paprika dan daun bawang, aduk rata.',
      'Panaskan sedikit minyak di teflon, tuang adonan telur.',
      'Masak dengan api kecil hingga matang.',
    ],
    tips: ['Tambahkan keju parut di atasnya untuk rasa yang lebih gurih.'],
  ),
  Recipe(
    id: 'r6',
    name: 'Udang Saus Tiram',
    imageUrl: 'assets/images/udang saus tiram.jpg', // PERBAIKAN
    cookingTimeMinutes: 25,
    estimatedCostCategory: 'Menengah',
    ingredients: [
      '250 gr udang',
      '1 buah bawang bombay, iris',
      '3 sdm saus tiram',
      '1 sdm kecap manis',
      'Air secukupnya',
    ],
    instructions: [
      'Tumis bawang bombay hingga harum.',
      'Masukkan udang, masak hingga berubah warna.',
      'Tuangkan saus tiram, kecap manis, dan sedikit air.',
      'Masak hingga bumbu meresap.',
    ],
    tips: [
      'Gunakan udang segar untuk hasil terbaik.',
      'Tambahkan irisan cabai jika suka pedas.',
    ],
  ),
  Recipe(
    id: 'r7',
    name: 'Rendang Daging',
    imageUrl: 'assets/images/rendang daging.jpg', // PERBAIKAN
    cookingTimeMinutes: 120,
    estimatedCostCategory: 'Menengah',
    ingredients: [
      '500 gr daging sapi',
      '1 liter santan',
      'Bumbu rendang instan',
      'Daun kunyit dan daun jeruk',
    ],
    instructions: [
      'Masukkan daging, santan, bumbu instan, dan daun-daunan ke dalam wajan.',
      'Masak dengan api sedang sambil terus diaduk hingga santan mengering dan mengeluarkan minyak.',
      'Kecilkan api, masak terus hingga rendang kering dan berwarna coklat gelap.',
    ],
    tips: [
      'Mengaduk rendang secara berkala sangat penting agar tidak gosong di bagian bawah.',
    ],
  ),
  Recipe(
    id: 'r8',
    name: 'Gulai Ikan Patin',
    imageUrl: 'assets/images/Gulai Ikan Patin.jpg', // PERBAIKAN
    cookingTimeMinutes: 40,
    estimatedCostCategory: 'Menengah',
    ingredients: [
      '1 ekor ikan patin, potong-potong',
      '500 ml santan',
      'Bumbu gulai instan',
      'Asam kandis',
    ],
    instructions: [
      'Didihkan santan bersama bumbu gulai instan.',
      'Masukkan potongan ikan patin dan asam kandis.',
      'Masak hingga ikan matang dan bumbu meresap.',
      'Jangan terlalu sering mengaduk agar ikan tidak hancur.',
    ],
    tips: ['Gunakan santan segar untuk kuah yang lebih gurih.'],
  ),
  Recipe(
    id: 'r9',
    name: 'Sayur Lodeh',
    imageUrl: 'assets/images/sayur lodeh.jpg', // PERBAIKAN
    cookingTimeMinutes: 35,
    estimatedCostCategory: 'Hemat',
    ingredients: [
      '1 ikat kacang panjang',
      '1 buah terong, potong',
      '1 buah labu siam, potong',
      '500 ml santan',
      'Bumbu lodeh instan',
    ],
    instructions: [
      'Rebus sayuran yang keras (seperti labu siam) terlebih dahulu hingga setengah matang.',
      'Masukkan santan, bumbu instan, dan sisa sayuran.',
      'Masak hingga semua sayuran matang.',
    ],
    tips: ['Tambahkan tempe atau tahu untuk protein tambahan.'],
  ),
  Recipe(
    id: 'r10',
    name: 'Opor Ayam',
    imageUrl: 'assets/images/opor ayam.jpg', // PERBAIKAN
    cookingTimeMinutes: 50,
    estimatedCostCategory: 'Menengah',
    ingredients: [
      '1/2 ekor ayam',
      '700 ml santan',
      'Bumbu opor instan',
      'Serai dan daun salam',
    ],
    instructions: [
      'Tumis bumbu opor instan hingga harum.',
      'Masukkan ayam, aduk hingga berubah warna.',
      'Tuang santan, masukkan serai dan daun salam.',
      'Masak hingga ayam empuk dan kuah mengental.',
    ],
    tips: ['Taburi dengan bawang goreng sebelum disajikan.'],
  ),
];
