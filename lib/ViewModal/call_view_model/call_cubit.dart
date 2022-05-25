import 'package:flutter_bloc/flutter_bloc.dart';
import 'call_state.dart';



class CallCubit extends Cubit<CallStates>
{
  CallCubit() : super(CallIntialState());
  static CallCubit get(context)=>BlocProvider.of(context);


}