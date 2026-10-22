import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/routes.dart';
import '../viewmodels/course_viewmodel.dart';
import '../viewmodels/profile_viewmodel.dart';
import '../widgets/info_row.dart';

/// Layar 4: Detail satu mata kuliah.
/// Mata kuliah terpilih disimpan di CourseViewModel,
/// sehingga tetap aman saat layar diputar.
class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CourseViewModel>();
    final mhs = context.read<ProfileViewModel>().mahasiswa;
    final mk = vm.mkTerpilih;
    final scheme = Theme.of(context).colorScheme;
    final persen = (vm.persenBobot * 100).toStringAsFixed(1);

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Mata Kuliah')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: scheme.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.menu_book, size: 36, color: scheme.onPrimary),
                const SizedBox(height: 12),
                Text(mk.nama,
                    style: TextStyle(
                        color: scheme.onPrimary,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text('${mk.sks} SKS',
                    style: TextStyle(color: scheme.onPrimary.withAlpha(220))),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  InfoRow(
                      icon: Icons.title,
                      label: 'Nama Mata Kuliah',
                      value: mk.nama),
                  const Divider(height: 1),
                  InfoRow(
                      icon: Icons.stacked_bar_chart,
                      label: 'Bobot',
                      value: '${mk.sks} SKS'),
                  const Divider(height: 1),
                  InfoRow(
                      icon: Icons.calendar_month,
                      label: 'Semester',
                      value: 'Semester ${mhs.semester}'),
                  const Divider(height: 1),
                  InfoRow(
                      icon: Icons.groups, label: 'Kelas', value: mhs.kelas),
                  const Divider(height: 1),
                  InfoRow(
                      icon: Icons.computer,
                      label: 'Program Studi',
                      value: mhs.prodi),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Porsi dari total ${vm.totalSks} SKS: $persen%',
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: vm.persenBobot,
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Kembali'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton.icon(
                  onPressed: () => Navigator.popUntil(
                      context, ModalRoute.withName(AppRoutes.beranda)),
                  icon: const Icon(Icons.home),
                  label: const Text('Beranda'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
