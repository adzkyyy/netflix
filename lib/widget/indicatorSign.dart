import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix/widget/bgColor.dart';


class IndicatorSignIn extends StatelessWidget {

  final String label;
  final bool isLoading;
  final VoidCallback onPressed;

  const IndicatorSignIn(
    {
      Key key, 
     @required this.label, 
     @required this.isLoading, 
     @required this.onPressed
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          Expanded(
            child: Center(
              child: _LoadingIndicator(
                isLoading: isLoading,
              ),
            ),
          ),
          ButtonSign(
            onPressed: onPressed,
          ),
        ]
      ),
    );
  }
}

class IndicatorSignUp extends StatelessWidget {

  final String label;
  final bool isLoading;
  final VoidCallback onPressed;

  const IndicatorSignUp(
    {
      Key key, 
     @required this.label, 
     @required this.isLoading, 
     @required this.onPressed
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          Expanded(
            child: Center(
              child: _LoadingIndicator(
                isLoading: isLoading,
              ),
            ),
          ),
          ButtonSign(
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {

  const _LoadingIndicator(
    {
      Key key,
      @required this.isLoading,
    }
  ) : super (key: key);

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 90.0
      ),
      child: Visibility(
        visible: isLoading,
        child: LinearProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.black),
          backgroundColor: BgColor.pinkCerah,
        ),
      ),
    );
  }
}

class ButtonSign extends StatelessWidget {

  const ButtonSign(
    {
      Key key,
      @required this.onPressed
    }
  );

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      fillColor: BgColor.darkBlue,
      splashColor: BgColor.pinkCerah,
      padding: const EdgeInsets.all(22.0),
      shape: const CircleBorder(),
      child: const Icon(
        FontAwesomeIcons.longArrowAltRight,
        color: Colors.white,
        size: 25.0,
      ),
    );
  }
}