import 'package:first_form/bases/base_state.dart';
import 'package:rxdart/rxdart.dart';

import '../../../RadioMapper.dart';
import '../../../bases/bloc_base.dart';
import '../../../generated/l10n.dart';

class PreferredLanguageBloc extends BlocBase{

  final BehaviorSubject<List<RadioMapper>> preferredLanguageStream = BehaviorSubject();


  PreferredLanguageBloc(BuildContext context){
    final List<RadioMapper> list = [];
    list.add(RadioMapper(label: S
        .of(context)
        .arabicLanguage, id: 1, checked: true));
    list.add(RadioMapper(label: S
        .of(context)
        .englishLanguage, id: 2, checked: false));
    list.add(RadioMapper(label: S
        .of(context)
        .otherLanguage, id: 3, checked: false));
    preferredLanguageStream.sink.add(list);
  }


  void updateSelected(RadioMapper item){
    var list = preferredLanguageStream.value;
    for (var element in list) {
      if(item.id == element.id) {
        element.checked = true;
      } else {
        element.checked = false;
      }
    }
    preferredLanguageStream.sink.add(list);
  }

  @override
  void dispose() {
    preferredLanguageStream.close();
  }

}