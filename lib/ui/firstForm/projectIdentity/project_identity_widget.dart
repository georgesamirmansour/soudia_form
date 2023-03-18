import 'package:BROADCAST/RadioMapper.dart';
import 'package:BROADCAST/ui/firstForm/preferredLanguage/preferred_language_bloc.dart';
import 'package:BROADCAST/ui/firstForm/projectIdentity/project_identity_bloc.dart';
import 'package:BROADCAST/widgets/custom_check_box.dart';
import 'package:BROADCAST/widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bases/bloc_base.dart';

class ProjectIdentityWidget extends StatefulWidget {
  final Function(List<RadioMapper> radioMapper) selectedList;
  final ScrollController scrollController;
  const ProjectIdentityWidget({Key? key, required this.selectedList, required this.scrollController})
      : super(key: key);

  @override
  State<ProjectIdentityWidget> createState() => _ProjectLanguageWidgetState();
}

class _ProjectLanguageWidgetState extends State<ProjectIdentityWidget> {
  late ProjectIdentityBloc _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = ProjectIdentityBloc(context);
    return _blocProvider;
  }

  bool _isMobile() => MediaQuery.of(context).size.width < 1200;

  BlocProvider get _blocProvider =>
      BlocProvider(bloc: _bloc, child: _screenDesign);

  StreamBuilder<List<RadioMapper>> get _screenDesign => StreamBuilder(
      initialData: const [],
      stream: _bloc.projectIdentityStream,
      builder: (context, snapshot) => _isMobile()
          ? _buildView(snapshot)
          : SizedBox(
              height: 250.h,
              width: MediaQuery.of(context).size.width,
              child: _buildView(snapshot),
            ));

  GridView _buildView(AsyncSnapshot<List<RadioMapper>> snapshot) {
    return GridView.builder(
      // controller: widget.scrollController,
      primary: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _isMobile() ? 2 : 3,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: _isMobile()
            ? 3
            : MediaQuery.of(context).size.aspectRatio * 2.7,
      ),
      itemBuilder: (context, index) => CustomCheckBoxWidget(
          labelText: snapshot.data![index].label,
          checked: snapshot.data![index].checked,
          onChange: (value) => {
                _bloc.updateSelected(value),
                widget.selectedList(_bloc.selectedList)
              },
          mapper: snapshot.data![index]),
      itemCount: snapshot.data!.length,
      shrinkWrap: true,
    );
  }
}
