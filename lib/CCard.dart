import 'package:flutter/material.dart';

class CCard extends StatelessWidget {
  final String name;
  final String desc;

 const CCard({required this.name, required this.desc, super.key});

  @override
  Widget build(BuildContext con) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             ListTile(
              leading: Icon(Icons.safety_check),
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
