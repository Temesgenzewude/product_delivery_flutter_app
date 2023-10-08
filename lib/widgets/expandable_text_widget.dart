import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firsHalf;
  late String secondHalf;
  bool hiddenText = true;

  double textHeight =
      AppDimensions.screenHeight / (AppDimensions.screenHeight / 150);

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firsHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(
        textHeight.toInt(),
      );
    } else {
      firsHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              height: 1.8,
              text: firsHalf,
              size: AppDimensions.font16,
              color: AppColors.paraColor,
            )
          : Column(
              children: [
                
                SmallText(
                  height: 1.8,
                  size: AppDimensions.font16,
                  color: AppColors.paraColor,
                  text: hiddenText ? ("$firsHalf...") : (firsHalf + secondHalf),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(children: [
                    SmallText(
                      size: AppDimensions.font16,
                      text: hiddenText ? "Show more" : "Show less",
                      color: AppColors.mainColor,
                    ),
                    Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.mainColor),
                  ]),
                )
              ],
            ),
    );
  }
}
