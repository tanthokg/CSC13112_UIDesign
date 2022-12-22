import 'package:uniride/constants/status.dart';

class Trip {
  final int? id;
  final String rider;
  final String hitchhiker;
  final DateTime createdTime;
  final DateTime startTime;
  final String departure;
  final String dest;
  final String? pickupPoint;
  final DateTime? pickTime;
  final String? dropPoint;
  final DateTime? dropTime;
  final DateTime? endTime;
  final int price;
  final double distance;
  final TripStatus status;
  final String? notes;

  Trip({
    this.id,
    required this.rider,
    required this.hitchhiker,
    required this.createdTime,
    required this.startTime,
    required this.departure,
    required this.dest,
    this.pickupPoint,
    this.pickTime,
    this.dropPoint,
    this.dropTime,
    this.endTime,
    required this.price,
    required this.distance,
    required this.status,
    this.notes,
  });

  Trip clone(
          {int? id,
          String? rider,
          String? hitchhiker,
          DateTime? createdTime,
          DateTime? startTime,
          String? departure,
          String? dest,
          String? pickupPoint,
          DateTime? pickTime,
          String? dropPoint,
          DateTime? dropTime,
          DateTime? endTime,
          int? price,
          double? distance,
          TripStatus? status,
          String? notes}) =>
      Trip(
          id: id ?? this.id,
          rider: rider ?? this.rider,
          hitchhiker: hitchhiker ?? this.hitchhiker,
          createdTime: createdTime ?? this.createdTime,
          startTime: startTime ?? this.startTime,
          departure: departure ?? this.departure,
          dest: dest ?? this.dest,
          pickupPoint: pickupPoint ?? this.pickupPoint,
          pickTime: pickTime ?? this.pickTime,
          dropPoint: dropPoint ?? this.dropPoint,
          dropTime: dropTime ?? this.dropTime,
          endTime: endTime ?? this.endTime,
          price: price ?? this.price,
          distance: distance ?? this.distance,
          status: status ?? this.status,
          notes: notes ?? this.notes);

  Map<String, Object?> toJson() => {
        TripFields.id: id,
        TripFields.rider: rider,
        TripFields.hitchhiker: hitchhiker,
        TripFields.createdTime : createdTime.toIso8601String(),
        TripFields.startTime: startTime.toIso8601String(),
        TripFields.departure: departure,
        TripFields.dest: dest,
        TripFields.pickupPoint: pickupPoint,
        TripFields.pickTime: pickTime?.toIso8601String(),
        TripFields.dropPoint: dropPoint,
        TripFields.dropTime: dropTime?.toIso8601String(),
        TripFields.endTime: endTime?.toIso8601String(),
        TripFields.price: price,
        TripFields.distance: distance,
        TripFields.status: status,
        TripFields.notes: notes,
      };

  static Trip fromJson(Map<String, Object?> json) => Trip(
        rider: json[TripFields.rider] as String,
        hitchhiker: json[TripFields.hitchhiker] as String,
        createdTime: json[TripFields.createdTime] as DateTime,
        startTime: json[TripFields.startTime] as DateTime,
        departure: json[TripFields.departure] as String,
        dest: json[TripFields.dest] as String,
        price: json[TripFields.price] as int,
        distance: json[TripFields.distance] as double,
        status: json[TripFields.status] as TripStatus,
      );
}

class TripFields {
  static const all = [
    id,
    rider,
    hitchhiker,
    createdTime,
    startTime,
    departure,
    dest,
    pickupPoint,
    pickTime,
    dropPoint,
    dropTime,
    endTime,
    price,
    distance,
    status,
    notes
  ];

  static const id = 'id';
  static const rider = 'rider';
  static const hitchhiker = 'hitchhiker';
  static const createdTime = 'createdTime';
  static const startTime = 'startTime';
  static const departure = 'departure';
  static const dest = 'dest';
  static const pickupPoint = 'pickupPoint';
  static const pickTime = 'pickTime';
  static const dropPoint = 'dropPoint';
  static const dropTime = 'dropTime';
  static const endTime = 'endTime';
  static const price = 'price';
  static const distance = 'distance';
  static const status = 'status';
  static const notes = 'notes';
}
