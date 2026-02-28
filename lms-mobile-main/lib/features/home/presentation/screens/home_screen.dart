// lib/features/home/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/global/components/course_card.dart';
import 'package:path/path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

const Color _bg = Color(0xFFFCF8FF);
const Color _purple = Color(0xFF331E53);
const Color _border = Color(0xFFB7A4C6);
const Color _muted = Color(0xFF806D95);
const Color _buttonText = Color(0xFFFCF8FF);
const Color _textColor = Color(0xFF574C69);
final TextEditingController _searchController = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  // @override
  // void dispose() {
  //   _searchController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _bg,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                SizedBox(
                  height: 12.h,
                ),
                _buildSerachSection(),
                SizedBox(
                  height: 22.h,
                ),
                Text(
                  'Continue Learning',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: _purple,
                  ),
                ),
                SizedBox(
                  height: 9.h,
                ),
                _buildContinueLearning(),
                SizedBox(height: 22.h),
                Row(
                  children: [
                    Text(
                      'Top Courses',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: _purple,
                      ),
                    ),
                    SizedBox(
                      width: 150.w,
                    ),
                    GestureDetector(
                      onTap: () => {},
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.0.w),
                        child: Row(
                          children: [
                            Text(
                              'View all',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: _textColor,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15.w,
                              color: const Color(0xFF6C627C),
                            )
                            //TO DO
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                _buildTopCourses(),
                SizedBox(
                  height: 17.h,
                ),
                Text(
                  'Quick Action',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: _purple,
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                _buildQuickAction(),
                SizedBox(
                  height: 17.h,
                ),
                Text(
                  'Your Progress',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: _purple,
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                SizedBox(
                    height: 115.h,
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 11.w,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return _buildYourProgress();
                        }))
              ],
            ),
          ),
        )));
  }
}

Widget _buildHeader() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 4.h,
      ),
      Row(
        children: [
          SvgPicture.asset(
            'assets/images/Frame.svg',
            width: 21.w,
            height: 23.68.h,
            fit: BoxFit.contain,
          ),
          SizedBox(
            width: 3.w,
          ),
          Text(
            'Nucleus',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: _purple,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 16.r,
            backgroundColor: _purple.withOpacity(0.17),
            child: SvgPicture.asset(
              'assets/icons/notification.svg',
              width: 15.w,
              height: 16.h,
              colorFilter: const ColorFilter.mode(
                _muted,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(
            width: 6.w,
          ),
          CircleAvatar(
            radius: 16.r,
            backgroundColor: _purple.withOpacity(0.17),
            child: SvgPicture.asset(
              'assets/icons/cart.svg',
              width: 16.w,
              height: 16.h,
              colorFilter: const ColorFilter.mode(
                _muted,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 2.h,
      ),
      Text(
        'Hi, John! ',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: 'Ubuntu',
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: _purple,
        ),
      ),
      SizedBox(
        height: 6.h,
      ),
      SizedBox(
        width: 250.w,
        child: Text(
          'Find best course for you',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
            color: _purple,
          ),
        ),
      ),
      Text(
        'We have more than 90+ courses',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: _textColor,
        ),
      ),
    ],
  );
}

Widget _buildSerachSection() {
  return Container(
    height: 38.h,
    //width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 14.w),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: _border, width: 0.5),
      borderRadius: BorderRadius.circular(12.r),
    ),
    alignment: Alignment.centerLeft,
    child: TextField(
      controller: _searchController,
      keyboardType: TextInputType.text,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: _textColor,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Search course, topic, mentor...',
        hintStyle: TextStyle(
          color: _purple,
          fontFamily: 'Inter',
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        isCollapsed: true,
        contentPadding: EdgeInsets.only(top: 0.1.h),
        prefixIcon: SvgPicture.asset(
          'assets/icons/search.svg',
          colorFilter: const ColorFilter.mode(
            _textColor,
            BlendMode.srcIn,
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 13.w,
          minHeight: 13.h,
        ),
      ),
    ),
  );
}

Widget _buildContinueLearning() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppCard(
        backgroundColor: _border.withOpacity(0.2),
        borderRadius: 18.r,
        height: 160.h,
        width: 360.w,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0.w),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                        "assets/images/im1.jpg",
                        width: 105.w,
                        height: 79.h,
                        fit: BoxFit.cover,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0.w, bottom: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 140.w,
                        height: 50.h,
                        child: Text(
                          'Complete React Development',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: _purple,
                          ),
                        ),
                      ),
                      Text(
                        'Michael Torres',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: _textColor,
                        ),
                      ),
                      SizedBox(
                        width: 220.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(12.r),
                            value: 0.75,
                            backgroundColor: const Color(0xFF808792),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFF00C2AC)),
                            minHeight: 6.h,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '68% complete',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF00C2AC),
                            ),
                          ),
                          SizedBox(
                            width: 60.w,
                          ),
                          Text(
                            '4h 20m left',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: _textColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            // SizedBox(height: 3.h,),
            SizedBox(
              width: 344.w,
              height: 30.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _border.withOpacity(0.6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  elevation: 0,
                ),
                onPressed: () => {},
                child: Text(
                  'Continue Course',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: _purple,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _buildTopCourses() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, _) {
          return Column(
            children: [
              Builder(builder: (context) {
                return Padding(
                  padding: EdgeInsets.all(4.w),
                  child: AppCard(
                    backgroundColor: Colors.white,
                    borderRadius: 18.r,
                    height: 125.h,
                    width: 361.w,
                    borderColor: _border,
                    borderWidth: 0.5.w,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 7.0.w),
                          child: Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.asset(
                                    "assets/images/im1.jpg",
                                    width: 140.w,
                                    height: 100.h,
                                    fit: BoxFit.cover,
                                  )),
                              Positioned(
                                  top: 8.h,
                                  left: 8.w,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      color: _purple.withOpacity(0.2),
                                    ),
                                    width: 24.w,
                                    height: 14.h,
                                    child: Text(
                                      "49\$",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 140.w,
                                height: 50.h,
                                child: Text(
                                  'Complete React Development',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: _purple,
                                  ),
                                ),
                              ),
                              Text(
                                'Michael Torres',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: _textColor,
                                ),
                              ),
                              SizedBox(
                                height: 13.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time_filled,
                                    size: 10.w,
                                    color: _textColor,
                                  ),
                                  Text(
                                    '12h 30m',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: _textColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  Icon(
                                    Icons.signal_cellular_alt,
                                    size: 10.w,
                                    color: _textColor,
                                  ),
                                  Text(
                                    'Beginner',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: _textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: () => {},
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 20.w,
                              color: _textColor,
                            )),
                      ],
                    ),
                  ),
                );
              }),
            ],
          );
        },
      ),
    ],
  );
}

