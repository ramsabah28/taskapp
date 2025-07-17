import 'package:flutter/material.dart';

class PCard extends StatelessWidget {
  final String name;
  final String desc;
  final String imageUrl;
  final int count;
  final String category;
  final String producer;

  const PCard({
    required this.name,
    required this.desc,
    required this.imageUrl,
    required this.category,
    required this.count,
    required this.producer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Image
            SizedBox(
              width: double.infinity,
              height: 160,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Description
                  Text(
                    desc,
                    style: const TextStyle(
                      fontSize: 9,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Additional simple text info
                  Text(
                    'Category: $category',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Producer: $producer',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Count: $count',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
