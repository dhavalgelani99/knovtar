class Experience{
  final String organization;
  final String designation;
  final String fromdate;
  final String todate;
  final String role;

  Experience({
    required this.organization,
    required this.designation,
    required this.fromdate,
    required this.todate,
    required this.role,
});
}

class Project{
  final String title;
  final String desc;
  final String duration;
  final String prorole;
  final String teamsize;

  Project({
    required this.title,
    required this.desc,
    required this.duration,
    required this.prorole,
    required this.teamsize,
});
}