import 'package:astropedia/Models/Planeta.dart';
import 'package:flutter/material.dart';

class DetalhesPage extends StatelessWidget {
  final String planetName;
  final String planetDistance;
  final String planetSize;
  final VoidCallback onDelete;

  const DetalhesPage({
    super.key,
    required this.planetName,
    required this.planetDistance,
    required this.planetSize,
    required this.onDelete,
    required Planeta planeta,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(planetName),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Confirmar Exclusão'),
                  content: Text('Tem certeza que deseja deletar este planeta?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        onDelete();
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: Text('Deletar'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              planetName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Distância do Sol: $planetDistance',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Tamanho: $planetSize',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
