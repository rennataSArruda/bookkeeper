import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LivrosRecord extends FirestoreRecord {
  LivrosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "autor" field.
  String? _autor;
  String get autor => _autor ?? '';
  bool hasAutor() => _autor != null;

  // "capa" field.
  String? _capa;
  String get capa => _capa ?? '';
  bool hasCapa() => _capa != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _autor = snapshotData['autor'] as String?;
    _capa = snapshotData['capa'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('livros');

  static Stream<LivrosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LivrosRecord.fromSnapshot(s));

  static Future<LivrosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LivrosRecord.fromSnapshot(s));

  static LivrosRecord fromSnapshot(DocumentSnapshot snapshot) => LivrosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LivrosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LivrosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LivrosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LivrosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLivrosRecordData({
  String? titulo,
  String? autor,
  String? capa,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
      'autor': autor,
      'capa': capa,
    }.withoutNulls,
  );

  return firestoreData;
}

class LivrosRecordDocumentEquality implements Equality<LivrosRecord> {
  const LivrosRecordDocumentEquality();

  @override
  bool equals(LivrosRecord? e1, LivrosRecord? e2) {
    return e1?.titulo == e2?.titulo &&
        e1?.autor == e2?.autor &&
        e1?.capa == e2?.capa;
  }

  @override
  int hash(LivrosRecord? e) =>
      const ListEquality().hash([e?.titulo, e?.autor, e?.capa]);

  @override
  bool isValidKey(Object? o) => o is LivrosRecord;
}
