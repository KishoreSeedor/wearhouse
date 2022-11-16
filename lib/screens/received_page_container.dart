import 'package:flutter/material.dart';
import '../const/color.dart';

class RecievedContainer extends StatefulWidget {
  const RecievedContainer({
    Key? key,
    required this.onTap,
    required this.height,
    required this.width,
    required this.companyName,
    required this.createDate,
    required this.displayName,
    required this.origin,
  }) : super(key: key);

  final double height;
  final double width;
  final String companyName;
  final String createDate;
  final String origin;
  final String displayName;
  final GestureTapCancelCallback? onTap;

  @override
  State<RecievedContainer> createState() => _RecievedContainerState();
}

class _RecievedContainerState extends State<RecievedContainer> {
  @override
  Widget build(BuildContext context) {
    // var hi = MediaQuery.of(context).size.height;
    // var wi = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.companyName,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                height: widget.height * 0.015,
                width: widget.width * 0.05,
                decoration: BoxDecoration(
                    color: CustomColor.yellow,
                    borderRadius: BorderRadius.circular(3)),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.createDate,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.displayName,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.origin,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
