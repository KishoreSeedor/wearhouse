import 'package:flutter/material.dart';
import 'package:wearhouse/screens/PutAway/put_away_ui_design/put_away_orders_select.dart';

import '../../../const/color.dart';

class PutAwayOrderProdWidget extends StatelessWidget {
  const PutAwayOrderProdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(PutAwayOrdersSelect.routeName);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'companyName',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                height: size.height * 0.015,
                width: size.width * 0.05,
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
            'createDate',
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'displayName',
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'origin',
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
