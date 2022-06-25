import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Screens/Login/Loginpage.dart';
import 'package:shop/Screens/Splash.dart';
import 'package:shop/Shared/SharedPreference/pref.dart';
import 'package:shop/Shared/constaness/constanesApp.dart';
import '../../Shared/component/component.dart';
import '../../ViewModal/layout_view_model/layout_cubit.dart';
import '../../ViewModal/layout_view_model/layout_states.dart';
import '../search/search_screen.dart';
import '../setting/setting_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

enum yourChoice { setting, profile, logout }

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    dynamic _selection;

    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: PopupMenuButton<yourChoice>(
              onSelected: (yourChoice result) {
                setState(() {
                  if (result == yourChoice.setting) {
                    navigateTo(context, SettingScreen());
                  } else if (result == yourChoice.logout) {
                    Preference.clearprefrences(context: context);
                  }
                });
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<yourChoice>>[
                const PopupMenuItem<yourChoice>(
                  value: yourChoice.setting,
                  child: Text('Setting'),
                ),
                const PopupMenuItem<yourChoice>(
                  value: yourChoice.profile,
                  child: Text('Profile'),
                ),
                const PopupMenuItem<yourChoice>(
                  value: yourChoice.logout,
                  child: Text('Logout'),
                ),
              ],
            ),
            title: InkWell(
              onTap: () {
                setState(() {
                  navigateTo(context, SearchScreen());
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[200],
                ),
                padding: const EdgeInsets.all(5.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 5.0,
                      ),
                      Text('search ...',
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      Spacer(),
                      Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ]),
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://cdn.dribbble.com/users/2987571/screenshots/7084912/luffy-01_4x.png'),
                ),
              ),
            ],
          ),
          body: cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color(0xFFFAFAFA),
            onTap: (index) {
              cubit.ChangeBottom(index);
            },
            selectedItemColor: const Color(0xFF4f7492),
            currentIndex: cubit.currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.video_call_rounded,
                    size: 30,
                  ),
                  label: 'Video'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.camera_alt,
                    size: 30,
                  ),
                  label: 'Camera'),
            ],
          ),
        );
      },
    );
  }
}
