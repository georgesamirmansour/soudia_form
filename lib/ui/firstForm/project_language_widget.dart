import 'package:first_form/RadioMapper.dart';
import 'package:first_form/widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/l10n.dart';

class ProjectLanguageWidget extends StatefulWidget {
  final Function(RadioMapper radioMapper) onSelectLanguage;
  const ProjectLanguageWidget({Key? key, required this.onSelectLanguage}) : super(key: key);

  @override
  State<ProjectLanguageWidget> createState() => _ProjectLanguageWidgetState();
}

class _ProjectLanguageWidgetState extends State<ProjectLanguageWidget> {

  final List<RadioMapper> list = [];



  @override
  void initState() {
    super.initState();
  }

  void initLanguageList() {
    list.add(RadioMapper(label: S
        .of(context)
        .arabicLanguage, id: 1, checked: true));
    list.add(RadioMapper(label: S
        .of(context)
        .englishLanguage, id: 1, checked: false));
    list.add(RadioMapper(label: S
        .of(context)
        .otherLanguage, id: 1, checked: false));
  }

  @override
  Widget build(BuildContext context) {
    initLanguageList();
    return ListView.separated(itemBuilder: (context, index) =>
        CustomRadioButtonWidget(labelText: list[index].label,
            onChanged: (value) => updateList(value),
            mapper: list[index]),
      separatorBuilder: (context, index) => SizedBox(width: 20.w,),
      itemCount: list.length,
      shrinkWrap: false,
      scrollDirection: Axis.horizontal,);
    // return Container();
  }

  void updateList(RadioMapper? value) {
    widget.onSelectLanguage(value!);
    for (var element in list) {
      if(element.id == value.id){
        element.checked = true;
      }else {
        element.checked = false;
      }
    }
    setState(() {});
  }
}
