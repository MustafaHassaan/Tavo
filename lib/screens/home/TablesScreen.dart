import 'package:flutter/material.dart';

class TablesScreen extends StatelessWidget {
  final String placeName;
  final int tablesCount;

  const TablesScreen({
    super.key,
    required this.placeName,
    required this.tablesCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tables in $placeName')),
      body: Center(
        child: Text(
          'Number of tables available: $tablesCount',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
