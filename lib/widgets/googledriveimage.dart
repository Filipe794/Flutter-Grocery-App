import 'package:flutter/material.dart';

class GoogleDriveImage extends StatelessWidget {
  final String googleDriveUrl;

  const GoogleDriveImage({super.key, required this.googleDriveUrl});

  @override
  Widget build(BuildContext context) {

    String extractFileId(String url) {

      RegExp regExp = RegExp(r'd/([^/]+)');
      Match? match = regExp.firstMatch(url);
      if (match != null) {
        return match.group(1)!;
      }
      throw Exception("URL do Google Drive inválida");
    }

    String imageUrl = 'https://drive.google.com/uc?id=${extractFileId(googleDriveUrl)}';

    return Image.network(imageUrl);
  }
}