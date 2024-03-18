import 'package:flutter/material.dart';

class EventButton extends StatelessWidget {
  final String urlImage;
  final String textButton;
  final VoidCallback? onTapButton;

  const EventButton({
    super.key,
    required this.urlImage,
    required this.textButton,
    this.onTapButton,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 80,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        color: Colors.white,
        child: InkWell(
          splashColor: Colors.black26,
          onTap: onTapButton,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 5,
              ),
              Ink.image(
                image: AssetImage(urlImage),
                width: 50,
                height: 50,
              ),
              Center(child: Text(textButton)),
            ],
          ),
        ),
      ),
    );
  }
}
