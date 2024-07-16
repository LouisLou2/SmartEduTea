enum Role {
  aaoAdmin,
  teacher,
  student,
}

String getRoleText(Role role) {
  switch (role) {
    case Role.aaoAdmin:
      return 'AAO';
    case Role.teacher:
      return 'TEA';
    case Role.student:
      return 'STU';
  }
}