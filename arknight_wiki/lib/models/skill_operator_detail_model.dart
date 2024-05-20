class SkillOperatorDetailModel {
  final String name;
  final String image;
  final String spChargeType;
  final String skillActivation;
  final String duration;
  final List<SkillEffectsMaterials> skillEffectsMaterials;

  SkillOperatorDetailModel(
      {required this.duration,
      required this.image,
      required this.name,
      required this.skillActivation,
      required this.spChargeType,
      required this.skillEffectsMaterials,});
}

class SkillEffectsMaterials {
  final String skillEffects;
   final int spCost;
  final int initialSp;
  final List<Materials> materialsList;

  SkillEffectsMaterials(
      {required this.materialsList, required this.skillEffects,required this.initialSp,
      required this.spCost});
}

class Materials {
  final String id_materials;
  final String name;
  final int quantity;
  final String image;

  Materials(
      {required this.id_materials, required this.image, required this.name,required this.quantity});
}
