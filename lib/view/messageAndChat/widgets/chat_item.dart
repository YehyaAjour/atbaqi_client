import 'package:atbaqi_client/core/utils/app_imports.dart';

class ChatItem extends StatelessWidget {
  final Map<String, dynamic> map;
  final String lastMessage;
  final int count;
  ChatItem(
    this.map,
    this.lastMessage,
    this.count,
  );
  bool isRead = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/person.png'),
                ),
                CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.green,
                )
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                CustomText(
                  map["usersInfo"]["name"] ?? "",
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
                CustomText(
                  lastMessage ?? "",
                  fontWeight: FontWeight.normal,
                  color: AppColors.grey,
                  fontSize: 14.sp,
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CustomText(
                // map,
                //   fontSize: 12,
                //   color: Color(0xff77838F),
                //   fontFamily: 'din',
                //   fontWeight: FontWeight.normal,
                // ),
                //   SizedBox(
                //     height: 16,
                //   ),
                //  Icon(Icons.check,
                //  color: AppColors.grey,
                //  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
