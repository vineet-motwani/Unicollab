import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class StatesRecord extends FirestoreRecord {
  StatesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "state_ref" field.
  String? _stateRef;
  String get stateRef => _stateRef ?? '';
  bool hasStateRef() => _stateRef != null;

  void _initializeFields() {
    _stateRef = snapshotData['state_ref'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('states');

  static Stream<StatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StatesRecord.fromSnapshot(s));

  static Future<StatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StatesRecord.fromSnapshot(s));

  static StatesRecord fromSnapshot(DocumentSnapshot snapshot) => StatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStatesRecordData({
  String? stateRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'state_ref': stateRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class StatesRecordDocumentEquality implements Equality<StatesRecord> {
  const StatesRecordDocumentEquality();

  @override
  bool equals(StatesRecord? e1, StatesRecord? e2) {
    return e1?.stateRef == e2?.stateRef;
  }

  @override
  int hash(StatesRecord? e) => const ListEquality().hash([e?.stateRef]);

  @override
  bool isValidKey(Object? o) => o is StatesRecord;
}
