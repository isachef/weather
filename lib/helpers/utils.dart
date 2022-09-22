//
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List getBackground(String icon) {
  String imageUrl;
  Color black = Colors.black;
  Color white = Colors.white;

  switch (icon) {
    case '01d':
      return [imageUrl = 'assets/img/main.jpg', white];

    case '02d':
      return [imageUrl = 'assets/img/cloudy.jpg', white];

    case '03d':
      return [imageUrl = 'assets/img/cloudy2x.jpg', black];

    case '04d':
      return [imageUrl = 'assets/img/cloudy3xjpg.jpg', white];

    case '09d':
      return [imageUrl = 'assets/img/rainy.jpg', white];

    case '10d':
      return [imageUrl = 'assets/img/rainy.jpg', white];

    case '11d':
      return [imageUrl = 'assets/img/thunder.jpg', white];

    case '13d':
      return [imageUrl = 'assets/img/snow.webp', black];

    case '50d':
      return [imageUrl = 'assets/img/fogy.webp', black];

    default:
      {
        return [imageUrl = 'assets/img/blue_background_img.png', white];
      }
  }
}
