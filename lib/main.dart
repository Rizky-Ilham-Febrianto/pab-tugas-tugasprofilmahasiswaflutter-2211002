import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/routes.dart';
import 'viewmodels/course_viewmodel.dart';
import 'viewmodels/profile_viewmodel.dart';

void main() {
  runApp(
    // ViewModel diletakkan di atas MaterialApp agar state tidak hilang
    // ketika layar berpindah atau UI dibuat ulang (rotasi).
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => CourseViewModel()),
      ],
      child: const ProfilMahasiswaApp(),
    ),
  );
}

class ProfilMahasiswaApp extends StatefulWidget {
  const ProfilMahasiswaApp({super.key});

  @override
  State<ProfilMahasiswaApp> createState() => _ProfilMahasiswaAppState();
}

class _ProfilMahasiswaAppState extends State<ProfilMahasiswaApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // Memantau lifecycle aplikasi (resumed, inactive, paused, ...).
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    context.read<ProfileViewModel>().updateLifecycle(state);
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ProfileViewModel>().themeMode;

    return MaterialApp(
      title: 'Profil Mahasiswa',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.dark,
      ),
      initialRoute: AppRoutes.beranda,
      routes: AppRoutes.table,
    );
  }
}
