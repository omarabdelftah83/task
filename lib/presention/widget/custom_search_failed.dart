import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task/utils/string_manager.dart';

import '../../utils/route.dart';

class CustomSearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.search);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child:  Row(
          children: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: null, // لا حاجة لعملية فتح البحث هنا
            ),
            Text(
              AppString.search,
              style: TextStyle(fontSize: 16),
            ).tr(),
          ],
        ),
      ),
    );
  }
}
