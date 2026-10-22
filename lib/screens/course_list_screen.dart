import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/routes.dart';
import '../viewmodels/course_viewmodel.dart';
import '../viewmodels/profile_viewmodel.dart';

/// Layar 3: Daftar mata kuliah semester berjalan.
class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CourseViewModel>();
    final mhs = context.read<ProfileViewModel>().mahasiswa;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Mata Kuliah')),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: scheme.primaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'Semester ${mhs.semester} • Kelas ${mhs.kelas}\n'
              '${vm.jumlahMk} mata kuliah • ${vm.totalSks} SKS',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                  color: scheme.onPrimaryContainer),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              itemCount: vm.daftar.length,
              itemBuilder: (context, i) {
                final mk = vm.daftar[i];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: scheme.primary,
                      foregroundColor: scheme.onPrimary,
                      child: Text('${i + 1}'),
                    ),
                    title: Text(mk.nama,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text('${mk.sks} SKS'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // Event UI -> ViewModel menyimpan pilihan -> navigasi
                      vm.pilih(i);
                      Navigator.pushNamed(context, AppRoutes.detailMatkul);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