Widget _buildQuickAction() {
  return Row(
    spacing: 4.w,
    children: [
      AppCard(
          height: 114.h,
          width: 114.w,
          backgroundColor: _border.withOpacity(0.2),
          borderRadius: 18.r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/library.svg',
                width: 21.w,
                height: 24.h,
                colorFilter: const ColorFilter.mode(
                  _purple,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'My Library',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: _purple,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: _textColor,
                  ),
                  children: [
                    //const TextSpan(text: 'We have more than '),
                    TextSpan(
                      text: '12',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xFF00C2AC),
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                    const TextSpan(text: ' Courses'),
                  ],
                ),
              )
            ],
          )),
      AppCard(
          height: 114.h,
          width: 114.w,
          backgroundColor: _border.withOpacity(0.2),
          borderRadius: 18.r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/exercise.svg',
                width: 24.w,
                height: 24.h,
                colorFilter: const ColorFilter.mode(
                  _purple,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Exercises',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: _purple,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: _textColor,
                  ),
                  children: [
                    //const TextSpan(text: 'We have more than '),
                    TextSpan(
                      text: '13',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xFF00C2AC),
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                    const TextSpan(text: ' Exercises'),
                  ],
                ),
              )
            ],
          )),
      AppCard(
          height: 114.h,
          width: 114.w,
          backgroundColor: _border.withOpacity(0.2),
          borderRadius: 18.r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/news.svg',
                width: 24.w,
                height: 24.h,
                colorFilter: const ColorFilter.mode(
                  _purple,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Last News',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: _purple,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: _textColor,
                  ),
                  children: [
                    TextSpan(
                      text: '3',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xFF00C2AC),
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                    const TextSpan(text: ' New'),
                  ],
                ),
              )
            ],
          )),
    ],
  );
}

Widget _buildYourProgress() {
  return AppCard(
    width: 270.w,
    borderColor: _border,
    borderRadius: 18.r,
    borderWidth: 0.5.w,
    backgroundColor: Colors.white,
    child: Padding(
      padding: EdgeInsets.only(left: 4.0.w, top: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 4.0.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    width: 60.w,
                    height: 60.h,
                    color: Color(0xFF8B9CEF),
                    child: Center(
                      // child: Image.asset(
                      //     width: 50.w,
                      //     height: 50.h,
                      //     "assets/images/html_1.png"),
                      child: Icon(
                        Icons.code,
                        color: Colors.black,
                        size: 35.w,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Basic HTML and CSS',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: _purple,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    '58/68 Videos',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: _textColor,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(12.r),
                value: 0.75,
                backgroundColor: const Color(0xFF808792),
                valueColor:
                    const AlwaysStoppedAnimation<Color>(Color(0xFF00C2AC)),
                minHeight: 6.h,
              ),
            ),
          ),
          Text(
            'Course Completed 85%',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF00C2AC),
            ),
          ),
        ],
      ),
    ),
  );
}
