import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';
import 'package:smart_edu_tea/extension/context_extension.dart';
import 'package:smart_edu_tea/presentation/page/error_page.dart';
import 'package:smart_edu_tea/state/prov_manager.dart';
import 'package:smart_edu_tea/entity/score.dart';
import 'package:smart_edu_tea/state/student_score_prov.dart';

import '../../const/data_status.dart';
import '../../entity/student_brief.dart';
import '../../style/style_scheme.dart';

class StudentScoresRecord extends StatefulWidget {
  const StudentScoresRecord({super.key});

  @override
  State<StudentScoresRecord> createState() => _StudentScoresRecordState();
}

class _StudentScoresRecordState extends State<StudentScoresRecord> with TickerProviderStateMixin {
  final ssProv = ProvManager.studentScoreProv;
  late NumberPaginatorController controller;

  final List<PlutoColumn> columns = [
    PlutoColumn(
      title: 'Student ID',
      field: 'stuId',
      type: PlutoColumnType.text(),
      enableSorting: false,
      readOnly: true,
    ),
    PlutoColumn(
      title: 'Student Name',
      field: 'stuName',
      type: PlutoColumnType.text(),
      enableSorting: false,
      readOnly: true,
    ),
    PlutoColumn(
      title: 'Major Name',
      field: 'majorName',
      type: PlutoColumnType.text(),
      enableSorting: false,
      readOnly: true,
    ),
    PlutoColumn(
      title: 'Attend Exam',
      field: 'attendExam',
      type: PlutoColumnType.text(),
      enableSorting: false,
      readOnly: true,
    ),
    PlutoColumn(
      title: 'Regular Score',
      field: 'regularScore',
      type: PlutoColumnType.number(),
      enableSorting: false,
    ),
    PlutoColumn(
      title: 'Exam Score',
      field: 'examScore',
      type: PlutoColumnType.number(),
      enableSorting: false,
    ),
    PlutoColumn(
      title: 'Total Score',
      field: 'totalScore',
      type: PlutoColumnType.number(),
      enableSorting: false,
      readOnly: true,
    ),
  ];

  String getScoreStr(int score) {
    return score == 0 ? '' : score.toString();
  }

  List<PlutoRow> getRows(List<StudentBrief> stuBrief,List<Score> scores) {
    List<PlutoRow> rows = [];
    for(int i = 0;i<stuBrief.length;++i){
      rows.add(PlutoRow(
        cells: {
          'stuId': PlutoCell(value: stuBrief[i].stuId),
          'stuName': PlutoCell(value: stuBrief[i].stuName),
          'majorName': PlutoCell(value: stuBrief[i].majorName),
          'attendExam': PlutoCell(value: 'Yes'),
          'regularScore': PlutoCell(value: getScoreStr(scores[i].regularScore)),
          'examScore': PlutoCell(value: getScoreStr(scores[i].examScore)),
          'totalScore': PlutoCell(value: getScoreStr(scores[i].totalScore)),
        },
      ));
    }
    return rows;
  }

  @override
  void initState() {
    super.initState();
    controller = NumberPaginatorController();
    // 在initState中加载数据
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ssProv.fetchScores();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    ssProv.clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mtheme = context.theme;
    return Selector<StudentScoreProv, DataStatus>(
      selector: (context, prov) => prov.status,
      shouldRebuild: (prev, next) => prev != next,
      builder: (context,status ,_){
        switch (status) {
          case DataStatus.initial:
          case DataStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case DataStatus.failure:
            return ErrorPage(
              onRetry: ssProv.fetchScores,
            );
          case DataStatus.success:
            return Material(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, top: 30.h),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Student Scores',
                          style: context.theme.textTheme.titleLarge?.copyWith(
                            fontSize: 30.sp,
                            fontFamily: StyleScheme.engFontFamily,
                            letterSpacing: -0.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        OutlinedButton(
                          onPressed: ssProv.uploadScores,
                          child: const Text('Upload'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Selector<StudentScoreProv, int>(
                      selector: (context, prov) => prov.nowPage,
                      shouldRebuild: (prev, next) => prev != next,
                      builder: (_, __, ___) {
                        return Selector<StudentScoreProv,bool>(
                            selector: (context, prov) => prov.cellEdited,
                            shouldRebuild: (prev, next) => prev != next,
                            builder: (_,__,___){
                              return PlutoGrid(
                                key: UniqueKey(),
                                columns: columns,
                                rows: getRows(ssProv.students,ssProv.scoresPageList),
                                onChanged: (PlutoGridOnChangedEvent event) {
                                  if(event.columnIdx==4){
                                    ssProv.updateScore(event.rowIdx, true, event.value);
                                  }
                                  if(event.columnIdx==5){
                                    ssProv.updateScore(event.rowIdx, false, event.value);
                                  }
                                },
                              );
                            }
                        );
                      },
                    ),
                  ),
                  Selector<StudentScoreProv, int>(
                    selector: (context, prov) => prov.totalPage,
                    shouldRebuild: (prev, next) => true,
                    builder: (_, totalPage, __) {
                      return NumberPaginator(
                        controller: controller,
                        numberPages: totalPage,
                        onPageChange: (int index) {
                          if(index == ssProv.nowPage){
                            return;
                          }
                          ssProv.setPage(index);
                          //TODO:not good
                          // ssProv.getPage(index);
                          ssProv.fetchScores();
                        },
                        initialPage: ssProv.nowPage,
                        config: NumberPaginatorUIConfig(
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
              ),
            );
        }
      }
    );
  }
}