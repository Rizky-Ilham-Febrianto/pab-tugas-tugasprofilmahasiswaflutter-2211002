import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../app/routes.dart';
import '../viewmodels/course_viewmodel.dart';
import '../viewmodels/profile_viewmodel.dart';
import '../widgets/info_row.dart';
import '../widgets/profile_photo.dart';

/// Layar 2: Profil mahasiswa.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProfileViewModel>();
    final matkul = context.watch<CourseViewModel>();
    final mhs = vm.mahasiswa;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Header foto + nama
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(
              color: scheme.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                ProfilePhoto(
                    asset: mhs.fotoAsset, inisial: mhs.inisial, size: 110),
                const SizedBox(height: 12),
                Text(mhs.nama,
                    style: TextStyle(
                        color: scheme.onPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Mahasiswa ${mhs.prodi}',
                    style: TextStyle(color: scheme.onPrimary.withAlpha(220))),
                const SizedBox(height: 10),
                const Chip(
                  avatar:
                      Icon(Icons.check_circle, size: 18, color: Colors.green),
                  label: Text('Mahasiswa Aktif'),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Data diri
          Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  InfoRow(icon: Icons.badge, label: 'Nama', value: mhs.nama),
                  const Divider(height: 1),
                  InfoRow(icon: Icons.numbers, label: 'NIM', value: mhs.nim),
                  const Divider(height: 1),
                  InfoRow(
                      icon: Icons.computer,
                      label: 'Program Studi',
                      value: mhs.prodi),
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
                      icon: Icons.stacked_bar_chart,
                      label: 'Total SKS Semester Ini',
                      value: '${matkul.totalSks} SKS'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Fitur tambahan
          Card(
            margin: EdgeInsets.zero,
            child: Column(
              children: [
                SwitchListTile(
                  secondary: const Icon(Icons.dark_mode),
                  title: const Text('Mode Gelap'),
                  subtitle: const Text('Disimpan di ViewModel'),
                  value: vm.isDark,
                  onChanged: vm.toggleTema,
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.autorenew),
                  title: const Text('Status Aplikasi (Lifecycle)'),
                  subtitle: Text(vm.lifecycleLabel),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.copy),
                  title: const Text('Salin NIM'),
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: mhs.nim));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('NIM disalin')),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoutes.matkul),
                  icon: const Icon(Icons.library_books),
                  label: const Text('Mata Kuliah'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Kembali'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
