import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu_tea/extension/context_extension.dart';
import 'package:smart_edu_tea/presentation/page/side_sheet_example.dart';
import 'package:smart_edu_tea/state/fault_record_prov.dart';
import 'package:smart_edu_tea/state/prov_manager.dart';
import 'package:smart_edu_tea/util/format_util.dart';

import '../../../style/style_scheme.dart';

class TeacherFaultList extends StatefulWidget {
  const TeacherFaultList({super.key});

  @override
  State<TeacherFaultList> createState() => _TeacherFaultListState();
}

class _TeacherFaultListState extends State<TeacherFaultList> with TickerProviderStateMixin{
  final FaultRecordProv faultRecordProv = ProvManager.faultReportProv;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
    // 在initState中加载数据
    WidgetsBinding.instance.addPostFrameCallback((_) {
      faultRecordProv.fetchFaultReport(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mtheme= context.theme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30.w, top: 30.h,),
          child: Text(
            'Fault Report',
            style: context.theme.textTheme.titleLarge?.copyWith(
              fontSize: 30.sp,
              fontFamily: StyleScheme.engFontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, top: 15.h, right: 10.w),
            child: Container(
              decoration: BoxDecoration(
                color: mtheme.colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
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
                          'Fault List',
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
                          text: 'All Report',
                        ),
                        Tab(
                          text: 'Pending',
                        ),
                        Tab(
                          text: 'On Progess',
                        ),
                        Tab(
                          text: 'Resolved',
                        ),
                      ],
                    ),
                  ),
                  Selector<FaultRecordProv,bool>(
                    selector: (context, prov) => prov.isLoading,
                    shouldRebuild: (prev, next) => prev != next,
                    builder: (context,loading,_){
                      if(loading) return const Center(child: CircularProgressIndicator(),);
                      return Expanded(
                        child: Selector<FaultRecordProv, int>(
                          selector: (context, prov) => prov.records.length,
                          shouldRebuild: (prev, next) => true,
                          builder: (context, count, child){
                            return ListView.builder(
                              itemCount: count,
                              itemBuilder: (context, index){
                                final record = faultRecordProv.records[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: 20.w,
                                    right: 40.w,
                                    top: 15.h,
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
                                          padding: EdgeInsets.only(
                                            left: 20.w,
                                            right: 20.w,
                                            top: 15.h,
                                            bottom: 5.h,
                                          ),
                                          child: Wrap(
                                            crossAxisAlignment: WrapCrossAlignment.center,
                                            children: [
                                              Text(
                                                '#42543 - ',
                                                style: TextStyle(
                                                  fontSize: 19.sp,
                                                  letterSpacing: -0.5,
                                                  fontWeight: FontWeight.w400,
                                                  color: context.theme.colorScheme.outline,
                                                  fontFamily: StyleScheme.engFontFamily,
                                                ),
                                              ),
                                              Text(
                                                ' ${record.campusName} - ${record.building} - ${record.classroomName}',
                                                style: TextStyle(
                                                  fontSize: 19.sp,
                                                  letterSpacing: -0.5,
                                                  wordSpacing: 1.5,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: StyleScheme.cnFontFamily,
                                                ),
                                              ),
                                              SizedBox(width: 10.w,),
                                              Chip(
                                                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                                                surfaceTintColor: Colors.transparent,
                                                side: const BorderSide(
                                                  color: Color(0xff4e34d4),
                                                  width: 1,
                                                ),
                                                label: Text(
                                                  '${record.status}',
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
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
                                            record.faultDesc,
                                            style: TextStyle(
                                              fontSize: 14.sp,
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
                                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
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
                                                        LucideIcons.award,
                                                        color: context.theme.colorScheme.outline,
                                                        size: 18.sp,
                                                      ),
                                                    ),
                                                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
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
                                                          'Type',
                                                          style: TextStyle(
                                                            fontSize: 14.sp,
                                                            fontWeight: FontWeight.w400,
                                                            color: context.theme.colorScheme.outline,
                                                            fontFamily: StyleScheme.engFontFamily,
                                                          ),
                                                        ),
                                                        Text(
                                                          record.faultType,
                                                          style: TextStyle(
                                                            fontSize: 15.sp,
                                                            fontWeight: FontWeight.w500,
                                                            fontFamily: StyleScheme.engFontFamily,
                                                            color: const Color(0xff952323),
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
                                                        LucideIcons.timer,
                                                        color: context.theme.colorScheme.outline,
                                                        size: 20.sp,
                                                      ),
                                                    ),
                                                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
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
                                                          'Report Time',
                                                          style: TextStyle(
                                                            fontSize: 14.sp,
                                                            fontWeight: FontWeight.w400,
                                                            color: context.theme.colorScheme.outline,
                                                            fontFamily: StyleScheme.engFontFamily,
                                                          ),
                                                        ),
                                                        Text(
                                                          FormatUtil.ymdStr(record.reportTime),
                                                          style: TextStyle(
                                                            fontSize: 15.sp,
                                                            fontWeight: FontWeight.w500,
                                                            letterSpacing: -0.7,
                                                            fontFamily: StyleScheme.engFontFamily,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              OutlinedButton(
                                                onPressed: (){
                                                  showShadSheet(
                                                    side: ShadSheetSide.right,
                                                    context: context,
                                                    builder: (context) => const EditProfileSheet(side: ShadSheetSide.right,),
                                                  );
                                                },
                                                style: OutlinedButton.styleFrom(
                                                  side: const BorderSide(
                                                    color: Color(0xff952323),
                                                    width: 1,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                                                ),
                                                child: Text(
                                                  'View Detail',
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: StyleScheme.engFontFamily,
                                                    color: const Color(0xff952323),
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
                              },
                            );
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}