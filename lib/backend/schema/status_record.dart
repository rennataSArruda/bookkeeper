import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatusRecord extends FirestoreRecord {
  StatusRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "codigo" field.
  int? _codigo;
  int get codigo => _codigo ?? 0;
  bool hasCodigo() => _codigo != null;

  // "termo" field.
  String? _termo;
  String get termo => _termo ?? '';
  bool hasTermo() => _termo != null;

  void _initializeFields() {
    _codigo = castToType<int>(snapshotData['codigo']);
    _termo = snapshotData['termo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('status');

  static Stream<StatusRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StatusRecord.fromSnapshot(s));

  static Future<StatusRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StatusRecord.fromSnapshot(s));

  static StatusRecord fromSnapshot(DocumentSnapshot snapshot) => StatusRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StatusRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StatusRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StatusRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StatusRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStatusRecordData({
  int? codigo,
  String? termo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'codigo': codigo,
      'termo': termo,
    }.withoutNulls,
  );

  return firestoreData;
}

class StatusRecordDocumentEquality implements Equality<StatusRecord> {
  const StatusRecordDocumentEquality();

  @override
  bool equals(StatusRecord? e1, StatusRecord? e2) {
    return e1?.codigo == e2?.codigo && e1?.termo == e2?.termo;
  }

  @override
  int hash(StatusRecord? e) => const ListEquality().hash([e?.codigo, e?.termo]);

  @override
  bool isValidKey(Object? o) => o is StatusRecord;
}
