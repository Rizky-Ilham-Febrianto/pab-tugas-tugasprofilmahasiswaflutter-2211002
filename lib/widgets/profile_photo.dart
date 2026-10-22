import 'package:flutter/material.dart';

/// Foto profil bulat. Jika file foto belum ada, tampilkan inisial.
class ProfilePhoto extends StatelessWidget {
  final String asset;
  final String inisial;
  final double size;

  const ProfilePhoto({
    super.key,
    required this.asset,
    required this.inisial,
    this.size = 96,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: ClipOval(
        child: Image.asset(
          asset,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            color: scheme.primaryContainer,
            alignment: Alignment.center,
            child: Text(
              inisial,
              style: TextStyle(
                fontSize: size / 2.5,
                fontWeight: FontWeight.bold,
                color: scheme.onPrimaryContainer,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
