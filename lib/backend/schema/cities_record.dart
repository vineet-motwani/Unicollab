import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CitiesRecord extends FirestoreRecord {
  CitiesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "city_name" field.
  String? _cityName;
  String get cityName => _cityName ?? '';
  bool hasCityName() => _cityName != null;

  // "state_ref" field.
  String? _stateRef;
  String get stateRef => _stateRef ?? '';
  bool hasStateRef() => _stateRef != null;

  void _initializeFields() {
    _cityName = snapshotData['city_name'] as String?;
    _stateRef = snapshotData['state_ref'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cities');

  static Stream<CitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CitiesRecord.fromSnapshot(s));

  static Future<CitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CitiesRecord.fromSnapshot(s));

  static CitiesRecord fromSnapshot(DocumentSnapshot snapshot) => CitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCitiesRecordData({
  String? cityName,
  String? stateRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'city_name': cityName,
      'state_ref': stateRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CitiesRecordDocumentEquality implements Equality<CitiesRecord> {
  const CitiesRecordDocumentEquality();

  @override
  bool equals(CitiesRecord? e1, CitiesRecord? e2) {
    return e1?.cityName == e2?.cityName && e1?.stateRef == e2?.stateRef;
  }

  @override
  int hash(CitiesRecord? e) =>
      const ListEquality().hash([e?.cityName, e?.stateRef]);

  @override
  bool isValidKey(Object? o) => o is CitiesRecord;
}
