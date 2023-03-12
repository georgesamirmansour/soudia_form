import 'package:first_form/RadioMapper.dart';
import 'package:first_form/ui/firstForm/preferredLanguage/preferred_language_bloc.dart';
import 'package:first_form/widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bases/bloc_base.dart';

class ProjectLanguageWidget extends StatefulWidget {
  final Function(RadioMapper radioMapper) onSelectItem;

  const ProjectLanguageWidget({Key? key, required this.onSelectItem})
      : super(key: key);

  @override
  State<ProjectLanguageWidget> createState() => _ProjectLanguageWidgetState();
}

class _ProjectLanguageWidgetState extends State<ProjectLanguageWidget> {
  late PreferredLanguageBloc _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = PreferredLanguageBloc(context);
    widget.onSelectItem(_bloc.preferredLanguageStream.value.first);
    return _blocProvider;
  }

  BlocProvider get _blocProvider =>
      BlocProvider(bloc: _bloc, child: _screenDesign);

  StreamBuilder<List<RadioMapper>> get _screenDesign => StreamBuilder(
        builder: (context, snapshot) => SizedBox(
          height: 60.h,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            itemBuilder: (context, index) => CustomRadioButtonWidget(
                labelText: snapshot.data![index].label,
                selectedItem: snapshot.data!.singleWhere(
                  (element) => element.checked,
                  orElse: () => snapshot.data!.first,
                ),
                onChanged: (value) => {
                      _bloc.updateSelected(value),
                      widget.onSelectItem(value)
                    },
                mapper: snapshot.data![index]),
            separatorBuilder: (context, index) => SizedBox(
              width: 20.w,
            ),
            itemCount: snapshot.data!.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
        initialData: const [],
        stream: _bloc.preferredLanguageStream,
      );
}
