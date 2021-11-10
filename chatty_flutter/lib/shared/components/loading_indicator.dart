import 'package:chatty/shared/theme/theme.dart';
import 'package:flutter/material.dart';

class ChattyLoadingIndicator extends StatelessWidget {
  const ChattyLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 64, maxWidth: 64),
      child: const CircularProgressIndicator(color: Palette.white),
    );
  }
}
