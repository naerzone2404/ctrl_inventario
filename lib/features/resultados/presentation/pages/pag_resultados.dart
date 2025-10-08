import 'package:flutter/material.dart';

class PagResultados extends StatefulWidget {
  const PagResultados({super.key, required this.codigo});
  final String codigo;

  @override
  State<PagResultados> createState() => _PagResultadosState();
}

class _PagResultadosState extends State<PagResultados> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Codigo:'),
            expandedHeight: 150,
            pinned: true,
            floating: true,
          ),
        ],
      ),
    );
  }
}
