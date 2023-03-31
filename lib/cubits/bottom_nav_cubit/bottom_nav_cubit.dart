import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';



class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  switchIndex(int index){
    emit(index);
  }
}
