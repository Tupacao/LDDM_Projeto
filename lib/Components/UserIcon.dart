import 'package:flutter/material.dart';
import 'package:projeto/assets/Colors.dart';

class UserIcon extends StatelessWidget implements PreferredSizeWidget {
   final bool showCross;

  const UserIcon({
    super.key,
    required this.showCross,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: secondaryColor,
      flexibleSpace: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/user/:data");
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor,
                ),
                child: const Icon(
                  Icons.account_circle,
                  color: secondaryColor,
                  size: 50,
                ),
              ),
            ),
          ],
        ),
      ),
      automaticallyImplyLeading: showCross,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
