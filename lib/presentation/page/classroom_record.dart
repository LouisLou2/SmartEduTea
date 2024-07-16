import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu_tea/extension/context_extension.dart';
import 'package:smart_edu_tea/state/classroom_apply_prov.dart';
import 'package:smart_edu_tea/state/prov_manager.dart';

import '../../entity/room_apply_record.dart';
import '../../style/style_scheme.dart';

class ClassroomRecord extends StatefulWidget {
  const ClassroomRecord({super.key});

  @override
  State<ClassroomRecord> createState() => _ClassroomRecordState();
}

class _ClassroomRecordState extends State<ClassroomRecord> with TickerProviderStateMixin {
  final classroomProv = ProvManager.classroomRecordProvider;

  late NumberPaginatorController controller;

  final List<PlutoColumn> columns = [
    PlutoColumn(
      title: 'Record ID',
      field: 'recordId',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Year',
      field: 'year',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: 'Term',
      field: 'term',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Week',
      field: 'week',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: 'Period From',
      field: 'periodFrom',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Period To',
      field: 'periodTo',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Classroom Name',
      field: 'classroomName',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Result',
      field: 'result',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Act Name',
      field: 'actName',
      type: PlutoColumnType.text(),
    ),
  ];

  List<PlutoRow> getRows(List<RoomApplyRecord> records) {
    return records.map((record) {
      return PlutoRow(
        cells: {
          'recordId': PlutoCell(value: record.recordId.toString()),
          'year': PlutoCell(value: record.year),
          'term': PlutoCell(value: record.termPart.toString()),  // Assuming termPart is used for 'term'
          'week': PlutoCell(value: record.week),
          'periodFrom': PlutoCell(value: record.periodFrom.toString()),
          'periodTo': PlutoCell(value: record.periodTo.toString()),
          'classroomName': PlutoCell(value: record.classroomInfo.classroomName),  // Assuming ClassroomInfo has a 'name' field
          'result': PlutoCell(value: record.result.toString()),
          'actName': PlutoCell(value: record.actName),
        },
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mtheme = context.theme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30.w, top: 30.h),
          child: Text(
            'Classroom Application',
            style: context.theme.textTheme.titleLarge?.copyWith(
              fontSize: 30.sp,
              fontFamily: StyleScheme.engFontFamily,
              letterSpacing: -0.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 100.h,
          ),
          child: Selector<ClassroomRecordProv, int>(
            selector: (context, prov) => prov.recordSum,
            shouldRebuild: (prev, next) => true,
            builder: (_,__,___){
              return PlutoGrid(
                columns: columns,
                rows: getRows(classroomProv.records),
              );
            },
          ),
        ),
        Selector<ClassroomRecordProv, int>(
          selector: (context, prov) => prov.totalPage,
          builder: (_, totalPage, __) {
            return NumberPaginator(
              controller: controller,
              // by default, the paginator shows numbers as center content
              numberPages: totalPage,
              onPageChange: (int index) {
                classroomProv.newPageAndFetch(index);
              },
              // initially selected index
              initialPage: classroomProv.nowPage,
              config: NumberPaginatorUIConfig(
                // default height is 48
                height: 64,
                buttonShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: context.theme.colorScheme.outlineVariant,
                    width: 0.5,
                  ),
                ),
                buttonTextStyle: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: StyleScheme.engFontFamily,
                ),
                contentPadding: EdgeInsets.all(8.sp),
                buttonSelectedForegroundColor: context.theme.colorScheme.onPrimary,
                buttonUnselectedForegroundColor: context.theme.colorScheme.onSurface,
                buttonUnselectedBackgroundColor: context.theme.colorScheme.surface,
                buttonSelectedBackgroundColor: context.theme.colorScheme.primary,
              ),
            );
          },
        ),
      ],
    );
  }
}