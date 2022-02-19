
import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback tapSmsButton;

  const GeneralButton({Key? key, required this.title, required this.color, required this.tapSmsButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: tapSmsButton,
        style: ButtonStyle(

          backgroundColor: MaterialStateProperty.all<Color>(color),

        ),
        child:Text(title,
          style: Theme.of(context).textTheme.button,
        )


    );
  }
}
