import 'package:flutter/material.dart';
import 'package:tadweer/features/home/presentation/widgets/profile_list_tile.dart';

class ChangeAcountImage extends StatelessWidget {
  const ChangeAcountImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileListTile(
      title: 'Change Account Image',
      onPressed: () async {},
      icon: Icons.camera_alt_outlined,
    );
  }
}
