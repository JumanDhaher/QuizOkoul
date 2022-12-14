import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

import '../../../api/user_info.dart';
import '../../../config/empty_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var first = true;
  late Box<Map<dynamic, dynamic>> boxData;
  @override
  void initState() {
    super.initState();
    boxData = Hive.box("score");
  }

  var future;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (first) {
      future = UserInfoApi().fetchAndSetUserInfo();
      first = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text('Profile Information:'),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(snapshot.data!['name']),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(snapshot.data!['mobile']),
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/images/profile.svg',
                          fit: BoxFit.cover,
                          width: 200,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'My Score',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: boxData.listenable(),
                    builder: (BuildContext context,
                        Box<Map<dynamic, dynamic>> value, Widget? child) {
                      if (boxData.isEmpty) {
                        return Column(
                          children: const [
                            EmptyStateSvg(
                              image: 'assets/images/no_data.svg',
                            ),
                            Text('You Didnot Have Any Score')
                          ],
                        );
                      }
                      if (boxData.length > 0) {
                        return ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          reverse: true,
                          itemCount: boxData.length,
                          itemBuilder: (context, index) {
                            Map<dynamic, dynamic>? box = boxData.getAt(index);
                            return Container(
                                margin: const EdgeInsets.all(12),
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 3,
                                    )
                                  ],
                                  color: Theme.of(context).cardColor,
                                ),
                                child: ListTile(
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Date Time: ${DateFormat("yyyy-MM-dd HH:mm").format(DateTime.parse(box!['date'].toString())).toString()}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        'score: ${box['score']}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                ));
                          },
                        );
                      } else {
                        return const Center();
                      }
                    },
                  ),
                ],
              ),
            );
          }
          return Container();
        });
  }
}
