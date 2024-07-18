import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu_tea/entity/course_detail.dart';
import 'package:smart_edu_tea/extension/context_extension.dart';
import 'package:smart_edu_tea/state/course_detail_prov.dart';
import 'package:smart_edu_tea/state/prov_manager.dart';
import 'package:smart_edu_tea/state/user_prov.dart';

import '../../../entity/chapter2.dart';
import '../../const/data_status.dart';
import '../../entity/teacher.dart';
import '../../style/style_scheme.dart';
import '../widget/leading_title.dart';
import 'error_page.dart';


class CourseDetailPage extends StatefulWidget{

  const CourseDetailPage({super.key});

  @override
  State<StatefulWidget> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> with TickerProviderStateMixin{

  final UserProv uProv = ProvManager.userProv;
  final CourseDetailProv cdProv = ProvManager.courseDetailProv;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cdProv.fetchCourseDetail();
    });
    // Chapter2 ch2 = Chapter2(
    //   id: 1,
    //   title: '1.2 有限自动机的等价性和最小化',
    //   content: [
    //     TeachingMaterial(
    //       fileId: 1,
    //       name: 'Infinitive.mp4',
    //       url: 'https://www.baidu.com',
    //       size: 1024,
    //       type: TeachingMaterialType.PPT,
    //     ),
    //   ]
    // );
    // _data = List.generate(10, (index) => Chapter1(
    //   id: index,
    //   title: 'Chapter $index',
    //   chapter2s: [ch2,ch2],
    // ));
    // expanded = List.generate(_data.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    final stheme= ShadTheme.of(context);
    final mtheme= context.theme;
    final Teacher tea= uProv.teacher;


    return Scaffold(
      backgroundColor: mtheme.colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        leadingWidth: 200.w,
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 15.w,),
              IconButton(
                icon: const Icon(
                    Icons.arrow_back_ios,
                ),
                onPressed: ()=>Navigator.pop(context),
              ),
              Image.asset(
                'assets/image/flutter_icon.png',
                fit: BoxFit.cover,
                width: 19.sp,
              ),
              SizedBox(width: 10.w,),
              Text(
                'CSU Academy',
                style: context.theme.textTheme.titleLarge?.copyWith(
                  letterSpacing: -0.5,
                  fontWeight: FontWeight.w500,
                  fontFamily: StyleScheme.engFontFamily,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(width: 10.w,),
              ShadButton.link(
                text: Text(
                  'CSU Main',
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: StyleScheme.engFontFamily,
                  ),
                ),
              ),
              ShadButton.link(
                text: Text(
                  'Open Courses',
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: StyleScheme.engFontFamily,
                  ),
                ),
              ),
              ShadButton.link(
                text: Text(
                  'Resources',
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: StyleScheme.engFontFamily,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 300.w,
              maxHeight: 40.h,
            ),
            child:  SearchBar(
              leading: Icon(
                Icons.search,
                color: context.colorScheme.onSurfaceVariant.withOpacity(0.5),
              ),
              hintText: 'Search',
              hintStyle: WidgetStatePropertyAll<TextStyle>(
                context.textTheme.titleMedium!.copyWith(
                  color: context.colorScheme.onSurfaceVariant.withOpacity(0.5),
                  fontFamily: StyleScheme.engFontFamily,
                  letterSpacing: -0.5,
                ),
              ),
              elevation: const WidgetStatePropertyAll<double>(0),
              backgroundColor: WidgetStatePropertyAll<Color>(context.colorScheme.secondary.withOpacity(0.1)),
              shape: const WidgetStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 20.w,),
          ShadButton.link(
            text: Text(
              'My Courses',
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w400,
                fontFamily: StyleScheme.engFontFamily,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              LucideIcons.calendar,
              size: 25.sp,
            ),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(
              LucideIcons.bellRing,
              size: 25.sp,
            ),
            onPressed: (){},
          ),
          SizedBox(width: 20.w,),
          CircleAvatar(
            radius: 20.sp,
            child: Text(
              tea.firstNameLetter,
            ),
          ),
          SizedBox(width: 18.w,),
        ],
        backgroundColor: mtheme.colorScheme.surfaceContainerHighest,
        // only bottom border
        shape: Border(
          bottom: BorderSide(
            color: mtheme.colorScheme.outlineVariant,
            width: 0.5,
          ),
        ),
      ),
      body: Selector<CourseDetailProv,DataStatus>(
        selector: (_,prov)=>prov.status,
        shouldRebuild: (pre, next)=>pre!=next,
        builder: (_,status,__){
          switch(status){
            case DataStatus.initial:
            case DataStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case DataStatus.failure:
              return ErrorPage(
                onRetry: ()=>cdProv.fetchCourseDetail(),
              );
            case DataStatus.success:
              CourseDetail cd= cdProv.detail;
              final chp1s=cd.chapterList;
              final expanded=List.generate(chp1s.length, (index)=>false);
              return Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 50.w,
                        right: 20.w,
                        top: 20.h,
                      ),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          SizedBox(height: 20.h,),
                          LeadingTitle(
                            title: 'Course Overview',
                            fontSize: 30.sp,
                          ),
                          SizedBox(height: 15.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 4,
                                child: AspectRatio(
                                  aspectRatio: 1.5,
                                  child: Container(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Image.network(
                                      cd.coursePic,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: AspectRatio(
                                  aspectRatio: 1.5* 5/4,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 70.w,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10.h,),
                                        Text(
                                          cd.name,
                                          style: context.textTheme.titleLarge?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: StyleScheme.engFontFamily,
                                            letterSpacing: -0.5,
                                            fontSize: 30.sp,
                                          ),
                                        ),
                                        SizedBox(height: 15.h,),
                                        IntrinsicHeight(
                                          child: Container(
                                            padding: EdgeInsets.zero,
                                            clipBehavior: Clip.antiAliasWithSaveLayer,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              border: Border.all(
                                                color: mtheme.colorScheme.secondary.withOpacity(0.5),
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 5,
                                                  ),
                                                  child: AspectRatio(
                                                    aspectRatio: 3,
                                                    child: ConstrainedBox(
                                                      constraints: BoxConstraints(
                                                        maxHeight: 100.h,
                                                        minWidth: 120.w,
                                                      ),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            LucideIcons.timer,
                                                            size: 20.sp,
                                                          ),
                                                          const SizedBox(width: 10,),
                                                          Wrap(
                                                            direction: Axis.vertical,
                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                            children: [
                                                              Text(
                                                                'Lessons',
                                                                style: context.textTheme.bodyMedium?.copyWith(
                                                                  color: mtheme.colorScheme.onSurface,
                                                                  fontFamily: StyleScheme.engFontFamily,
                                                                  fontSize: 13.sp,
                                                                  fontWeight: FontWeight.w400,
                                                                ),
                                                              ),
                                                              Text(
                                                                cd.totalClassTotal.toString(),
                                                                style: context.textTheme.bodyMedium?.copyWith(
                                                                  color: mtheme.colorScheme.onSurface,
                                                                  fontSize: 14.sp,
                                                                  fontFamily: StyleScheme.engFontFamily,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                VerticalDivider(
                                                  color: mtheme.colorScheme.secondary.withOpacity(0.5),
                                                  thickness: 0.5,
                                                  width: 1,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 5,
                                                  ),
                                                  child: AspectRatio(
                                                    aspectRatio: 3,
                                                    child: ConstrainedBox(
                                                      constraints: BoxConstraints(
                                                        maxHeight: 100.h,
                                                        minWidth: 120.w,
                                                      ),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons.bar_chart_rounded,
                                                            size: 20.sp,
                                                          ),
                                                          const SizedBox(width: 10,),
                                                          Wrap(
                                                            direction: Axis.vertical,
                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                            children: [
                                                              Text(
                                                                'Difficulty',
                                                                style: context.textTheme.bodyMedium?.copyWith(
                                                                  color: mtheme.colorScheme.onSurface,
                                                                  fontFamily: StyleScheme.engFontFamily,
                                                                  fontSize: 13.sp,
                                                                  fontWeight: FontWeight.w400,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Intermediate',
                                                                style: context.textTheme.bodyMedium?.copyWith(
                                                                  color: mtheme.colorScheme.onSurface,
                                                                  fontSize: 14.sp,
                                                                  fontFamily: StyleScheme.engFontFamily,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20.h,),
                                        getCourseInfoTile(LucideIcons.user, 'Max Students:', '${cd.maxNum}'),
                                        SizedBox(height: 5.h,),
                                        getCourseInfoTile(LucideIcons.target, 'Target Student:','Undergraduate'),
                                        SizedBox(height: 5.h,),
                                        getCourseInfoTile(LucideIcons.volume2, 'Language:','Chinese'),
                                        SizedBox(height: 5.h,),
                                        getCourseInfoTile(LucideIcons.type, 'Type:', cd.courseType),
                                        SizedBox(height: 5.h,),
                                        getCourseInfoTile(LucideIcons.timer, 'Category', cd.courseCate),
                                        SizedBox(height: 5.h,),
                                        getCourseInfoTile(LucideIcons.calendar, 'Start Date:', '12 Mar 2024'),
                                        SizedBox(height: 5.h,),
                                        getCourseInfoTile(LucideIcons.calendar, 'End Date:', '12 Jun 2023'),
                                        const Spacer(),
                                        ShadButton(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20.w,
                                            vertical: 5.w,
                                          ),
                                          text: Text(
                                            'View Syllabus',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: StyleScheme.engFontFamily,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 7,
                                child: Column(
                                  children: [
                                    TabBar(
                                      isScrollable: true,
                                      tabAlignment: TabAlignment.start,
                                      controller: _tabController,
                                      labelPadding: EdgeInsets.symmetric(
                                        horizontal: 20.w,
                                      ),
                                      splashBorderRadius: BorderRadius.circular(10),
                                      tabs: <Widget>[
                                        Tab(
                                          child: Text(
                                            'Details',
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              color: mtheme.colorScheme.onSurface,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: StyleScheme.engFontFamily,
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Text(
                                            'Resources',
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              color: mtheme.colorScheme.onSurface,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: StyleScheme.engFontFamily,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxHeight: 2000.h,
                                      ),
                                      child: TabBarView(
                                        controller: _tabController,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 20.w,
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 20.h,),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                    right: 20.w,
                                                    left: 20.w,
                                                    top: 20.h,
                                                    bottom: 15.h,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: mtheme.colorScheme.secondary.withOpacity(0.05),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        cd.instructorMsg,
                                                        softWrap: true,
                                                      ),
                                                      SizedBox(height: 20.h,),
                                                      Align(
                                                        alignment: Alignment.centerRight,
                                                        child: Text(
                                                          '——MESSAGE FROM THE INSTRUCTOR',
                                                          style: TextStyle(
                                                            fontSize: 14.sp,
                                                            color: mtheme.colorScheme.onSurfaceVariant,
                                                            fontWeight: FontWeight.w500,
                                                            fontFamily: StyleScheme.engFontFamily,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 30.h,),
                                                Divider(
                                                  color: mtheme.colorScheme.secondary.withOpacity(0.5),
                                                  thickness: 0.5,
                                                ),
                                                Text(
                                                  'OVERVIEW',
                                                  style: TextStyle(
                                                    fontSize: 18.sp,
                                                    color: mtheme.colorScheme.onSurfaceVariant,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: StyleScheme.engFontFamily,
                                                  ),
                                                ),
                                                SizedBox(height: 15.h,),
                                                Text(
                                                  cd.overview,
                                                  softWrap: true,
                                                  style: mtheme.textTheme.titleMedium?.copyWith(
                                                    color: mtheme.colorScheme.secondary,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(height: 30.h,),
                                                Divider(
                                                  color: mtheme.colorScheme.secondary.withOpacity(0.5),
                                                  thickness: 0.5,
                                                ),
                                                Text(
                                                  'TARGET',
                                                  style: TextStyle(
                                                    fontSize: 18.sp,
                                                    color: mtheme.colorScheme.onSurfaceVariant,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: StyleScheme.engFontFamily,
                                                  ),
                                                ),
                                                SizedBox(height: 15.h,),
                                                Text(
                                                  cd.target,
                                                  softWrap: true,
                                                  style: mtheme.textTheme.titleMedium?.copyWith(
                                                    color: mtheme.colorScheme.secondary,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(height: 30.h,),
                                                Divider(
                                                  color: mtheme.colorScheme.secondary.withOpacity(0.5),
                                                  thickness: 0.5,
                                                ),
                                                Text(
                                                  'PREREQUISITES',
                                                  style: TextStyle(
                                                    fontSize: 18.sp,
                                                    color: mtheme.colorScheme.onSurfaceVariant,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: StyleScheme.engFontFamily,
                                                  ),
                                                ),
                                                SizedBox(height: 15.h,),
                                                Text(
                                                  '掌握计算机程序设计语言和程序设计知识，了解微机原理、组成原理、数据结构、离散数学以及操作系统等知识。',
                                                  softWrap: true,
                                                  style: mtheme.textTheme.titleMedium?.copyWith(
                                                    color: mtheme.colorScheme.secondary,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              SizedBox(height: 20.h,),
                                              SingleChildScrollView(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: mtheme.colorScheme.secondary.withOpacity(0.05),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 20.w,
                                                    vertical: 20.h,
                                                  ),
                                                  child: ExpansionPanelList(
                                                    expandedHeaderPadding: EdgeInsets.symmetric(vertical: 10.h),
                                                    materialGapSize: 10,
                                                    elevation: 0,
                                                    expansionCallback: (int index, bool isExpanded) {
                                                      setState(() {
                                                        print('index: $index, isExpanded: $isExpanded');
                                                        expanded[index] = isExpanded;
                                                      });
                                                    },
                                                    children: List.generate(chp1s.length, (index)=>index).map<ExpansionPanel>((int ch1) {
                                                      return ExpansionPanel(
                                                        canTapOnHeader: true,
                                                        backgroundColor: Colors.transparent,
                                                        isExpanded: expanded[ch1],
                                                        headerBuilder: (BuildContext context, bool isExpanded) {
                                                          return ListTile(
                                                            tileColor: mtheme.colorScheme.surfaceContainerHighest,
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                            ),
                                                            title: Text(
                                                              chp1s[ch1].title,
                                                              style: TextStyle(
                                                                fontSize: 18.sp,
                                                                color: mtheme.colorScheme.onSurface,
                                                                fontWeight: FontWeight.w500,
                                                                fontFamily: StyleScheme.engFontFamily,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        body: Builder(
                                                          builder: (BuildContext context){
                                                            List<Widget> children = [];
                                                            List<Chapter2> ch2 = chp1s[ch1].chapter2s;
                                                            for(int i=0;i < ch2.length; ++i){
                                                              children.add(
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(
                                                                    vertical: 5.h,
                                                                    horizontal: 10.w,
                                                                  ),
                                                                  child: Text(
                                                                    ch2[i].chapterTitle,
                                                                    style: mtheme.textTheme.titleMedium?.copyWith(
                                                                      color: mtheme.colorScheme.onSurfaceVariant,
                                                                      fontSize: 16.sp,
                                                                      fontWeight: FontWeight.w700,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                              for(int j=0;j < ch2[i].materials.length; ++j){
                                                                children.add(
                                                                  ListTile(
                                                                    contentPadding: EdgeInsets.symmetric(
                                                                      horizontal: 40.w,
                                                                    ),
                                                                    leading: Icon(
                                                                      Icons.file_present,
                                                                      size: 20.sp,
                                                                    ),
                                                                    title: Text(
                                                                      ch2[i].materials[j].fileName,
                                                                      style: mtheme.textTheme.titleMedium?.copyWith(
                                                                        color: mtheme.colorScheme.onSurfaceVariant,
                                                                        fontSize: 14.sp,
                                                                        fontWeight: FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                    trailing: TextButton(
                                                                      onPressed: (){},
                                                                      child: Text(
                                                                        'Download',
                                                                        style: TextStyle(
                                                                          fontSize: 14.sp,
                                                                          color: mtheme.colorScheme.primary,
                                                                          fontWeight: FontWeight.w500,
                                                                          fontFamily: StyleScheme.engFontFamily,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              children.add(SizedBox(height: 10.h,));
                                                            }
                                                            return Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: children,
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 40.h,
                                    left: 30.w,
                                    right: 20.w,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 30.w,
                                      vertical: 10.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: mtheme.colorScheme.secondary.withOpacity(0.04),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          tileColor: mtheme.colorScheme.surfaceContainerHighest,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          contentPadding: const EdgeInsets.symmetric(
                                            horizontal: 0,
                                            vertical: 0,
                                          ),
                                          title: Text(
                                            'Teacher Team',
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              color: mtheme.colorScheme.onSurface,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: -0.5,
                                              fontFamily: StyleScheme.engFontFamily,
                                            ),
                                          ),
                                        ),
                                        ...List.generate(5, (index)=>
                                            ListTile(
                                              contentPadding: EdgeInsets.zero,
                                              leading: CircleAvatar(
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(100),
                                                  child: Image.asset('assets/image/aao_admin.png'),
                                                ),
                                              ),
                                              title: Text(
                                                '卡洛琳',
                                                style: mtheme.textTheme.titleMedium?.copyWith(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              subtitle: Text(
                                                '副教授',
                                                style: mtheme.textTheme.titleMedium?.copyWith(
                                                  fontSize: 13.sp,
                                                  color: context.theme.colorScheme.onSurface.withOpacity(0.6),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }

  Widget getCourseInfoTile(IconData icon, String title, String value){
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10.w,
      children: [
        Icon(
          icon,
          size: 17.sp,
        ),
        Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(
            fontFamily: StyleScheme.engFontFamily,
            fontSize: 14.sp,
            letterSpacing: -0.5,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: context.textTheme.bodyMedium?.copyWith(
            fontFamily: StyleScheme.engFontFamily,
            fontSize: 16.sp,
            letterSpacing: -0.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}