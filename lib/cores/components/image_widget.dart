import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/color.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    Key? key,
    required this.imageUrl,
    required this.imageTypes,
    this.useIconColor = false,
  }) : super(key: key);

  final String imageUrl;
  final ImageTypes imageTypes;
  final bool useIconColor;

  @override
  Widget build(BuildContext context) {
    switch (imageTypes) {
      case ImageTypes.network:
        return CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
          errorWidget: (_, __, ___) => Container(
            color: kcGrey400,
            child: const Center(
              child: Icon(Icons.error),
            ),
          ),
          placeholder: (_, __) =>
              const Center(child: CircularProgressIndicator()),
        );

      case ImageTypes.file:
        return Image.file(
          File(imageUrl),
          fit: BoxFit.fill,
          errorBuilder: (_, __, ___) => Container(
            color: kcGrey400,
            child: const Center(
              child: Icon(Icons.error),
            ),
          ),
        );
      case ImageTypes.asset:
        return Image.asset(
          imageUrl,
          fit: BoxFit.fill,
          errorBuilder: (_, __, e) {
            log(e.toString());
            return Container(
              color: kcGrey400,
              child: const Center(
                child: Icon(Icons.error),
              ),
            );
          },
        );

      case ImageTypes.none:
        return const Placeholder();

      case ImageTypes.profile:
        return CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
          errorWidget: (_, __, ___) => const Center(child: Icon(Icons.person)),
          placeholder: (_, __) =>
              const Center(child: CircularProgressIndicator()),
        );
      case ImageTypes.svg:
        return SvgPicture.asset(
          imageUrl,
          color: useIconColor ? kcPrimaryColor.withOpacity(0.6) : null,
        );
    }
  }
}

enum ImageTypes { network, file, asset, profile, none, svg }