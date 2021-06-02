String createEmail(String firstName, String lastName, String domainname){
  return "${lastName.toLowerCase()}.${firstName.toLowerCase()}@$domainname";
}

String createUsername(String firstName, String lastName){
  return "${lastName.toLowerCase()}_${firstName.toLowerCase()}";
}

String createAvatarLink(String firstName, String lastName){
  return "https://eu.ui-avatars.com/api/?name=$firstName+$lastName&background=2f855a&color=fff";
}