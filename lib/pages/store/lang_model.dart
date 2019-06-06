import 'package:scoped_model/scoped_model.dart';
// import './models.dart';

class LangModle extends Model{
  String _lang = 'zh';

  get lang => _lang;

  setLang(){
    if(_lang=='zh'){
      _lang = 'en';
    }else{
      _lang='zh';
    }
    notifyListeners();
  }

  // LangModle of(context)=>ScopedModel.of<LangModle>(context,rebuildOnChange:true);
}