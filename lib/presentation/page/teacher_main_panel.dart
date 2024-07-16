import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu_tea/entity/chart_data.dart';
import 'package:smart_edu_tea/extension/context_extension.dart';
import 'package:smart_edu_tea/presentation/widget/event_card.dart';
import 'package:smart_edu_tea/presentation/widget/leading_title.dart';
import 'package:smart_edu_tea/presentation/widget/num_stat_card.dart';
import 'package:smart_edu_tea/style/style_scheme.dart';
import 'package:smart_edu_tea/util/format_util.dart';
import '../../entity/event.dart';

class TeaMainPanel extends StatefulWidget{
  const TeaMainPanel({super.key});

  @override
  State<StatefulWidget> createState() => _TeaMainPanelState();
}

class _TeaMainPanelState extends State<TeaMainPanel> {

  List<Color> creditColor=[Colors.green, Colors.blue, Colors.orange, Colors.red];

  ChartData cdata=ChartData.term(
    year: 2024,
    term: TimeScale.TERM,
    xList: [2,3,4,5,6,7,8,9,10],
    yList: [0.94, 0.81, 0.85, 0.99, 0.86, 0.95, 0.99, 0.92, 0.86],
  );
  ChartData tdata=ChartData.term(
    year: 2024,
    term: TimeScale.TERM,
    xList: [2,3,4,5,6,7,8,9,10],
    yList: [0.95, 0.85, 0.86, 0.91, 0.99, 0.89, 0.99, 0.92, 0.81],
  );

  static const invoices = [
    (
    invoice: "INV001",
    paymentStatus: "Paid",
    totalAmount: r"$250.00",
    paymentMethod: "Credit Card",
    ),
    (
    invoice: "INV002",
    paymentStatus: "Pending",
    totalAmount: r"$150.00",
    paymentMethod: "PayPal",
    ),
    (
    invoice: "INV003",
    paymentStatus: "Unpaid",
    totalAmount: r"$350.00",
    paymentMethod: "Bank Transfer",
    ),
    (
    invoice: "INV004",
    paymentStatus: "Paid",
    totalAmount: r"$450.00",
    paymentMethod: "Credit Card",
    ),
    (
    invoice: "INV005",
    paymentStatus: "Paid",
    totalAmount: r"$550.00",
    paymentMethod: "PayPal",
    ),
    (
    invoice: "INV006",
    paymentStatus: "Pending",
    totalAmount: r"$200.00",
    paymentMethod: "Bank Transfer",
    ),
    (
    invoice: "INV007",
    paymentStatus: "Unpaid",
    totalAmount: r"$300.00",
    paymentMethod: "Credit Card",
    ),
  ];

