import 'package:scoped_model/scoped_model.dart';


class CountModel extends Model{
  int _count = 1;

  get count=>_count;
  

  void increment(){
    _count=_count+1;
    notifyListeners();
  }

  void decrement(){
    _count=_count-1;
    notifyListeners();
  }
}