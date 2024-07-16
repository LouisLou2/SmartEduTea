import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu_tea/extension/context_extension.dart';

import '../../style/style_scheme.dart';

class ClassroomRecord extends StatefulWidget {
  const ClassroomRecord({super.key});

  @override
  State<ClassroomRecord> createState() => _ClassroomRecordState();
}

class _ClassroomRecordState extends State<ClassroomRecord> with TickerProviderStateMixin{

  late TabController _tabController;
  final List<PlutoColumn> columns = [
    PlutoColumn(
      title: 'Reserve Id',
      field: 'reserve_id',
      type: PlutoColumnType.text(),
      width:100,
      titleSpan: const TextSpan(text: 'Reserve Id', style: TextStyle(color: Colors.red)),
    ),
    PlutoColumn(
      title: 'Campus',
      field: 'campus',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Building',
      field: 'building',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Classroom',
      field: 'room',
      type: PlutoColumnType.text(),
      enableSorting: false,
    ),
    PlutoColumn(
      title: 'Year',
      field: 'year',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: 'Week',
      field: 'week',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: 'DayOfWeek',
      field: 'day_of_week',
      type: PlutoColumnType.number(),
    ),
  ];

  List<PlutoRow> getRows() {
    return [
      PlutoRow(
        cells: {
          'reserve_id': PlutoCell(value: '1'),
          'campus': PlutoCell(value: 'CSU'),
          'building': PlutoCell(value: 'A'),
          'room': PlutoCell(value: '101'),
          'year': PlutoCell(value: 2022),
          'week': PlutoCell(value: 1),
          'day_of_week': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'reserve_id': PlutoCell(value: '2'),
          'campus': PlutoCell(value: 'CSU'),
          'building': PlutoCell(value: 'A'),
          'room': PlutoCell(value: '102'),
          'year': PlutoCell(value: 2022),
          'week': PlutoCell(value: 1),
          'day_of_week': PlutoCell(value: 2),
        },
      ),
      PlutoRow(
        cells: {
          'reserve_id': PlutoCell(value: '3'),
          'campus': PlutoCell(value: 'CSU'),
          'building': PlutoCell(value: 'A'),
          'room': PlutoCell(value: '103'),
          'year': PlutoCell(value: 2022),
          'week': PlutoCell(value: 1),
          'day_of_week': PlutoCell(value: 3),
        },
      ),
      PlutoRow(
        cells: {
          'reserve_id': PlutoCell(value: '4'),
          'campus': PlutoCell(value: 'CSU'),
          'building': PlutoCell(value: 'A'),
          'room': PlutoCell(value: '104'),
          'year': PlutoCell(value: 2022),
          'week': PlutoCell(value: 1),
          'day_of_week': PlutoCell(value: 4),
        },
      ),
      PlutoRow(
        cells: {
          'reserve_id': PlutoCell(value: '5'),
          'campus': PlutoCell(value: 'CSU'),
          'building': PlutoCell(value: 'A'),
          'room': PlutoCell(value: '105'),
          'year': PlutoCell(value: 2022),
          'week': PlutoCell(value: 1),
          'day_of_week': PlutoCell(value: 5),
        },
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
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
            maxHeight: 600.h,
          ),
          child: PlutoGrid(
            columns: columns,
            rows: getRows(),
          ),
        ),
      ],
    );
  }
}