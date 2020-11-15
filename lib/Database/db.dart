import 'package:cloud_firestore/cloud_firestore.dart';

class DBService {
  static CollectionReference user =
      FirebaseFirestore.instance.collection("Pasien");

  static Future<void> createOrDeleteUser(String id,
      {String name,
      bool lk,
      bool pr,
      String status,
      String noHp,
      String dokter,
      String dokterAva,
      String dokterSpesialis,
      String date,
      String email}) async {
    await user.doc().set({
      'nama': name,
      'laki-laki': lk,
      'status': status,
      'perempuan': pr,
      'no-handphone': noHp,
      'email': email,
      'dokter': dokter,
      'doc-ava': dokterAva,
      'doc-spesialis': dokterSpesialis,
      'date': date
    });
  }

  static Future<DocumentSnapshot> getUser(String id) async {
    return await user.doc(id).get();
  }

  static Future<void> deleteUser(String id) async {
    await user.doc(id).delete();
  }

  static Future getByUsername(String name) async {
    return await FirebaseFirestore.instance
        .collection(
          "Pasien",
        )
        .where("nama", isEqualTo: name)
        .get();
  }
}

class DBBooking {
  static CollectionReference user =
      FirebaseFirestore.instance.collection("Booking");

  static Future<void> createOrDeleteDate(
      {String date,
      String nama,
      bool lk,
      String status,
      String ava,
      String dokter,
      String spesialis,
      String pesan,
      String bookingTime}) async {
    await user.doc().set({
      'date': date,
      'nama': nama,
      'laki-laki': lk,
      "status": status,
      "dokter": dokter,
      'doc-spesialis': spesialis,
      'pesan': pesan,
      'doc-ava': ava,
      'booking-time': bookingTime
    });
  }
}
