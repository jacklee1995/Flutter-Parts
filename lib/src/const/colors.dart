// 定义Element Plus的颜色
import 'package:flutter/material.dart';

import 'enums.dart';

Map<TypeEnum, Color> lightColors = {
  TypeEnum.primary: const Color.fromRGBO(231, 240, 250, 1),
  TypeEnum.success: const Color.fromRGBO(240, 249, 235, 1),
  TypeEnum.info: const Color.fromRGBO(244, 244, 245, 1),
  TypeEnum.warning: const Color.fromRGBO(253, 246, 236, 1),
  TypeEnum.danger: const Color.fromRGBO(254, 240, 240, 1),
};

Map<TypeEnum, Color> darkColors = {
  TypeEnum.primary: const Color.fromRGBO(53, 131, 211, 1),
  TypeEnum.success: const Color.fromRGBO(103, 194, 58, 1),
  TypeEnum.info: const Color.fromRGBO(144, 147, 153, 1),
  TypeEnum.warning: const Color.fromRGBO(230, 162, 60, 1),
  TypeEnum.danger: const Color.fromRGBO(245, 108, 108, 1),
};
