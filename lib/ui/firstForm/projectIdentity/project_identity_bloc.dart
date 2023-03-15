import 'package:BROADCAST/bases/base_state.dart';
import 'package:rxdart/rxdart.dart';

import '../../../RadioMapper.dart';
import '../../../bases/bloc_base.dart';
import '../../../generated/l10n.dart';

class ProjectIdentityBloc extends BlocBase {
  final BehaviorSubject<List<RadioMapper>> projectIdentityStream =
      BehaviorSubject();
  List<RadioMapper> _selectedList = [];

  ProjectIdentityBloc(BuildContext context) {
    final List<RadioMapper> list = [];
    list.add(
        RadioMapper(label: S.of(context).personalCard, id: 1, checked: false));
    list.add(RadioMapper(
        label: S.of(context).envelopesOfDifferentSize, id: 2, checked: false));
    list.add(
        RadioMapper(label: S.of(context).paperFile, id: 3, checked: false));
    list.add(
        RadioMapper(label: S.of(context).paperPages, id: 4, checked: false));
    list.add(RadioMapper(
        label: S.of(context).noteBooksAndPens, id: 5, checked: false));
    list.add(RadioMapper(label: S.of(context).rollUp, id: 6, checked: false));
    list.add(RadioMapper(label: S.of(context).profile, id: 7, checked: false));
    list.add(RadioMapper(
        label: S.of(context).businessIdentityHandBook, id: 8, checked: false));
    list.add(RadioMapper(
        label: S.of(context).powerPointPresentationTemplates,
        id: 9,
        checked: false));
    list.add(RadioMapper(
        label: S.of(context).designOfCommunicationSitesSocial,
        id: 10,
        checked: false));
    list.add(RadioMapper(
        label: S.of(context).webSiteDesign, id: 11, checked: false));
    list.add(RadioMapper(
        label: S.of(context).signageDesign, id: 12, checked: false));
    list.add(RadioMapper(label: S.of(context).clothes, id: 13, checked: false));
    list.add(RadioMapper(label: S.of(context).cars, id: 14, checked: false));
    projectIdentityStream.sink.add(list);
  }

  void updateSelected(RadioMapper item) {
    var list = projectIdentityStream.value;
    list.forEach((element) {
      if(item.id == element.id){
        item.checked = element.checked;
      }
    });
    _selectedList = list.where((element) => element.checked).toList();
    projectIdentityStream.sink.add(list);
  }

  List<RadioMapper> get selectedList => _selectedList;

  @override
  void dispose() {
    projectIdentityStream.close();
  }
}
