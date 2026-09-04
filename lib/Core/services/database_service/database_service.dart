import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  static final firestoreInstance = FirebaseFirestore.instance;

  // ==================== CREATE / SET ====================



  Future<void> setDocument({
    required String collection,
    required String docId,
    required Map<String, dynamic> data,
    bool merge = true,
  }) async {
    await firestoreInstance
        .collection(collection)
        .doc(docId)
        .set(data, SetOptions(merge: merge));
  }

  /// إضافة document جديد بـ ID عشوائي (Auto-generated ID)
  /// بيرجع الـ ID بتاع الـ document اللي اتعمل
  Future<String> addDocument({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    final docRef = await firestoreInstance.collection(collection).add(data);
    return docRef.id;
  }

  // ==================== READ / GET ====================

  /// جيب document واحد بالـ ID بتاعه
  Future<Map<String, dynamic>?> getDocument({
    required String collection,
    required String docId,
  }) async {
    final snapshot = await firestoreInstance
        .collection(collection)
        .doc(docId)
        .get();
    return snapshot.exists ? snapshot.data() : null;
  }

  /// تحقق هل document موجود ولا لأ
  Future<bool> documentExists({
    required String collection,
    required String docId,
  }) async {
    final snapshot = await firestoreInstance
        .collection(collection)
        .doc(docId)
        .get();
    return snapshot.exists;
  }

  /// جيب كل الـ documents في collection معينة
  Future<List<Map<String, dynamic>>> getCollection({
    required String collection,
  }) async {
    final snapshot = await firestoreInstance.collection(collection).get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  /// جيب documents بشرط معين (query)
  /// مثال: getWhere(collection: 'users', field: 'isPro', isEqualTo: true)
  Future<List<Map<String, dynamic>>> getWhere({
    required String collection,
    required String field,
    dynamic isEqualTo,
    dynamic isGreaterThan,
    dynamic isLessThan,
    List<dynamic>? whereIn,
    int? limit,
  }) async {
    Query query = firestoreInstance.collection(collection);

    if (isEqualTo != null) query = query.where(field, isEqualTo: isEqualTo);
    if (isGreaterThan != null)
      query = query.where(field, isGreaterThan: isGreaterThan);
    if (isLessThan != null) query = query.where(field, isLessThan: isLessThan);
    if (whereIn != null) query = query.where(field, whereIn: whereIn);
    if (limit != null) query = query.limit(limit);

    final snapshot = await query.get();
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  // ==================== STREAM (Real-time listening) ====================

  /// استمع لتغييرات document معين لحظيًا (real-time)
  Stream<Map<String, dynamic>?> streamDocument({
    required String collection,
    required String docId,
  }) {
    return firestoreInstance
        .collection(collection)
        .doc(docId)
        .snapshots()
        .map((snapshot) => snapshot.exists ? snapshot.data() : null);
  }

  /// استمع لتغييرات collection كاملة لحظيًا
  Stream<List<Map<String, dynamic>>> streamCollection({
    required String collection,
  }) {
    return firestoreInstance
        .collection(collection)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  // ==================== UPDATE ====================

  /// تحديث حقول معينة فقط (من غير ما تمسح باقي البيانات)
  Future<void> updateDocument({
    required String collection,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    await firestoreInstance.collection(collection).doc(docId).update(data);
  }

  /// زيادة/نقصان قيمة رقمية (مفيد لـ counters)
  Future<void> incrementField({
    required String collection,
    required String docId,
    required String field,
    required num value,
  }) async {
    await firestoreInstance.collection(collection).doc(docId).update({
      field: FieldValue.increment(value),
    });
  }

  // ==================== DELETE ====================

  /// مسح document
  Future<void> deleteDocument({
    required String collection,
    required String docId,
  }) async {
    await firestoreInstance.collection(collection).doc(docId).delete();
  }

  /// مسح حقل معين من الـ document
  Future<void> deleteField({
    required String collection,
    required String docId,
    required String field,
  }) async {
    await firestoreInstance.collection(collection).doc(docId).update({
      field: FieldValue.delete(),
    });
  }

  // ==================== BATCH / TRANSACTION ====================

  /// عمل كذا عملية مع بعض في نفس الوقت (كلهم بينجحوا أو كلهم بيفشلوا)
  Future<void> runBatch(void Function(WriteBatch batch) actions) async {
    final batch = firestoreInstance.batch();
    actions(batch);
    await batch.commit();
  }

  /// Transaction لو محتاج تقرأ وتكتب بشكل atomic (زي عمليات الدفع أو الكاونترز الحساسة)
  Future<T> runTransaction<T>(
    Future<T> Function(Transaction transaction) action,
  ) async {
    return firestoreInstance.runTransaction(action);
  }
}
