import 'package:flutter/material.dart';
import 'package:scoutingapp/src/drawer/sidebar.dart';

class DataPageGraphView extends StatefulWidget {
  const DataPageGraphView({super.key});
  // Set the name for the route used for page switching.
  static const routeName = '/data_page';

  @override
  State<DataPageGraphView> createState() => _DataPageGraphViewState();
}

class _DataPageGraphViewState extends State<DataPageGraphView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  // Open the drawer when icon button is clicked.
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu));
          },
        ),
        title: const Text('Data view'),
      ),
      drawer: const Sidebar(), //New custom made drawer class.
      body: const Placeholder(),);
  }
}