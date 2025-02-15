import 'package:astropedia/Controller/planeta_controlador.dart';
import 'package:flutter/material.dart';

import '../Models/Planeta.dart';

class AdicionarPlanetaPage extends StatefulWidget {
  PlanetaControlador _database = PlanetaControlador();

  @override
  _AdicionarPlanetaPageState createState() => _AdicionarPlanetaPageState();
}

class _AdicionarPlanetaPageState extends State<AdicionarPlanetaPage> {
  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _distanciaDoSolController = TextEditingController();
  final _tamanhoController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _distanciaDoSolController.dispose();
    _tamanhoController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  void _adicionarPlaneta() {
    Planeta planeta = Planeta(
      nome: _nomeController.text,
      distanciaDoSol: double.parse(_distanciaDoSolController.text),
      apelido: _descricaoController.text,
      tamanho: double.parse(_tamanhoController.text),
    );

    widget._database.inserirPlaneta(planeta);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Planeta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome do Planeta'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do planeta';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descricaoController,
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a descrição do planeta';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _distanciaDoSolController,
                decoration: InputDecoration(labelText: 'Distância do Sol'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a distância do planeta';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tamanhoController,
                decoration: InputDecoration(labelText: 'Tamanho'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o tamanho do planeta';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _adicionarPlaneta,
                child: Text('Adicionar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
