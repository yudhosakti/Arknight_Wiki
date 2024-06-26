import 'package:arknight_wiki/provider/operator_information_provider.dart';
import 'package:arknight_wiki/provider/reviews_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final changeLayout =
    ChangeNotifierProvider((ref) => OperatorInformationProvider());

final changeSkillOperator =
    ChangeNotifierProvider((ref) => OperatorInformationProvider());

final changeExpandReviews = ChangeNotifierProvider((ref) => ReviewsProvider());
