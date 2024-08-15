import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserLivrosRecord extends FirestoreRecord {
  UserLivrosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "livro" field.
  DocumentReference? _livro;
  DocumentReference? get livro => _livro;
  bool hasLivro() => _livro != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "avaliacao" field.
  int? _avaliacao;
  int get avaliacao => _avaliacao ?? 0;
  bool hasAvaliacao() => _avaliacao != null;

  // "favorito" field.
  bool? _favorito;
  bool get favorito => _favorito ?? false;
  bool hasFavorito() => _favorito != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "ebook" field.
  bool? _ebook;
  bool get ebook => _ebook ?? false;
  bool hasEbook() => _ebook != null;

  // "arquivo" field.
  String? _arquivo;
  String get arquivo => _arquivo ?? '';
  bool hasArquivo() => _arquivo != null;

  void _initializeFields() {
    _livro = snapshotData['livro'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _avaliacao = castToType<int>(snapshotData['avaliacao']);
    _favorito = snapshotData['favorito'] as bool?;
    _status = snapshotData['status'] as String?;
    _ebook = snapshotData['ebook'] as bool?;
    _arquivo = snapshotData['arquivo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userLivros');

  static Stream<UserLivrosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserLivrosRecord.fromSnapshot(s));

  static Future<UserLivrosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserLivrosRecord.fromSnapshot(s));

  static UserLivrosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserLivrosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserLivrosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserLivrosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserLivrosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserLivrosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserLivrosRecordData({
  DocumentReference? livro,
  DocumentReference? user,
  int? avaliacao,
  bool? favorito,
  String? status,
  bool? ebook,
  String? arquivo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'livro': livro,
      'user': user,
      'avaliacao': avaliacao,
      'favorito': favorito,
      'status': status,
      'ebook': ebook,
      'arquivo': arquivo,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserLivrosRecordDocumentEquality implements Equality<UserLivrosRecord> {
  const UserLivrosRecordDocumentEquality();

  @override
  bool equals(UserLivrosRecord? e1, UserLivrosRecord? e2) {
    return e1?.livro == e2?.livro &&
        e1?.user == e2?.user &&
        e1?.avaliacao == e2?.avaliacao &&
        e1?.favorito == e2?.favorito &&
        e1?.status == e2?.status &&
        e1?.ebook == e2?.ebook &&
        e1?.arquivo == e2?.arquivo;
  }

  @override
  int hash(UserLivrosRecord? e) => const ListEquality().hash([
        e?.livro,
        e?.user,
        e?.avaliacao,
        e?.favorito,
        e?.status,
        e?.ebook,
        e?.arquivo
      ]);

  @override
  bool isValidKey(Object? o) => o is UserLivrosRecord;
}
