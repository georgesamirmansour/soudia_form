
import 'package:first_form/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

final MultiValidator emptyValid = MultiValidator([
  RequiredValidator(errorText: S.current!.required),
]);


class Validator {
  MultiValidator emptyValidator(BuildContext context) => MultiValidator([
        RequiredValidator(errorText: S.of(context).required),
      ]);


  bool notEmptyValid(String? value) => emptyValid.isValid(value);

}