  final pushNotifications = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final stheme= ShadTheme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: 30.w, top: 25.h, right: 10.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 30.w),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 10.w,
                        children: [
                          Icon(
                            Icons.waving_hand,
                            size: 30.sp,
                            color: context.theme.colorScheme.primary,
                          ),
                          Text(
                            "Good Afternoon, ",
                            style: context.theme.textTheme.titleLarge?.copyWith(
                              letterSpacing: -0.5,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: StyleScheme.engFontFamily,
                            ),
                          ),
                          Text(
                            "拉娜",
                            style: context.theme.textTheme.titleLarge?.copyWith(
                              letterSpacing: -0.5,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w700,
                              color: context.theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                          backgroundColor: context.theme.colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          shadowColor: Colors.transparent,
                        ),
                        child: Wrap(
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: context.theme.colorScheme.onPrimary,
                              size: 20.sp,
                            ),
                            Text(
                              'More',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: context.theme.colorScheme.onPrimary,
                                fontFamily: StyleScheme.engFontFamily,
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage('assets/image/bg1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Page Style Has Been Updated',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: StyleScheme.engFontFamily,
                          ),
                        ),
                        Text(
                          'Check out the new features we have added to your page',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontFamily: StyleScheme.engFontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.h,),
                  LeadingTitle(
                    title: "School Overview",
                    fontSize: 25.sp,
                  ),
                  SizedBox(height: 15.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: AspectRatio(
                          aspectRatio: 0.53,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NumStatCard(
                                title: '学生总数',
                                detailStr: '学生总数是很好的',
                                number: 1000,
                                color: context.theme.colorScheme.primary,
                                numFontSize: 30.sp,
                                contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                                onTap: (){},
                              ),
                              NumStatCard(
                                title: '学生总数',
                                detailStr: '学生总数是很好的',
                                number: 1000,
                                color: context.theme.colorScheme.primary,
                                numFontSize: 30.sp,
                                contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                                onTap: (){},
                              ),
                              NumStatCard(
                                title: '学生总数',
                                detailStr: '学生总数是很好的',
                                number: 1000,
                                color: context.theme.colorScheme.primary,
                                numFontSize: 30.sp,
                                contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                                onTap: (){},
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w,),
                      Expanded(
                        flex: 3,
                        child: AspectRatio(
                          aspectRatio: 0.53*3/1,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                            decoration: BoxDecoration(
                              color: context.theme.colorScheme.surface,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: context.theme.colorScheme.outlineVariant,
                                width: 0.5,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Attendance Rate",
                                      style: context.theme.textTheme.titleLarge?.copyWith(
                                        letterSpacing: -0.5,
                                        fontSize: 20.sp,
                                        color: context.theme.colorScheme.primary,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: StyleScheme.engFontFamily,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: (){},
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                                        backgroundColor: context.theme.colorScheme.secondaryContainer,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        shadowColor: Colors.transparent,
                                      ),
                                      child: Wrap(
                                        runAlignment: WrapAlignment.center,
                                        crossAxisAlignment: WrapCrossAlignment.center,
                                        children: [
                                          Text(
                                            'See Detail',
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              color: context.theme.colorScheme.primary,
                                              fontFamily: StyleScheme.engFontFamily,
                                              letterSpacing: -0.5,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: context.theme.colorScheme.primary,
                                            size: 20.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                getChart(cdata),
                                SizedBox(height: 20.h,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LeadingTitle(
                        title: "Uni Notifications",
                        fontSize: 25.sp,
                      ),
                      ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                          backgroundColor: context.theme.colorScheme.secondaryContainer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          shadowColor: Colors.transparent,
                        ),
                        child: Wrap(
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              'See Detail',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: context.theme.colorScheme.primary,
                                fontFamily: StyleScheme.engFontFamily,
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: context.theme.colorScheme.primary,
                              size: 20.sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Container(
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.surface,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: context.theme.colorScheme.outlineVariant,
                        width: 0.5,
                      ),
                    ),
                    child: Column(
                      children: [
                        ...List.generate(5,
                              (index)=> Padding(
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                                    child: Wrap(
                                      crossAxisAlignment: WrapCrossAlignment.center,
                                      children: [
                                        Text(
                                          '#42543 - ',
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            letterSpacing: -0.5,
                                            fontWeight: FontWeight.w400,
                                            color: context.theme.colorScheme.outline,
                                            fontFamily: StyleScheme.engFontFamily,
                                          ),
                                        ),
                                        Text(
                                          ' 湘雅校区关于2024-2025学年第一学期本科生选课开课的通知',
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            letterSpacing: -0.5,
                                            wordSpacing: 1.5,
                                            fontWeight: FontWeight.w500,
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
                                            'Academic Notice',
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
                                  Divider(
                                    color: context.theme.colorScheme.outlineVariant,
                                    thickness: 0.5,
                                    height: 0.5.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                                    color: context.theme.colorScheme.surfaceContainerHigh,
                                    child: Row(
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
                                                'Pub Time',
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: context.theme.colorScheme.outline,
                                                  fontFamily: StyleScheme.engFontFamily,
                                                ),
                                              ),
                                              Text(
                                                '2024-07-13',
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: -1,
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
                                                'To',
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: context.theme.colorScheme.outline,
                                                  fontFamily: StyleScheme.engFontFamily,
                                                ),
                                              ),
                                              Text(
                                                'T & S',
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: StyleScheme.engFontFamily,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     LeadingTitle(
                       title: "Transactions",
                       fontSize: 25.sp,
                     ),
                      ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                          backgroundColor: context.theme.colorScheme.secondaryContainer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          shadowColor: Colors.transparent,
                        ),
                        child: Wrap(
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              'See Detail',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: context.theme.colorScheme.primary,
                                fontFamily: StyleScheme.engFontFamily,
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: context.theme.colorScheme.primary,
                              size: 20.sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 550.h,
                    ),
                    child: ShadTable.list(
                      header: const [
                        ShadTableCell.header(child: Text('Invoice')),
                        ShadTableCell.header(child: Text('Status')),
                        ShadTableCell.header(child: Text('Method')),
                        ShadTableCell.header(
                          alignment: Alignment.centerRight,
                          child: Text('Amount'),
                        ),
                      ],
                      footer: const [
                        ShadTableCell.footer(child: Text('Total')),
                        ShadTableCell.footer(child: Text('')),
                        ShadTableCell.footer(child: Text('')),
                        ShadTableCell.footer(
                          alignment: Alignment.centerRight,
                          child: Text(r'$2500.00'),
                        ),
                      ],
                      columnSpanExtent: (index) {
                        if (index == 2) return const FixedTableSpanExtent(130);
                        if (index == 3) {
                          return const MaxTableSpanExtent(
                            FixedTableSpanExtent(120),
                            RemainingTableSpanExtent(),
                          );
                        }
                        // uses the default value
                        return null;
                      },
                      children: invoices
                          .map(
                            (invoice) => [
                          ShadTableCell(
                            child: Text(
                              invoice.invoice,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          ShadTableCell(child: Text(invoice.paymentStatus)),
                          ShadTableCell(child: Text(invoice.paymentMethod)),
                          ShadTableCell(
                            alignment: Alignment.centerRight,
                            child: Text(
                              invoice.totalAmount,
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
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 300.w,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                    decoration: BoxDecoration(
                      color: context.colorScheme.surface,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Profile',
                              style: TextStyle(
                                fontSize: 22.sp,
                                letterSpacing: -0.3,
                                color: context.theme.colorScheme.primary,
                                fontFamily: StyleScheme.engFontFamily,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
                                backgroundColor: context.theme.colorScheme.secondaryContainer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                shadowColor: Colors.transparent,
                              ),
                              child: Wrap(
                                runAlignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text(
                                    'See Detail',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: context.theme.colorScheme.primary,
                                      fontFamily: StyleScheme.engFontFamily,
                                      letterSpacing: -0.5,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: context.theme.colorScheme.primary,
                                    size: 16.sp,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h,),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: context.theme.colorScheme.primary,
                              width: 2.sp,
                            ),
                            image:  const DecorationImage(
                              image: AssetImage('assets/image/aao_admin.png'),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: context.theme.colorScheme.primary.withOpacity(0.4),
                                blurRadius: 5.sp,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          constraints: BoxConstraints(
                            maxWidth: 100.w,
                            maxHeight: 100.w,
                          ),
                        ),
                        SizedBox(height: 12.h,),
                        Text(
                          '拉娜',
                          style: context.theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        Text(
                          '计算机学院 | 副教授',
                          style: context.theme.textTheme.titleMedium?.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 15.h,),
                        Wrap(
                          children: [
                            OutlinedButton(
                              onPressed: (){},
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.all(10),
                                side: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 1,
                                ),
                                shape: const CircleBorder(),
                                backgroundColor: Colors.grey.withOpacity(0.2),
                              ),
                              child: Icon(
                                Icons.edit,
                                size: 22.sp,
                                color: context.theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            OutlinedButton(
                              onPressed: (){},
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.all(10),
                                side: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 1,
                                ),
                                shape: const CircleBorder(),
                                backgroundColor: Colors.grey.withOpacity(0.2),
                              ),
                              child: Icon(
                                Icons.edit,
                                size: 22.sp,
                                color: context.theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            OutlinedButton(
                              onPressed: (){},
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.all(10),
                                side: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 1,
                                ),
                                shape: const CircleBorder(),
                                backgroundColor: Colors.grey.withOpacity(0.2),
                              ),
                              child: Icon(
                                Icons.notifications_active,
                                size: 22.sp,
                                color: context.theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Text(
                    'Coming Events',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontFamily: StyleScheme.engFontFamily,
                      fontWeight: FontWeight.w700,
                      color: context.theme.colorScheme.primary,
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 18.h),
                    decoration: BoxDecoration(
                      borderRadius: stheme.radius,
                      border: Border.all(color: stheme.colorScheme.border),
                      color: context.theme.colorScheme.surface,
                    ),
                    child: Row(
                      children: [
                        ShadImage.square(
                          LucideIcons.bellRing,
                          size: 24,
                          color: stheme.colorScheme.foreground,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Push Notifications',
                                  style: stheme.textTheme.small,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Send notifications to device.',
                                  style: stheme.textTheme.muted,
                                )
                              ],
                            ),
                          ),
                        ),
                        ValueListenableBuilder(
                          valueListenable: pushNotifications,
                          builder: (context, value, child) {
                            return ShadSwitch(
                              value: value,
                              onChanged: (v) => pushNotifications.value = v,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  EventCard(
                    event: Event(
                      id: 1,
                      type: 'Event',
                      title: '培养方案变更提醒',
                      time: DateTime.now(),
                      shortDesc: '培养方案变更提醒,培养方案变更提醒,培养方案变更提醒',
                    ),
                    color: context.theme.colorScheme.surface,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                    onTap: (event) {},
                  ),
                  SizedBox(height: 20.h,),
                  EventCard(
                    event: Event(
                      id: 1,
                      type: 'Event',
                      title: '培养方案变更提醒',
                      time: DateTime.now(),
                      shortDesc: '培养方案变更提醒,培养方案变更提醒,培养方案变更提醒',
                    ),
                    color: context.theme.colorScheme.surface,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                    onTap: (event) {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  // 固定是四个value
  Widget getRadialChart(List<double> values, List<Color> colors){
    int len = values.length;
    double radius = 30.w;
    double lineW = 12.w;
    Color backColor =  context.theme.colorScheme.primary.withOpacity(0.2);
    CircularPercentIndicator indicator= CircularPercentIndicator(
      radius: radius,
      lineWidth: lineW,
      circularStrokeCap: CircularStrokeCap.round,
      percent: values[len-1],
      progressColor: colors[len-1],
      backgroundColor: backColor,
      animation: true,
      animationDuration: 400,
    );
    for(int i = values.length-2; i>=0; --i){
      radius += 18.w;
      indicator = CircularPercentIndicator(
        radius: radius,
        lineWidth: lineW,
        circularStrokeCap: CircularStrokeCap.round,
        percent: values[i],
        center: indicator,
        progressColor: colors[i],
        backgroundColor: backColor,
        animation: true,
        animationDuration: 400,
      );
    }
    return indicator;
  }
  Widget getChart(ChartData cdata){
    return AspectRatio(
      aspectRatio: 2.2,
      child: LineChart(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        LineChartData(
          borderData: FlBorderData(
            show: true,
            border: Border(
              bottom: BorderSide(
                color: context.theme.colorScheme.primary.withOpacity(0.3),
                width: 1.sp,
              ),
              left: BorderSide(
                color: context.theme.colorScheme.primary.withOpacity(0.3),
                width: 1.sp,
              ),
              right: BorderSide.none,
              top: BorderSide.none,
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              curveSmoothness: 0.4,
              barWidth: 4.sp,
              spots: List.generate(cdata.xList.length, (index)=>FlSpot(cdata.xList[index].toDouble(), cdata.yList[index],),),
              gradient: const LinearGradient(
                colors: [Colors.indigoAccent, Colors.blue, Colors.green],
              ),
              isCurved: true,
              isStrokeCapRound: true,
              isStrokeJoinRound: true,
              preventCurveOverShooting: true,
              shadow: Shadow(
                color: context.theme.colorScheme.primary.withOpacity(0.3),
                blurRadius: 5,
              ),
            ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (LineBarSpot touchedSpot){
                return context.theme.colorScheme.primary;
              },
              getTooltipItems: (List<LineBarSpot> touchedSpots){
                return touchedSpots.map((LineBarSpot touchedSpot){
                  return LineTooltipItem(
                    FormatUtil.doubleToStr(touchedSpot.y),
                    TextStyle(
                      color: context.theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w500,
                      fontFamily: StyleScheme.engFontFamily,
                      fontSize: 12.sp,
                    ),
                  );
                }).toList();
              },
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            drawVerticalLine: true,
            horizontalInterval: 0.1,
            verticalInterval: 1,
            getDrawingHorizontalLine: (value) => FlLine(
              color: context.theme.colorScheme.primary.withOpacity(0.3),
              strokeWidth: 1.sp,
            ),
            getDrawingVerticalLine: (value) => FlLine(
              color: context.theme.colorScheme.primary.withOpacity(0.3),
              strokeWidth: 1.sp,
            ),
          ),
          titlesData: FlTitlesData(
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 0.1,
                getTitlesWidget: (value, meta){
                  return Text(
                    FormatUtil.doubleToStr(value),
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: StyleScheme.engFontFamily,
                      color: context.theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value,meta){
                  return Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: Text(
                      'Jan',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: StyleScheme.engFontFamily,
                        color: context.theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}