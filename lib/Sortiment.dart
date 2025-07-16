import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'CCard.dart';

class Sortiment extends StatelessWidget {
  const Sortiment({super.key});

  Future<List<Map<String, dynamic>>> content() async {
    final String jsonString = await rootBundle.loadString('lib/moc/Categorys.json');
    final List<dynamic> jsonData = jsonDecode(jsonString);

    return jsonData
        .map<Map<String, dynamic>>(
            (item) => {'name': item['name'], 'description': item['description'], 'imageUrl':item['imageUrl']})
        .toList();
  }

  @override
  Widget build(BuildContext con) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: content(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No data found"));
        }

        final data = snapshot.data!;

        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final item = data[index];
                  return Center(
                    child: CCard(
                      name: item['name'],
                      desc: item['description'],
                      imageUrl: item['imageUrl'],
                    ),
                  );
                },
                childCount: data.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
