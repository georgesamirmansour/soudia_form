import 'package:first_form/RadioMapper.dart';
import 'package:first_form/bases/base_state.dart';
import 'package:first_form/bases/bloc_base.dart';
import 'package:rxdart/rxdart.dart';

import '../../../generated/l10n.dart';

class ProjectPatternBloc extends BlocBase{
  final BehaviorSubject<List<RadioMapper>> patternListBehaviour = BehaviorSubject<List<RadioMapper>>();

  Stream<List<RadioMapper>> get projectPatternStream => patternListBehaviour.stream;


  ProjectPatternBloc(BuildContext context){
    List<RadioMapper> list = [];
    list.add(RadioMapper(label: S.of(context).dynamic, id: 1, checked: true));
    list.add(RadioMapper(label: S.of(context).linear, id: 2, checked: false));
    list.add(RadioMapper(label: S.of(context).textual, id: 3, checked: false));
    list.add(RadioMapper(label: S.of(context).character, id: 4, checked: false));
    list.add(RadioMapper(label: S.of(context).mixed, id: 5, checked: false));
    patternListBehaviour.sink.add(list);
  }

  void updateSelected(RadioMapper item){
    var list = patternListBehaviour.value;
    for (var element in list) {
      if(item.id == element.id) {
        element.checked = true;
      } else {
        element.checked = false;
      }
    }
    patternListBehaviour.sink.add(list);
  }

  @override
  void dispose() {
    patternListBehaviour.close();
  }

}