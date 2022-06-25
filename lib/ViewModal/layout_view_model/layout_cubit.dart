import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Screens/camera/camera.dart';
import 'package:shop/Shared/global/globals.dart';
import '../../screens/call/call_screen.dart';
import '../../screens/chat/chat_screen.dart';
import 'layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutIntialState());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomScreen = [
    ChatScreen(),
    CallScreen(),
    ModelPage(
      cameras: cameras,
    )
  ];

  void ChangeBottom(int index) {
    currentIndex = index;
    emit(LayoutChangeBottomNavState());
  }
}
