import 'package:first_form/RadioMapper.dart';
import 'package:first_form/bases/base_state.dart';
import 'package:first_form/bases/bloc_base.dart';
import 'package:rxdart/rxdart.dart';

import '../../../generated/l10n.dart';

class ProjectIndustryBloc extends BlocBase{
  final BehaviorSubject<List<RadioMapper>> industryListBehaviour = BehaviorSubject<List<RadioMapper>>();

  Stream<List<RadioMapper>> get projectIndustryStream => industryListBehaviour.stream;


  ProjectIndustryBloc(BuildContext context){
    List<RadioMapper> list = [];
    list.add(RadioMapper(label: S.of(context).commercial, id: 1, checked: true));
    list.add(RadioMapper(label: S.of(context).industrial, id: 2, checked: false));
    list.add(RadioMapper(label: S.of(context).educational, id: 3, checked: false));
    list.add(RadioMapper(label: S.of(context).informative, id: 4, checked: false));
    list.add(RadioMapper(label: S.of(context).marketing, id: 5, checked: false));
    list.add(RadioMapper(label: S.of(context).servicing, id: 6, checked: false));
    industryListBehaviour.sink.add(list);
  }

  void updateSelected(RadioMapper item){
    var list = industryListBehaviour.value;
    for (var element in list) {
      if(item.id == element.id) {
        element.checked = true;
      } else {
        element.checked = false;
      }
    }
    industryListBehaviour.sink.add(list);
  }


  @override
  void dispose() {
    industryListBehaviour.close();
  }

}