class Trip {
  final int? id;
  final String rider;
  final String person;
  final DateTime startTime;
  final String source;
  final String dest;
  final String? pick;
  final DateTime? pickTime;
  final String? drop;
  final DateTime? dropTime;
  final DateTime? endTime;
  final int price;
  final double distance;
  final String status;
  final String? notes;

  Trip({
    this.id,
    required this.rider,
    required this.person,
    required this.startTime,
    required this.source,
    required this.dest,
    this.pick,
    this.pickTime,
    this.drop,
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
          String? person,
          DateTime? startTime,
          String? source,
          String? dest,
          String? pick,
          DateTime? pickTime,
          String? drop,
          DateTime? dropTime,
          DateTime? endTime,
          int? price,
          double? distance,
          String? status,
          String? notes}) =>
      Trip(
          id: id ?? this.id,
          rider: rider ?? this.rider,
          person: person ?? this.person,
          startTime: startTime ?? this.startTime,
          source: source ?? this.source,
          dest: dest ?? this.dest,
          pick: pick ?? this.pick,
          pickTime: pickTime ?? this.pickTime,
          drop: drop ?? this.drop,
          dropTime: dropTime ?? this.dropTime,
          endTime: endTime ?? this.endTime,
          price: price ?? this.price,
          distance: distance ?? this.distance,
          status: status ?? this.status,
          notes: notes ?? this.notes);

  Map<String, Object?> toJson() => {
        TripFields.id: id,
        TripFields.rider: rider,
        TripFields.person: person,
        TripFields.startTime: startTime.toIso8601String(),
        TripFields.source: source,
        TripFields.dest: dest,
        TripFields.pick: pick,
        TripFields.pickTime: pickTime?.toIso8601String(),
        TripFields.drop: drop,
        TripFields.dropTime: dropTime?.toIso8601String(),
        TripFields.endTime: endTime?.toIso8601String(),
        TripFields.price: price,
        TripFields.distance: distance,
        TripFields.status: status,
        TripFields.notes: notes,
      };

  static Trip fromJson(Map<String, Object?> json) => Trip(
        rider: json[TripFields.rider] as String,
        person: json[TripFields.person] as String,
        startTime: json[TripFields.startTime] as DateTime,
        source: json[TripFields.source] as String,
        dest: json[TripFields.dest] as String,
        price: json[TripFields.price] as int,
        distance: json[TripFields.distance] as double,
        status: json[TripFields.status] as String,
      );
}

class TripFields {
  static const all = [
    id,
    rider,
    person,
    startTime,
    source,
    dest,
    pick,
    pickTime,
    drop,
    dropTime,
    endTime,
    price,
    distance,
    status,
    notes
  ];

  static const id = 'id';
  static const rider = 'rider';
  static const person = 'person';
  static const startTime = 'startTime';
  static const source = 'source';
  static const dest = 'dest';
  static const pick = 'pick';
  static const pickTime = 'pickTime';
  static const drop = 'drop';
  static const dropTime = 'dropTime';
  static const endTime = 'endTime';
  static const price = 'price';
  static const distance = 'distance';
  static const status = 'status';
  static const notes = 'notes';
}
