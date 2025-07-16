import 'package:flutter/material.dart';

class CAppBar extends StatelessWidget implements PreferredSizeWidget{

  CAppBar({super.key});

  @override
  Widget build(BuildContext con) {
    return AppBar(title: const Text("PlaceHolder"),);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}
