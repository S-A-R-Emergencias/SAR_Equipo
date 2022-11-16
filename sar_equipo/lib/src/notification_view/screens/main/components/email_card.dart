import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../../global/environment.dart';
import '../../../constants.dart';
import '../../../extensions.dart';
import '../../../models/Email.dart';

class EmailCard extends StatefulWidget {
  const EmailCard({
    Key? key,
    this.isActive = true,
    required this.email,
    required this.press,
  }) : super(key: key);

  final bool isActive;
  final Email email;
  final VoidCallback press;

  @override
  State<EmailCard> createState() => _EmailCardState();
}

class _EmailCardState extends State<EmailCard> {
  String imageN = "";
  @override
  void initState() {
    if (widget.email.image == "") {
      imageN = imageGlobaAnom;
    } else {
      imageN = widget.email.image;
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      child: InkWell(
        onTap: widget.press,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 40,
                  right: kDefaultPadding,
                  top: kDefaultPadding,
                  bottom: kDefaultPadding),
              decoration: BoxDecoration(
                color: widget.isActive ? kPrimaryColor : kBgDarkColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 32,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: Image.memory(base64Decode(imageN),width: 190,fit: BoxFit.fitWidth).image
                        ),
                      ),
                      const SizedBox(width: kDefaultPadding / 2),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: "${widget.email.name} \n",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: widget.isActive ? Colors.white : kTextColor,
                            ),
                            
                            children: [
                              TextSpan(
                                text: widget.email.type,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                      color:
                                          widget.isActive ? Colors.white : kTextColor,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            DateTime.parse(widget.email.time).hour.toString() + ":" + DateTime.parse(widget.email.time).minute.toString(),
                            style:
                                Theme.of(context).textTheme.caption?.copyWith(
                                      color: widget.isActive ? Colors.white70 : null,
                                    ),
                          ),
                          const SizedBox(height: 5),
                          if (widget.email.isChecked)
                            WebsafeSvg.asset(
                              "assets/Icons/Paperclip.svg",
                              color: widget.isActive ? Colors.white70 : kGrayColor,
                            )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  Text(
                    widget.email.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption?.copyWith(
                          height: 1.5,
                          color: widget.isActive ? Colors.white70 : null,
                        ),
                  )
                ],
              ),
            ).addNeumorphism(
              blurRadius: 15,
              borderRadius: 15,
              offset: const Offset(5, 5),
              topShadowColor: Colors.white60,
              bottomShadowColor: const Color(0xFF234395).withOpacity(0.15),
            ),
            if (!widget.email.isChecked)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kBadgeColor,
                  ),
                ).addNeumorphism(
                  blurRadius: 4,
                  borderRadius: 8,
                  offset: const Offset(2, 2),
                ),
              ),
            // ignore: unnecessary_null_comparison
            if (widget.email.tagColor != null)
              Positioned(
                left: -35,
                top: 0,
                child: WebsafeSvg.asset(
                  "assets/Icons/line.svg",
                  height: 110,
                  color: widget.email.tagColor,
                ),
              )
          ],
        ),
      ),
    );
  }
}
