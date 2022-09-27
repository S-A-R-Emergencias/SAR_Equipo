import 'package:flutter/material.dart';

import '../../models/Email.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constants.dart';
import 'components/header.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  final Email email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Header(),
            Divider(thickness: 1),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      maxRadius: 24,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(emails[0].image),
                    ),
                    SizedBox(width: kDefaultPadding),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        text: emails[0].name,
                                        style:
                                            Theme.of(context).textTheme.button,
                                        children: [
                                          TextSpan(
                                              text:
                                                  "  <jhonn.atkins@gmail.com>\n",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "Incendio",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: kDefaultPadding / 2),
                              Text(
                                "Today at 15:32",
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                          SizedBox(height: kDefaultPadding),
                          LayoutBuilder(
                            builder: (context, constraints) => SizedBox(
                              width: constraints.maxWidth > 850
                                  ? 800
                                  : constraints.maxWidth,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Auxilio!!, \n \nNecesito su ayuda de inmediato tenemos una emergencia. Mi casa esta en llamas debido a una fuga de gas, Aun hay gente dentro del lugar, \n \n no se su estado pero lleguen lo antes posible.Love you, \n\nJhonn",
                                    style: TextStyle(
                                      height: 1.5,
                                      color: Color(0xFF4D5875),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(height: kDefaultPadding),
                                  Row(
                                    children: [
                                      Text(
                                        "Reporte",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Download All",
                                        style:
                                            Theme.of(context).textTheme.caption,
                                      ),
                                      SizedBox(width: kDefaultPadding / 4),
                                      WebsafeSvg.asset(
                                        "assets/Icons/Download.svg",
                                        height: 16,
                                        color: kGrayColor,
                                      ),
                                    ],
                                  ),
                                  Divider(thickness: 1),
                                  SizedBox(height: kDefaultPadding / 2),
                                  SizedBox(
                                    height: 200,
                                    // child: StaggeredGridView.countBuilder(
                                    //   physics: NeverScrollableScrollPhysics(),
                                    //   crossAxisCount: 4,
                                    //   itemCount: 3,
                                    //   itemBuilder:
                                    //       (BuildContext context, int index) =>
                                    //           ClipRRect(
                                    //     borderRadius: BorderRadius.circular(8),
                                    //     child: Image.asset(
                                    //       "assets/images/Img_$index.png",
                                    //       fit: BoxFit.cover,
                                    //     ),
                                    //   ),
                                    //   staggeredTileBuilder: (int index) =>
                                    //       StaggeredTile.count(
                                    //     2,
                                    //     index.isOdd ? 2 : 1,
                                    //   ),
                                    //   mainAxisSpacing: kDefaultPadding,
                                    //   crossAxisSpacing: kDefaultPadding,
                                    // ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
