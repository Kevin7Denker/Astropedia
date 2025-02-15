import 'package:astropedia/Models/Planeta.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

class PlanetaControlador {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    sqfliteFfiInit();
    var databaseFactory = databaseFactoryFfi;
    String path = join(await getDatabasesPath(), 'planetas.db');
    return await databaseFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: _onCreate,
      ),
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE planetas(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        distanciaDoSol TEXT,
        apelido TEXT,
        tamanho TEXT
      )
    ''');
  }

  Future<void> popularBanco() async {
    List<Map<String, dynamic>> planetas = [
      {
        'nome': 'Mercúrio',
        'distanciaDoSol': '57.91 milhões km',
        'apelido': 'O Mensageiro',
        'tamanho': '4,880 km'
      },
      {
        'nome': 'Vênus',
        'distanciaDoSol': '108.2 milhões km',
        'apelido': 'A Deusa do Amor',
        'tamanho': '12,104 km'
      },
      {
        'nome': 'Terra',
        'distanciaDoSol': '149.6 milhões km',
        'apelido': 'O Planeta Azul',
        'tamanho': '12,742 km'
      },
      {
        'nome': 'Marte',
        'distanciaDoSol': '227.9 milhões km',
        'apelido': 'O Planeta Vermelho',
        'tamanho': '6,779 km'
      },
      {
        'nome': 'Júpiter',
        'distanciaDoSol': '778.5 milhões km',
        'apelido': 'O Gigante Gasoso',
        'tamanho': '139,820 km'
      },
      {
        'nome': 'Saturno',
        'distanciaDoSol': '1.434 bilhões km',
        'apelido': 'O Senhor dos Anéis',
        'tamanho': '116,460 km'
      },
      {
        'nome': 'Urano',
        'distanciaDoSol': '2.871 bilhões km',
        'apelido': 'O Gigante Gelado',
        'tamanho': '50,724 km'
      },
      {
        'nome': 'Netuno',
        'distanciaDoSol': '4.495 bilhões km',
        'apelido': 'O Deus do Mar',
        'tamanho': '49,244 km'
      },
    ];

    Database db = await database;
    for (var planeta in planetas) {
      await db.insert('planetas', planeta);
    }
  }

  Future<int> inserirPlaneta(Planeta planeta) async {
    Database db = await database;
    return await db.insert('planetas', planeta.toJson());
  }

  Future<List<Map<String, dynamic>>> listarPlanetas() async {
    Database db = await database;
    return await db.query('planetas');
  }

  Future<int> atualizarPlaneta(Planeta planeta) async {
    Database db = await database;
    return await db.update(
      'planetas',
      planeta.toJson(),
      where: 'id = ?',
      whereArgs: [planeta.id],
    );
  }

  Future<int> deletarPlaneta(int id) async {
    Database db = await database;
    return await db.delete(
      'planetas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
