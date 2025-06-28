import 'package:bookly/core/utils/style.dart';
import 'package:flutter/widgets.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});

  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: Style.textStyle20,
        textAlign: TextAlign.center,
      ),
    );
  }
}
