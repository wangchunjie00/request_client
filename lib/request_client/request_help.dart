import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class Helper {
  static showToast(text) {
    if (text == null || text.toString().isEmpty) return;
    BotToast.showText(
      text: text.toString(),
      align: Alignment.center,
      contentColor: Colors.white,
      textStyle: TextStyle(color: Colors.black54),
    );
  }

  static void showLoading({String text = "Loading..."}) {
    hideLoading();
    BotToast.showCustomLoading(toastBuilder: (context) {
      return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color:  Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 4),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                  Colors.black54),
            ),
            const SizedBox(height: 12),
            Text(
              text,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      );
    });
  }

  static void hideLoading() {
    BotToast.closeAllLoading();
  }
}
