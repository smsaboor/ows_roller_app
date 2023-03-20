
import 'package:flutter/material.dart';
import 'package:ows_roller_app/view/app_widgets/avtar_image_assets.dart';
class BodyProfile extends StatelessWidget {
  BodyProfile({Key? key}) : super(key: key);
  final bool flagUserData=true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade400, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(top: 0.0),
                                child: AvatarImageAssets(
                                  'assets/images/img.png',
                                  radius: 80,
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                              Positioned(
                                top: 35,
                                left: 35,
                                child: GestureDetector(
                                  onTap: () {
                                  },
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.edit,
                                        size: 18,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Text('ID:99100817')
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Column(
                      children: [
                        Text('User Name'),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mobile & Email'),
                    Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          width: 100,
                        )),
                        ElevatedButton(onPressed: () {}, child: Text('Verify'))
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Total Balance'),
                        Spacer(),
                        Text('₹15'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Deposit Balance'),
                        Spacer(),
                        Text('₹25'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Withdrawal Balance'),
                        Spacer(),
                        Text('₹10'),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
