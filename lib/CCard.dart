import 'package:flutter/material.dart';

class CCard extends StatelessWidget {
  final String name;
  final String desc;
  final String imageUrl;

  const CCard({
    required this.name,
    required this.desc,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Bigger image
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            // Text content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    desc,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            // Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerRight,

              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
