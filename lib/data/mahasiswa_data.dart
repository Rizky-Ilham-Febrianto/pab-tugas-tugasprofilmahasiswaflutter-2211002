/// Data statis aplikasi (model + sumber data).

class Mahasiswa {
  final String nama;
  final String nim;
  final String prodi;
  final int semester;
  final String kelas;
  final String fotoAsset;

  const Mahasiswa({
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.semester,
    required this.kelas,
    required this.fotoAsset,
  });

  /// Inisial untuk avatar cadangan jika foto belum ada.
  String get inisial {
    final parts = nama.trim().split(RegExp(r'\s+'));
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return (parts.first[0] + parts.last[0]).toUpperCase();
  }
}

class MataKuliah {
  final String nama;
  final int sks;

  const MataKuliah({required this.nama, required this.sks});
}

class Kontak {
  final String telepon;
  final String email;
  final String linkedin;

  const Kontak({
    required this.telepon,
    required this.email,
    required this.linkedin,
  });
}

class DataMahasiswa {
  DataMahasiswa._();

  static const Mahasiswa profil = Mahasiswa(
    nama: 'Rizky Ilham Febrianto',
    nim: '2211002',
    prodi: 'Teknik Informatika',
    semester: 5,
    kelas: 'IFB5J',
    fotoAsset: 'assets/images/profile.png',
  );

  static const List<MataKuliah> mataKuliah = [
    MataKuliah(nama: 'Sistem Manajemen Basis Data', sks: 3),
    MataKuliah(nama: 'Teknologi Aplikasi Bergerak', sks: 3),
    MataKuliah(nama: 'Penalaran Komputer', sks: 3),
    MataKuliah(nama: 'Simulasi dan Game Komputer', sks: 3),
    MataKuliah(nama: 'Robotika', sks: 3),
    MataKuliah(nama: 'Kriptografi', sks: 3),
    MataKuliah(nama: 'Penulisan dan Publikasi Ilmiah', sks: 2),
    MataKuliah(nama: 'Pemrograman Aplikasi Bergerak', sks: 3),
  ];

  
  static const Kontak kontak = Kontak(
    telepon: '+62 895-4198-30200',
    email: 'rizkyilhamfebrianto@gmail.com',
    linkedin: 'linkedin.com/in/rizky-ilham-febrianto-b330a7216',
  );
}
