import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCahcedNetworkImage extends StatelessWidget {
  const CustomCahcedNetworkImage({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
