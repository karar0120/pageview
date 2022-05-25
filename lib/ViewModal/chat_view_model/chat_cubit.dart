import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_state.dart';


class ChatCubit extends Cubit<ChatStates>
{
  ChatCubit() : super(ChatIntialState());
  static ChatCubit get(context)=>BlocProvider.of(context);


}