//   import 'package:atbaqi_client/core/utils/app_imports.dart';
// import 'package:chat_bubbles/chat_bubbles.dart';

// class ChatScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(18.0),
//                 child: Row(
//                   children: [
//                     BackButton(
//                       onPressed: () {
//                         Get.back();
//                       },
//                       color: Colors.black,
//                     ),
//                   ],
//                 ),
//               ),
//               Spacer(),
//               roundedImage(
//                 foodImagePosition: FoodImagePosition.bottomRight,
//                 imageUrl: 'assets/images/geometry.jpeg',
//               ),
//             ],
//           ),
//           Expanded(
//             child: ListView.separated(
//               physics: BouncingScrollPhysics(),
//               itemCount: 1,
//               itemBuilder: (context, index) {
//                 return Column(
//                   children: [
//                     BubbleSpecialThree(
//                       text: 'برجر حجم عائلي ',
//                       color: AppColors.primaryColor,
//                       tail: false,
//                       textStyle: TextStyle(
//                           color: AppColors.whiteColor,
//                           fontSize: 16.sp,
//                           fontFamily: "din"),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     BubbleSpecialThree(
//                       text:
//                           '''تكلفة التوصيل 13 ريال وقت التوصيل نصف ساعة 
//                       تكلفة التوصيل 13 ريال وقت التوصيل نصف ساعة ''',
//                       color: Color(0xffFFCB00),
//                       tail: true,
//                       textStyle: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16.sp,
//                           fontFamily: "din"),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     BubbleSpecialThree(
//                       text:
//                           'معك أحمد، ارجو منك تأكيد الطلب. يسعدني ان أقوم بتوصيل طلبك  ',
//                       color: Color(0xffEFEFF4),
//                       tail: false,
//                       isSender: false,
//                       textStyle: TextStyle(fontFamily: "din"),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     BubbleSpecialThree(
//                       text: 'تم',
//                       color: Color(0xffFFCB00),
//                       tail: false,
//                       textStyle:
//                           TextStyle(color: Colors.white, fontSize: 16.sp),
//                     ),
//                   ],
//                 );
//               },
//               separatorBuilder: (BuildContext context, int index) {
//                 return SizedBox(
//                   height: 15,
//                 );
//               },
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.all(15.0),
//             height: 61,
//             child: Row(
//               children: [
//                 IconButton(
//                   icon: CustomSvgImage(
//                     height: 40.h,
//                     width: 40.w,
//                     color: AppColors.primaryColor,
//                     imageName: 'send',
//                   ),
//                   onPressed: () {},
//                 ),
//                 SizedBox(width: 15),
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(35.0),
//                       boxShadow: [
//                         BoxShadow(
//                             offset: Offset(0, 3),
//                             blurRadius: 5,
//                             color: Colors.grey)
//                       ],
//                     ),
//                     child: TextField(
//                       textAlign: TextAlign.right,
//                       decoration: InputDecoration(
//                           contentPadding: EdgeInsets.symmetric(horizontal: 10),
//                           hintText: "اكتب رسالتك ...",
//                           hintStyle: TextStyle(
//                               color: Colors.grey,
//                               fontFamily: "din",
//                               fontSize: 16.sp),
//                           border: InputBorder.none),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
