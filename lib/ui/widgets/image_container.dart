import 'package:antonx_flutter_boilerplate_3/ui/common/app_strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double radius;
  final String assets;
  final Color? color;

  /// This is for  local Asset
  final String? url;

  /// This one is for Network Image,
  final BoxFit fit;
//  final

  const ImageContainer({
    Key? key,
    this.height,
    this.width,
    this.assets = 'assets/icons/placeholder.png',
    this.radius = 0,
    this.url,
    this.fit = BoxFit.cover,
    this.color = Colors.transparent,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return url == null
        ? Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(radius),
                image: DecorationImage(
                  image: AssetImage(assets),
                  fit: fit,
                )),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: CachedNetworkImage(
              imageUrl: url!,
              placeholder: (context, url) => const ImageContainer(
                assets: placeholderImage,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: height,
              width: width,
              fadeInDuration: const Duration(milliseconds: 100),
              fit: fit,
            ),
          );
  }
}
