import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_report_app/common/widgets/custom_cahced_network_image.dart';

class FullmageScreen extends StatelessWidget {
  const FullmageScreen({super.key, this.fileImage, this.remoteUrl});

  final String? fileImage;
  final String? remoteUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onVerticalDragUpdate: (details) {},
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity! < -500) {
            Get.back();
          }
        },
        child: SafeArea(
          child: Stack(
            children: [
              if (remoteUrl != null && fileImage == null)
                Container(
                  margin: Platform.isAndroid
                      ? const EdgeInsets.only(top: 50)
                      : null,
                  child: Hero(
                      tag: 'image',
                      child: CustomCahcedNetworkImage(url: remoteUrl!)),
                ),
              if (remoteUrl == null && fileImage != null)
                Container(
                  margin: Platform.isAndroid
                      ? const EdgeInsets.only(top: 50)
                      : null,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File(fileImage!)),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              IconButton(
                onPressed: Get.back,
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
