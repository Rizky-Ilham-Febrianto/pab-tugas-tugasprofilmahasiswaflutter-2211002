import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../viewmodels/profile_viewmodel.dart';

/// Layar 5 (layar tambahan sesuai tugas): Kontak.
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  void _salin(BuildContext context, String label, String nilai) {
    Clipboard.setData(ClipboardData(text: nilai));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$label disalin')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProfileViewModel>();
    final kontak = vm.kontak;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Kontak')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Hubungi ${vm.mahasiswa.nama}',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text('Ketuk salah satu kontak untuk menyalin.',
              style: TextStyle(color: scheme.onSurfaceVariant)),
          const SizedBox(height: 16),
          _KontakCard(
            icon: Icons.phone,
            label: 'No. Telepon',
            value: kontak.telepon,
            onTap: () => _salin(context, 'No. telepon', kontak.telepon),
          ),
          _KontakCard(
            icon: Icons.email,
            label: 'Gmail',
            value: kontak.email,
            onTap: () => _salin(context, 'Email', kontak.email),
          ),
          _KontakCard(
            icon: Icons.work,
            label: 'LinkedIn',
            value: kontak.linkedin,
            onTap: () => _salin(context, 'LinkedIn', kontak.linkedin),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            label: const Text('Kembali'),
          ),
        ],
      ),
    );
  }
}

class _KontakCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  const _KontakCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: scheme.primaryContainer,
          foregroundColor: scheme.onPrimaryContainer,
          child: Icon(icon),
        ),
        title: Text(label),
        subtitle: Text(value),
        trailing: const Icon(Icons.copy, size: 20),
        onTap: onTap,
      ),
    );
  }
}
