import 'package:flutter/material.dart';

class CCard extends StatelessWidget {
  final String name;
  final String desc;
  final String imageUrl;

 const CCard({required this.name, required this.desc, required this.imageUrl, super.key});

  @override
  Widget build(BuildContext con) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             ListTile(
              leading:Image.network(imageUrl),
              title: Text(name),
              subtitle: Text(desc),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: () {},
                  child: const Text("mehr entdecken"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
