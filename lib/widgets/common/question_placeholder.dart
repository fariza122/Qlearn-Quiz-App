import 'package:easy_separator/easy_separator.dart';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class QPlaceHolder extends StatelessWidget {
  const QPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var line = Container(
      width: double.infinity,
      height: 12,
      color: Colors.grey,
    );

    var answer = Container(
      width: double.infinity,
      height: 50,
      color: Colors.grey,
    );

    return Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.blueGrey.withOpacity(0.2),
        child: EasySeparatedColumn(
            children: [
              line,
              line,
              line,
              const SizedBox(
                height: 3,
              ),
              answer,
              answer,
              answer,
              answer
            ],
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 15,
              );
            }));
  }
}
