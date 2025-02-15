import 'package:astropedia/Controller/planeta_controlador.dart';
import 'package:astropedia/Models/Planeta.dart';
import 'package:astropedia/Pages/detalhes_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PlanetaControlador _database = PlanetaControlador();

  List<Planeta> planetas = [];

  listarPlanetas() async {
    List<Map<String, dynamic>> planetasMap = await _database.listarPlanetas();
    planetas = planetasMap.map((planeta) => Planeta.fromMap(planeta)).toList();
  }

  atualizarPlaneta(Planeta planeta) async {
    await _database.atualizarPlaneta(planeta);
  }

  @override
  void initState() {
    listarPlanetas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Astropedia'),
      ),
      body: ListView.builder(
        itemCount: planetas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(planetas[index].nome),
            subtitle: Text(planetas[index].apelido),
            trailing: Text(planetas[index].distanciaDoSol.toString()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalhesPage(
                    planetName: planetas[index].nome,
                    planetDistance: planetas[index].distanciaDoSol.toString(),
                    planetSize: planetas[index].tamanho.toString(),
                    onDelete: () {
                      setState(() {
                        planetas.removeAt(index);
                      });
                    },
                    planeta: planetas[index],
                    onUpdate: () {
                      atualizarPlaneta(planetas[index]);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_planeta');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
