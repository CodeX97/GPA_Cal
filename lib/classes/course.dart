import 'dart:ffi';

class CSE {
  List<Sem> semesters;

  CSE({
    this.semesters,
  });

  factory CSE.fromJson(List<dynamic> parsedJson) {
    List<Sem> sems = new List<Sem>();
    sems = parsedJson.map((i) => Sem.fromJson(i)).toList();
    return new CSE(
      semesters: sems,
    );
  }
}

class Sem {
  int sem;
  List<Module> modules;

  Sem({
    this.sem,
    this.modules,
  });

  factory Sem.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['modules'] as List;
    List<Module> imagesList = list.map((i) => Module.fromJson(i)).toList();
    return Sem(
      sem: parsedJson['sem'],
      modules: imagesList,
    );
  }
}

class Module {
  String moduleId;
  String moduleName;
  double credit;
  int isElective;

  Module({
    this.moduleId,
    this.moduleName,
    this.credit,
    this.isElective,
  });

  factory Module.fromJson(Map<String, dynamic> parsedJson) {
    return Module(
      moduleId: parsedJson['module_id'],
      moduleName: parsedJson['module_name'],
      credit: parsedJson['credit'],
      isElective: parsedJson['elective'],
    );
  }
}
