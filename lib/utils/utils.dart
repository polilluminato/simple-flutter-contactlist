String createEmail(String firstName, String lastName, String domainname){
  return "${lastName.toLowerCase()}.${firstName.toLowerCase()}@$domainname";
}

String createUsername(String firstName, String lastName){
  return "${lastName.toLowerCase()}_${firstName.toLowerCase()}";
}