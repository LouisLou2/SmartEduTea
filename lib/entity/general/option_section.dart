import 'package:smart_edu_tea/entity/term.dart';

class OptionSection{
  String title;
  List<String> options;

  OptionSection({required this.title, required this.options});

  OptionSection.fromTerm(List<Term> terms):
    title='Terms',
    options=terms.map((e) => e.toString()).toList();
}