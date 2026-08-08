import 'package:cloud_firestore/cloud_firestore.dart';

Future seedCategories() async {
  final firestore = FirebaseFirestore.instance;

  final categories = [
    {
      'name': 'Birthday',
      'icon': '🎂',
      'itemsCount': 49,
    },
    {
      'name': 'Graduation',
      'icon': '🎓',
      'itemsCount': 73,
    },
    {
      'name': 'Wedding',
      'icon': '💍',
      'itemsCount': 43,
    },
    {
      'name': 'Anniversary',
      'icon': '🥂',
      'itemsCount': 49,
    },
    {
      'name': 'Valentine\'s',
      'icon': '❤️',
      'itemsCount': 28,
    },
    {
      'name': 'Mother\'s Day',
      'icon': '🌸',
      'itemsCount': 50,
    },
  ];

  final batch = firestore.batch();

  for (final category in categories) {
    final doc = firestore.collection('categories').doc();
    batch.set(doc, category);
  }

  await batch.commit();
  print('✅ Categories added successfully!');
}