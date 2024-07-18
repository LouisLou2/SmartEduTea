import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu_tea/entity/room_apply_record.dart';
import 'package:smart_edu_tea/extension/context_extension.dart';
import 'package:smart_edu_tea/presentation/widget/leading_title.dart';
import 'package:smart_edu_tea/state/classroom_apply_prov.dart';
import 'package:smart_edu_tea/style/style_scheme.dart';

import '../../state/prov_manager.dart';

class ClassroomrReserveDetailSheet extends StatelessWidget {

  ClassroomrReserveDetailSheet({super.key, required this.side});
  final claProv = ProvManager.classroomRecordProvider;
  final ShadSheetSide side;

  @override
  Widget build(BuildContext context) {
    final mtheme = context.theme;
    final RoomApplyRecord record = claProv.records[claProv.openIndex];
    return ShadSheet(
      backgroundColor: mtheme.colorScheme.surface,
      constraints: side == ShadSheetSide.left || side == ShadSheetSide.right
          ? const BoxConstraints(maxWidth: 512)
          : null,
      title: Text(
        'Reservation Details',
        style: TextStyle(
          fontSize: 26.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.5,
          fontFamily: StyleScheme.engFontFamily,
        ),
      ),
      description: const Text(
        "The details of the reservation are shown below. Once It's submitted, it become uneditable.",
      ),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LeadingTitle(
                title: 'Where & When',
                fontSize: 20.sp,
                barColor: mtheme.colorScheme.error,
              ),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: mtheme.colorScheme.surface,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(
                    color: mtheme.colorScheme.outlineVariant,
                    width: 0.5,
                  ),
                ),
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 10,
                    childAspectRatio: 6,
                  ),
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          LucideIcons.school,
                          color: context.theme.colorScheme.outline,
                        ),
                        SizedBox(width: 5.w,),
                        Text(
                          '地点',
                          style: context.theme.textTheme.titleMedium?.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: context.theme.colorScheme.outline,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      record.placeStr,
                      style: context.theme.textTheme.titleMedium?.copyWith(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.5,
                        wordSpacing: 1.5,
                        fontFamily: StyleScheme.cnFontFamily,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_balance_sharp,
                          color: context.theme.colorScheme.outline,
                        ),
                        SizedBox(width: 5.w,),
                        Text(
                          '时间',
                          style: context.theme.textTheme.titleMedium?.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.5,
                            color: context.theme.colorScheme.outline,
                            fontFamily: StyleScheme.engFontFamily,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      record.timeStr,
                      style: StyleScheme.cn_onSuf_500_LPN03(
                        size: 17.sp,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          LucideIcons.house,
                          color: context.theme.colorScheme.outline,
                        ),
                        SizedBox(width: 5.w,),
                        Text(
                          '节次',
                          style: context.theme.textTheme.titleMedium?.copyWith(
                            fontSize: 15.sp,
                            letterSpacing: -0.5,
                            fontWeight: FontWeight.w500,
                            fontFamily: StyleScheme.engFontFamily,
                            color: context.theme.colorScheme.outline,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      record.periodStr,
                      style: context.theme.textTheme.titleMedium?.copyWith(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: StyleScheme.engFontFamily,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          LucideIcons.timer,
                          color: context.theme.colorScheme.outline,
                        ),
                        SizedBox(width: 5.w,),
                        Text(
                          '编号',
                          style: context.theme.textTheme.titleMedium?.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: context.theme.colorScheme.outline,
                            fontFamily: StyleScheme.engFontFamily,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      record.recordId.toString(),
                      style: context.theme.textTheme.titleMedium?.copyWith(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.5,
                        wordSpacing: 1.5,
                        fontFamily: StyleScheme.engFontFamily,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.only(
                  left: 0,
                  top: 0,
                  right: 15.w,
                  bottom: 0,
                ),
                decoration: BoxDecoration(
                  color: mtheme.colorScheme.secondaryContainer,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(0),
                  ),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      VerticalDivider(
                        color: mtheme.colorScheme.error,
                        thickness: 4,
                        width: 4,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                record.reasonStr,
                                style: context.textTheme.titleMedium?.copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: mtheme.colorScheme.primary,
                                  fontFamily: StyleScheme.engFontFamily,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                record.reasonDetail,
                                softWrap: true,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: context.textTheme.titleMedium?.copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: mtheme.colorScheme.primary,
                                  fontFamily: StyleScheme.engFontFamily,
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              LeadingTitle(
                title: '处理意见',
                fontSize: 20.sp,
                barColor: mtheme.colorScheme.primary,
                fontFamily: StyleScheme.cnFontFamily,
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  record.resStr,
                  softWrap: true,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: StyleScheme.engFontFamily,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}