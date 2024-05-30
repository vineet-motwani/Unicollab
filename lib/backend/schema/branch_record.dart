import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class BranchRecord extends FirestoreRecord {
  BranchRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "branch_name" field.
  String? _branchName;
  String get branchName => _branchName ?? '';
  bool hasBranchName() => _branchName != null;

  void _initializeFields() {
    _branchName = snapshotData['branch_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('branch');

  static Stream<BranchRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BranchRecord.fromSnapshot(s));

  static Future<BranchRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BranchRecord.fromSnapshot(s));

  static BranchRecord fromSnapshot(DocumentSnapshot snapshot) => BranchRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BranchRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BranchRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BranchRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BranchRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBranchRecordData({
  String? branchName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'branch_name': branchName,
    }.withoutNulls,
  );

  return firestoreData;
}

class BranchRecordDocumentEquality implements Equality<BranchRecord> {
  const BranchRecordDocumentEquality();

  @override
  bool equals(BranchRecord? e1, BranchRecord? e2) {
    return e1?.branchName == e2?.branchName;
  }

  @override
  int hash(BranchRecord? e) => const ListEquality().hash([e?.branchName]);

  @override
  bool isValidKey(Object? o) => o is BranchRecord;
}
