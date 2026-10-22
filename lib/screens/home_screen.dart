import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/routes.dart';
import '../viewmodels/course_viewmodel.dart';
import '../viewmodels/profile_viewmodel.dart';
import '../widgets/profile_photo.dart';

/// Layar 1: Beranda (dashboard mahasiswa).
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profil = context.watch<ProfileViewModel>();
    final matkul = context.watch<CourseViewModel>();
    final mhs = profil.mahasiswa;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        actions: [
          IconButton(
            tooltip: profil.isDark ? 'Mode terang' : 'Mode gelap',
            icon: Icon(profil.isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => profil.toggleTema(!profil.isDark),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Kartu sapaan
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: scheme.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                ProfilePhoto(
                    asset: mhs.fotoAsset, inisial: mhs.inisial, size: 72),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Selamat datang,',
                          style: TextStyle(
                              color: scheme.onPrimary.withAlpha(200))),
                      const SizedBox(height: 2),
                      Text(
                        mhs.nama,
                        style: TextStyle(
                          color: scheme.onPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'NIM ${mhs.nim} • ${mhs.prodi}',
                        style: TextStyle(
                            color: scheme.onPrimary.withAlpha(220),
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Ringkasan akademik
          Row(
            children: [
              _StatCard(
                  icon: Icons.school,
                  label: 'Semester',
                  value: '${mhs.semester}'),
              const SizedBox(width: 10),
              _StatCard(
                  icon: Icons.menu_book,
                  label: 'Mata Kuliah',
                  value: '${matkul.jumlahMk}'),
              const SizedBox(width: 10),
              _StatCard(
                  icon: Icons.stacked_bar_chart,
                  label: 'Total SKS',
                  value: '${matkul.totalSks}'),
            ],
          ),
          const SizedBox(height: 24),

          Text('Menu Utama',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),

          // Menu navigasi -> Navigator.pushNamed(route)
          Row(
            children: [
              _MenuTile(
                icon: Icons.person,
                label: 'Profil',
                onTap: () => Navigator.pushNamed(context, AppRoutes.profil),
              ),
              const SizedBox(width: 12),
              _MenuTile(
                icon: Icons.library_books,
                label: 'Mata Kuliah',
                onTap: () => Navigator.pushNamed(context, AppRoutes.matkul),
              ),
              const SizedBox(width: 12),
              _MenuTile(
                icon: Icons.contact_phone,
                label: 'Kontak',
                onTap: () => Navigator.pushNamed(context, AppRoutes.kontak),
              ),
            ],
          ),
          const SizedBox(height: 24),

          Card(
            child: ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text('Kelas ${mhs.kelas}'),
              subtitle: Text(
                  'Semester ${mhs.semester} • ${matkul.totalSks} SKS diambil'),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatCard(
      {required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Expanded(
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Column(
            children: [
              Icon(icon, color: scheme.primary),
              const SizedBox(height: 6),
              Text(value,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              Text(label, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _MenuTile(
      {required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            color: scheme.primaryContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Icon(icon, size: 30, color: scheme.onPrimaryContainer),
              const SizedBox(height: 8),
              Text(label,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: scheme.onPrimaryContainer)),
            ],
          ),
        ),
      ),
    );
  }
}
