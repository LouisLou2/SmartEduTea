import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu_tea/entity/course_brief.dart';
import 'package:smart_edu_tea/extension/context_extension.dart';
import 'package:smart_edu_tea/handler/course_list_handler.dart';
import 'package:smart_edu_tea/state/course_list_prov.dart';
import 'package:smart_edu_tea/state/prov_manager.dart';

import '../../style/style_scheme.dart';

class TeacherCourseList extends StatefulWidget {
  const TeacherCourseList({super.key});

  @override
  State<TeacherCourseList> createState() => _TeacherCourseListState();
}

class _TeacherCourseListState extends State<TeacherCourseList> with TickerProviderStateMixin{

  final CourseListProv _courseListProv = ProvManager.courseListProv;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      CourseListHandler.updateCourseList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final mtheme= context.theme;
    return Padding(
      padding: EdgeInsets.only(left: 15.w, top: 25.h, right: 10.w),
      child: Container(
        decoration: BoxDecoration(
          color: mtheme.colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          border: Border.all(
            color: mtheme.colorScheme.outlineVariant,
            width: 0.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 30.w,
                      maxHeight: 32.h,
                    ),
                    child: IconButton.outlined(
                      color: context.theme.colorScheme.outline,
                      icon: Icon(
                        Icons.arrow_back,
                        size: 18.sp,
                      ),
                      style: IconButton.styleFrom(
                        side: BorderSide(
                          color: context.theme.colorScheme.outlineVariant,
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(3.sp),
                      ),
                      onPressed: () {  },
                    ),
                  ),
                  SizedBox(width: 15.w,),
                  Text(
                    'My Courses',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.5,
                      fontFamily: StyleScheme.engFontFamily,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: context.theme.colorScheme.outlineVariant,
              thickness: 0.5,
              height: 0.5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
              child: TabBar(
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                controller: _tabController,
                indicatorPadding: const EdgeInsets.symmetric(vertical: 0),
                indicatorColor: context.theme.colorScheme.onSurface,
                unselectedLabelStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: StyleScheme.engFontFamily,
                ),
                labelStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: StyleScheme.engFontFamily,
                  color: context.theme.colorScheme.onSurface,
                ),
                unselectedLabelColor: context.theme.colorScheme.outline.withOpacity(0.9),
                tabs: const [
                  Tab(
                    text: 'All Course',
                  ),
                  Tab(
                    text: 'Required Course',
                  ),
                  Tab(
                    text: 'Elective Course',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Selector<CourseListProv, int>(
                selector: (context, prov) => prov.courses.length,
                shouldRebuild: (prev, next) => true,
                builder: (_,__,___){
                  return ListView.builder(
                    itemCount: _courseListProv.courses.length,
                    itemBuilder: (context,index){
                      CourseBrief cb = _courseListProv.courses[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 40.w,
                          top: 15.h,
                          bottom: 15.h,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: context.theme.colorScheme.surface,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border.all(
                              color: context.theme.colorScheme.outlineVariant,
                              width: 0.5,
                            ),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Text(
                                      '#${cb.courseInstId} - ',
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        letterSpacing: -0.5,
                                        fontWeight: FontWeight.w400,
                                        color: context.theme.colorScheme.outline,
                                        fontFamily: StyleScheme.engFontFamily,
                                      ),
                                    ),
                                    Text(
                                      ' ${cb.name}',
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        letterSpacing: -0.5,
                                        wordSpacing: 1.5,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: StyleScheme.engFontFamily,
                                      ),
                                    ),
                                    SizedBox(width: 10.w,),
                                    Chip(
                                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                                      surfaceTintColor: Colors.transparent,
                                      side: const BorderSide(
                                        color: Color(0xff4e34d4),
                                        width: 1,
                                      ),
                                      label: Text(
                                        cb.courseType,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff4e34d4),
                                          fontFamily: StyleScheme.engFontFamily,
                                        ),
                                      ),
                                      backgroundColor: const Color(0xff4e34d4).withOpacity(0.1),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 20.w,
                                  right: 20.w,
                                  bottom: 15.h,
                                ),
                                child: Text(
                                  'Computer networking refers to the practice of interconnecting multiple computing devices to share resources, exchange data, and communicate. Networks can be small, like a local area network (LAN) within a single building, or large, spanning vast distances like...',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    letterSpacing: -0.5,
                                    wordSpacing: 1.2,
                                    fontWeight: FontWeight.w400,
                                    color: context.theme.colorScheme.outline.withOpacity(0.9),
                                    fontFamily: StyleScheme.engFontFamily,
                                  ),
                                ),
                              ),
                              Divider(
                                color: context.theme.colorScheme.outlineVariant,
                                thickness: 0.5,
                                height: 0.5.h,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                                color: context.theme.colorScheme.surfaceContainerHigh,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                      children: [
                                        Chip(
                                          avatar: CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            child: Icon(
                                              LucideIcons.timer,
                                              color: context.theme.colorScheme.outline,
                                              size: 20.sp,
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                                          labelPadding: const EdgeInsets.only(right: 5),
                                          surfaceTintColor: Colors.transparent,
                                          side: BorderSide(
                                            color: context.theme.colorScheme.outlineVariant,
                                            width: 1,
                                          ),
                                          label: Wrap(
                                            crossAxisAlignment: WrapCrossAlignment.center,
                                            spacing: 5,
                                            children: [
                                              Text(
                                                'Course Hours',
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: context.theme.colorScheme.outline,
                                                  fontFamily: StyleScheme.engFontFamily,
                                                ),
                                              ),
                                              Text(
                                                cb.totalClassHour.toString(),
                                                style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: StyleScheme.engFontFamily,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 15.w,),
                                        Chip(
                                          avatar: CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            child: Icon(
                                              LucideIcons.award,
                                              color: context.theme.colorScheme.outline,
                                              size: 20.sp,
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                                          labelPadding: const EdgeInsets.only(right: 5),
                                          surfaceTintColor: Colors.transparent,
                                          side: BorderSide(
                                            color: context.theme.colorScheme.outlineVariant,
                                            width: 1,
                                          ),
                                          label: Wrap(
                                            crossAxisAlignment: WrapCrossAlignment.center,
                                            spacing: 5,
                                            children: [
                                              Text(
                                                'Credit',
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: context.theme.colorScheme.outline,
                                                  fontFamily: StyleScheme.engFontFamily,
                                                ),
                                              ),
                                              Text(
                                                cb.creditStr,
                                                style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: StyleScheme.engFontFamily,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 15.w,),
                                        Chip(
                                          avatar: CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            child: Icon(
                                              Icons.data_usage_rounded,
                                              color: context.theme.colorScheme.outline,
                                              size: 20.sp,
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                                          labelPadding: const EdgeInsets.only(right: 5),
                                          surfaceTintColor: Colors.transparent,
                                          side: BorderSide(
                                            color: context.theme.colorScheme.outlineVariant,
                                            width: 1,
                                          ),
                                          label: Wrap(
                                            crossAxisAlignment: WrapCrossAlignment.center,
                                            spacing: 5,
                                            children: [
                                              Text(
                                                'Progress',
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: context.theme.colorScheme.outline,
                                                  fontFamily: StyleScheme.engFontFamily,
                                                ),
                                              ),
                                              Text(
                                                '76%',
                                                style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: StyleScheme.engFontFamily,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    OutlinedButton(
                                      onPressed: (){},
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                          color: index.isOdd ? const Color(0xff4e34d4): context.theme.colorScheme.primary,
                                          width: 1,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                      ),
                                      child: Text(
                                        index.isOdd ? 'View Detail' : 'Upload Score',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: StyleScheme.engFontFamily,
                                          color: index.isOdd ? const Color(0xff4e34d4): context.theme.colorScheme.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}