import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:the_utils/the_utils.dart';

/// 通用图片组件，支持网络图片、Base64图片、本地资源图片以及占位符
class Img extends StatelessWidget {
  final String url;
  final BoxFit fit;
  final Placeholder placeholder;

  /// 创建一个 Img 组件
  ///
  /// 参数：
  /// - [url]: 图片的地址，可以是网络地址、Base64数据、本地资源路径
  /// - [fit]: 图片的适应方式，默认为 BoxFit.cover
  /// - [placeholder]: 在图片加载前的占位符，默认为空白的占位符
  const Img(
    this.url, {
    super.key,
    this.fit = BoxFit.cover,
    this.placeholder = const Placeholder(),
  });

  @override
  Widget build(BuildContext context) {
    if (StrUtil.isUrl(url)) {
      return Image.network(
        url,
        fit: fit,
      );
    } else if (StrUtil.isBase64(url)) {
      try {
        return Image.memory(base64Decode(url), fit: fit);
      } catch (e) {
        // Base64解码失败时的处理，可以返回默认图像或者显示错误占位符
        return placeholder;
      }
    } else if (StrUtil.isAsset(url)) {
      return Image.asset(url, fit: fit);
    } else {
      return FittedBox(
        fit: fit,
        child: placeholder,
      );
    }
  }
}
