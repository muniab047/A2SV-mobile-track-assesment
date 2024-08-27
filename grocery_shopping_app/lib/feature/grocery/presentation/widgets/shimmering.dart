import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class Shimmering extends StatelessWidget {
  const Shimmering({super.key});

  @override
  Widget build(BuildContext context) {
    double ratio(double num) {
      return num * MediaQuery.of(context).size.width / 500;
    }

    return Scaffold(
      appBar: AppBar(
          toolbarHeight: ratio(80),
          title: Container(
            padding: EdgeInsets.fromLTRB(0, ratio(0), ratio(10), ratio(20)),
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 10,
                        height: 15,
                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Colors.white,),
                      ),
                    ),
                    subtitle: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 10,
                        height: 15,
                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Colors.white,),
                      ),
                    ),
                    leading: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 40,
                    height: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 200,
                  height: 30,
                  
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Colors.white,),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
              ),
            ]),
            SizedBox(
              height: ratio(20),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: ratio(10),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: ratio(10),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
