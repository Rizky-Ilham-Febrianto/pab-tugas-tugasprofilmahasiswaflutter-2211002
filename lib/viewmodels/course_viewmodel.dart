import 'package:flutter/foundation.dart';

import '../data/mahasiswa_data.dart';

/// ViewModel mata kuliah: daftar MK, total SKS, dan MK terpilih.
class CourseViewModel extends ChangeNotifier {
  final List<MataKuliah> daftar = DataMahasiswa.mataKuliah;

  int _terpilih = 0;
  int get terpilih => _terpilih;

  int get totalSks => daftar.fold(0, (jumlah, mk) => jumlah + mk.sks);
  int get jumlahMk => daftar.length;

  MataKuliah get mkTerpilih => daftar[_terpilih];

  double get persenBobot => mkTerpilih.sks / totalSks;

  void pilih(int index) {
    if (index < 0 || index >= daftar.length) return;
    _terpilih = index;
    notifyListeners();
  }
}
