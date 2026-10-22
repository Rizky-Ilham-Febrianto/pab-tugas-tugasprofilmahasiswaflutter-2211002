import 'package:flutter/material.dart';

import '../data/mahasiswa_data.dart';

/// ViewModel profil: menyimpan UI State yang harus tetap ada
/// walaupun layar berpindah / diputar (rotasi).
class ProfileViewModel extends ChangeNotifier {
  final Mahasiswa mahasiswa = DataMahasiswa.profil;
  final Kontak kontak = DataMahasiswa.kontak;

  ThemeMode _themeMode = ThemeMode.light;
  AppLifecycleState _lifecycle = AppLifecycleState.resumed;

  ThemeMode get themeMode => _themeMode;
  bool get isDark => _themeMode == ThemeMode.dark;
  AppLifecycleState get lifecycle => _lifecycle;

  /// Event dari UI -> ViewModel mengubah state -> UI digambar ulang.
  void toggleTema(bool value) {
    _themeMode = value ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void updateLifecycle(AppLifecycleState state) {
    _lifecycle = state;
    debugPrint('[Lifecycle] ${state.name}');
    notifyListeners();
  }

  String get lifecycleLabel {
    switch (_lifecycle) {
      case AppLifecycleState.resumed:
        return 'Aktif (resumed)';
      case AppLifecycleState.inactive:
        return 'Tidak fokus (inactive)';
      case AppLifecycleState.paused:
        return 'Di latar belakang (paused)';
      case AppLifecycleState.detached:
        return 'Terlepas (detached)';
      case AppLifecycleState.hidden:
        return 'Tersembunyi (hidden)';
    }
  }
}
