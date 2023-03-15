import 'package:BROADCAST/RadioMapper.dart';
import 'package:BROADCAST/ui/firstForm/projectIndustry/project_industry_bloc.dart';
import 'package:BROADCAST/ui/firstForm/projectPattern/project_pattern_bloc.dart';
import 'package:BROADCAST/widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bases/bloc_base.dart';

class ProjectPatternWidget extends StatefulWidget {
  final Function(RadioMapper radioMapper) onSelectItem;
  final ScrollController scrollController;
  const ProjectPatternWidget({Key? key, required this.onSelectItem, required this.scrollController})
      : super(key: key);

  @override
  State<ProjectPatternWidget> createState() => _ProjectLanguageWidgetState();
}

class _ProjectLanguageWidgetState extends State<ProjectPatternWidget> {
  late ProjectPatternBloc _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = ProjectPatternBloc(context);
    widget.onSelectItem(_bloc.patternListBehaviour.value.first);
    return _blocProvider;
  }

  bool _isMobile() => MediaQuery.of(context).size.width < 1200;

  BlocProvider get _blocProvider =>
      BlocProvider(bloc: _bloc, child: _screenDesign);

  StreamBuilder<List<RadioMapper>> get _screenDesign => StreamBuilder(
      initialData: const [],
      stream: _bloc.projectPatternStream,
      builder: (context, snapshot) => _isMobile()
          ? _buildView(snapshot)
          : SizedBox(
              height: 80.h,
              width: MediaQuery.of(context).size.width,
              child: _buildView(snapshot),
            ));

  GridView _buildView(AsyncSnapshot<List<RadioMapper>> snapshot) {
    return GridView.builder(
      // controller: widget.scrollController,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _isMobile() ? 2 : 3,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: _isMobile()
            ? 4
            : MediaQuery.of(context).size.aspectRatio * 2.7,),
      itemBuilder: (context, index) => CustomRadioButtonWidget(
          labelText: snapshot.data![index].label,
          selectedItem: snapshot.data!.singleWhere(
            (element) => element.checked,
            orElse: () => snapshot.data!.first,
          ),
          onChanged: (value) =>
              {_bloc.updateSelected(value), widget.onSelectItem(value)},
          mapper: snapshot.data![index]),
      itemCount: snapshot.data!.length,
      shrinkWrap: true,
    );
  }
}
