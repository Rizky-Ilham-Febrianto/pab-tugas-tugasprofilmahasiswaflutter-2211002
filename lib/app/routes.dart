import 'package:flutter/material.dart';

import '../screens/contact_screen.dart';
import '../screens/course_detail_screen.dart';
import '../screens/course_list_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';

/// Daftar route (nama jalur) setiap destination.
class AppRoutes {
  AppRoutes._();

  static const String beranda = '/';
  static const String profil = '/profil';
  static const String matkul = '/matkul';
  static const String detailMatkul = '/matkul/detail';
  static const String kontak = '/kontak';

  static Map<String, WidgetBuilder> get table => {
        beranda: (_) => const HomeScreen(),
        profil: (_) => const ProfileScreen(),
        matkul: (_) => const CourseListScreen(),
        detailMatkul: (_) => const CourseDetailScreen(),
        kontak: (_) => const ContactScreen(),
      };
}
