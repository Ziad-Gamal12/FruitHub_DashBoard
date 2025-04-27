// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/Utils/assets.dart';
import 'package:fruits_hub_dashboard/Core/Utils/textStyles.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.appBartitle,
  });
  final String appBartitle;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      leadingWidth: 40,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Transform.rotate(
            angle: 3.14,
            child: SvgPicture.asset(
              Assets.assetsImagesArrowleft,
              height: 20,
              width: 20,
            ),
          ),
        ),
      ),
      title: Text(
        appBartitle,
        style: textStyles.textstyle19.copyWith(
          color: Colors.black,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
