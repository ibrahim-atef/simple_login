class Dummy {
  List<Problems>? problems;

  Dummy({this.problems});

  Dummy.fromJson(Map<String, dynamic> json) {
    if (json['problems'] != null) {
      problems = <Problems>[];
      json['problems'].forEach((v) {
        problems!.add(new Problems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.problems != null) {
      data['problems'] = this.problems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Problems {
  List<Diabetes>? diabetes;

  Problems({this.diabetes});

  Problems.fromJson(Map<String, dynamic> json) {
    if (json['Diabetes'] != null) {
      diabetes = <Diabetes>[];
      json['Diabetes'].forEach((v) {
        diabetes!.add(new Diabetes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.diabetes != null) {
      data['Diabetes'] = this.diabetes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Diabetes {
  List<Medications>? medications;

  Diabetes({this.medications});

  Diabetes.fromJson(Map<String, dynamic> json) {
    if (json['medications'] != null) {
      medications = <Medications>[];
      json['medications'].forEach((v) {
        medications!.add(new Medications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.medications != null) {
      data['medications'] = this.medications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Medications {
  List<MedicationsClasses>? medicationsClasses;

  Medications({this.medicationsClasses});

  Medications.fromJson(Map<String, dynamic> json) {
    if (json['medicationsClasses'] != null) {
      medicationsClasses = <MedicationsClasses>[];
      json['medicationsClasses'].forEach((v) {
        medicationsClasses!.add(new MedicationsClasses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.medicationsClasses != null) {
      data['medicationsClasses'] =
          this.medicationsClasses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MedicationsClasses {
  ClassName? className;

  MedicationsClasses({this.className});

  MedicationsClasses.fromJson(Map<String, dynamic> json) {
    className = json['className'] != null
        ? new ClassName.fromJson(json['className'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.className != null) {
      data['className'] = this.className!.toJson();
    }
    return data;
  }
}

class ClassName {
  List<AssociatedDrug>? associatedDrug;

  ClassName({this.associatedDrug});

  ClassName.fromJson(Map<String, dynamic> json) {
    if (json['associatedDrug'] != null) {
      associatedDrug = <AssociatedDrug>[];
      json['associatedDrug'].forEach((v) {
        associatedDrug!.add(new AssociatedDrug.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.associatedDrug != null) {
      data['associatedDrug'] =
          this.associatedDrug!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AssociatedDrug {
  String? name;
  String? dose;
  String? strength;

  AssociatedDrug({this.name, this.dose, this.strength});

  AssociatedDrug.fromJson(  json) {
    name = json['name'];
    dose = json['dose'];
    strength = json['strength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['dose'] = this.dose;
    data['strength'] = this.strength;
    return data;
  }
}
