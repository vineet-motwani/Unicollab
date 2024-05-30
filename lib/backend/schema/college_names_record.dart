import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CollegeNamesRecord extends FirestoreRecord {
  CollegeNamesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "college_name" field.
  String? _collegeName;
  String get collegeName => _collegeName ?? '';
  bool hasCollegeName() => _collegeName != null;

  // "city_ref" field.
  String? _cityRef;
  String get cityRef => _cityRef ?? '';
  bool hasCityRef() => _cityRef != null;

  void _initializeFields() {
    _collegeName = snapshotData['college_name'] as String?;
    _cityRef = snapshotData['city_ref'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('college_names');

  static Stream<CollegeNamesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CollegeNamesRecord.fromSnapshot(s));

  static Future<CollegeNamesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CollegeNamesRecord.fromSnapshot(s));

  static CollegeNamesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CollegeNamesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CollegeNamesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CollegeNamesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CollegeNamesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CollegeNamesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCollegeNamesRecordData({
  String? collegeName,
  String? cityRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'college_name': collegeName,
      'city_ref': cityRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CollegeNamesRecordDocumentEquality
    implements Equality<CollegeNamesRecord> {
  const CollegeNamesRecordDocumentEquality();

  @override
  bool equals(CollegeNamesRecord? e1, CollegeNamesRecord? e2) {
    return e1?.collegeName == e2?.collegeName && e1?.cityRef == e2?.cityRef;
  }

  @override
  int hash(CollegeNamesRecord? e) =>
      const ListEquality().hash([e?.collegeName, e?.cityRef]);

  @override
  bool isValidKey(Object? o) => o is CollegeNamesRecord;
}
