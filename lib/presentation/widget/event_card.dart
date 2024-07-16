import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu_tea/extension/context_extension.dart';
import 'package:smart_edu_tea/style/style_scheme.dart';
import 'package:smart_edu_tea/util/format_util.dart';

import '../../entity/event.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final Color color;
  final Function(Event) onTap;
  final EdgeInsetsGeometry contentPadding;

  EventCard({
    super.key,
    required this.event,
    required this.onTap,
    required this.color,
    this.contentPadding = const EdgeInsets.all(8.0),
  });

  final pushNotifications = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final mtheme=context.theme;
    return LayoutBuilder(
      builder: (context, constraints){
        return Container(
          width: constraints.maxWidth,
          padding: contentPadding,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Chip(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                side: BorderSide.none,
                color: WidgetStatePropertyAll<Color>(mtheme.colorScheme.secondaryContainer,),
                label: Text(
                  event.type,
                  style: TextStyle(
                    color: mtheme.colorScheme.primary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: StyleScheme.engFontFamily,
                  ),
                ),
              ),
              SizedBox(height: contentPadding.vertical*0.4,),
              Text(
                event.title,
                style: mtheme.textTheme.titleMedium?.copyWith(
                  color: mtheme.colorScheme.onSurface,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: contentPadding.vertical*0.2,),
              Text(
                event.shortDesc,
                style: mtheme.textTheme.bodyMedium?.copyWith(
                  color: mtheme.colorScheme.onSurface,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: contentPadding.vertical*0.2,),
              Chip(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                side: BorderSide.none,
                color: WidgetStatePropertyAll<Color>(Colors.grey.withOpacity(0.2),),
                label: Text(
                  FormatUtil.dateMonthShort(event.time),
                  style: TextStyle(
                    color: mtheme.colorScheme.secondary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: StyleScheme.engFontFamily,
                  ),
                ),
              ),
              SizedBox(height: contentPadding.vertical*0.3,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: ()=>onTap(event),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(mtheme.colorScheme.secondaryContainer,),
                      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h)),
                      shape: WidgetStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                      shadowColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
                    ),
                    child: Text(
                      'Details',
                      style: TextStyle(
                        color: mtheme.colorScheme.primary,
                        letterSpacing: -0.3,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: StyleScheme.engFontFamily,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: ()=>onTap(event),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(mtheme.colorScheme.secondaryContainer,),
                      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h)),
                      shape: WidgetStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                      shadowColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
                    ),
                    child: Text(
                      'Notion File',
                      style: TextStyle(
                        color: mtheme.colorScheme.primary,
                        letterSpacing: -0.3,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: StyleScheme.engFontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}