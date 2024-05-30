import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class YearRecord extends FirestoreRecord {
  YearRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "student_year" field.
  String? _studentYear;
  String get studentYear => _studentYear ?? '';
  bool hasStudentYear() => _studentYear != null;

  void _initializeFields() {
    _studentYear = snapshotData['student_year'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('year');

  static Stream<YearRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => YearRecord.fromSnapshot(s));

  static Future<YearRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => YearRecord.fromSnapshot(s));

  static YearRecord fromSnapshot(DocumentSnapshot snapshot) => YearRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static YearRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      YearRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'YearRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is YearRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createYearRecordData({
  String? studentYear,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'student_year': studentYear,
    }.withoutNulls,
  );

  return firestoreData;
}

class YearRecordDocumentEquality implements Equality<YearRecord> {
  const YearRecordDocumentEquality();

  @override
  bool equals(YearRecord? e1, YearRecord? e2) {
    return e1?.studentYear == e2?.studentYear;
  }

  @override
  int hash(YearRecord? e) => const ListEquality().hash([e?.studentYear]);

  @override
  bool isValidKey(Object? o) => o is YearRecord;
}
