import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uniride/entity/trip.dart';

class TripDAO {
  static final TripDAO instance = TripDAO._init();
  static Database? _database;

  TripDAO._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase('trips.db');
    return _database!;
  }

  Future<Database> _initDatabase(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    return await openDatabase(path, version: 1, onCreate: _onCreateDatabase);
  }

  Future<void> _onCreateDatabase(Database db, int version) async {
    const idType = 'integer primary key autoincrement';

    await db.execute('''
    create table TRIP
    (
      ${TripFields.id} $idType,
      ${TripFields.rider} text,
      ${TripFields.person} text,
      ${TripFields.startTime} text,
      ${TripFields.source} text,
      ${TripFields.dest} text,
      ${TripFields.pick} text,
      ${TripFields.pickTime} text,
      ${TripFields.drop} text,
      ${TripFields.dropTime} text,
      ${TripFields.endTime} text,
      ${TripFields.price} int,
      ${TripFields.distance} real,
      ${TripFields.status} text,
      ${TripFields.notes} text
    )
    ''');
  }

  Future<Trip> createTrip(Trip trip) async {
    final db = await instance.database;
    final id = await db.insert('TRIP', trip.toJson());
    return trip.clone(id: id);
  }

  Future<Trip> readTripById(int id) async {
    final db = await instance.database;
    final result = await db.query(
      'TRIP',
      columns: TripFields.all,
      where: '${TripFields.id} = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return Trip.fromJson(result.first);
    } else {
      throw Exception('Trip ID $id Not Found');
    }
  }

  Future<List<Trip>> readAllTrips() async {
    final db = await instance.database;
    final results = await db.query('TRIP',
        columns: TripFields.all, orderBy: '${TripFields.id} asc');
    return results.map((result) => Trip.fromJson(result)).toList();
  }

  Future<void> updateTrip(Trip trip) async {
    final db = await instance.database;
    await db.update(
      'TRIP',
      trip.toJson(),
      where: '${TripFields.id} = ?',
      whereArgs: [trip.id],
    );
  }

  Future<void> deleteTripById(int id) async {
    final db = await instance.database;
    await db.delete(
      'TRIP',
      where: '${TripFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }
}
