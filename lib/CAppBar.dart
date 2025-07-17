import 'package:flutter/material.dart';
import 'FilterView.dart';

class CAppBar extends StatefulWidget implements PreferredSizeWidget {
  final void Function(String)? onSearchSelected;
  CAppBar({super.key, this.onSearchSelected});

  @override
  State<CAppBar> createState() => _CAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CAppBarState extends State<CAppBar> {
  final SearchController _controller = SearchController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        elevation: 0,
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: SearchAnchor(
            searchController: _controller,
            builder: (BuildContext context, SearchController controller) {
              return FractionallySizedBox(
                widthFactor: 0.9, // Adjusts width to 90% of screen
                child: SearchBar(
                  elevation: WidgetStateProperty.all(0),
                  controller: controller,
                  padding: const WidgetStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  onTap: controller.openView,
                  leading: const Icon(Icons.search),
                  trailing: <Widget>[],
                ),
              );
            },
            suggestionsBuilder: (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    controller.closeView(item);
                    if (widget.onSearchSelected != null) {
                      widget.onSearchSelected!(item);
                    }
                  },
                );
              });
            }
          ),
        ),
      ),
    );
  }

}
