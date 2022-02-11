import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrimaryButton extends StatelessWidget {
  final IconData? _icon;
  final String? _text;
  final double? _width;
  final double? _height;

  const PrimaryButton(
      {Key? key,
      double? width,
      double? height = 48,
      String? text,
      IconData? icon})
      : _width = width,
        _height = height,
        _icon = icon,
        _text = text,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: _width,
        height: _height,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_icon != null) Icon(_icon, key: const Key('icon')),
              Text(_text ?? AppLocalizations.of(context)!.nextPageButtonText,
                  key: const Key('text'))
            ],
          ),
        ),
      ),
    );
  }
}
