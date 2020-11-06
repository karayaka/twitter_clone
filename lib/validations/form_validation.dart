class FormValidation{
  static String UserNameValidation(String val){
    if(val.length==0){
      return "Kullanıcı Adı Boş Geçilemez!";
    }
    if(val.length<3){
      return "Kullanıcı Adı 3 Harften Küçük Olamaz";
    }
    return null;
  }
  static String NameValidation(String val){
    if(val.length==0){
      return "İsim Boş Geçilemez!";
    }
    if(val.length<3){
      return "İsim 3 Harften Küçük Olamaz";
    }
    return null;
  }
  static String SurnameValidation(String val){
    if(val.length==0){
      return "Soy İsim Boş Geçilemez!";
    }
    if(val.length<3){
      return "Soy İsim 3 Harften Küçük Olamaz";
    }
    return null;
  }
  static String PassworValidation(String val){
    if(val.length==0){
      return "Şifre Boş Geçilemez!";
    }
    if(val.length<6){
      return "Şifre 5 Harften Küçük Olamaz";
    }
    return null;
  }
  static String EmailValidation(String val){
    if(val.length==0){
      return "Email Boş Geçilemez!";
    }
    if(val.length<6){
      return "Email 5 Harften Küçük Olamaz";
    }
    if(!(val.contains("@")&&val.contains(".com"))){
      return "Lütfen Geçerli Bir Email Girin";
    }
    return null;
  }
  static String PostTitleValidation(String val){
    if(val.length==0){
      return "Post Başlığı Boş Geçilemez!";
    }
    if(val.length>20){
      return "İsim 20 Harften Büyük Olamaz!";
    }
    return null;
  }
  static String PostContetntValidation(String val){
    if(val.length==0){
      return "Post İçreiği Boş Geçilemez!";
    }
    if(val.length>300){
      return "İsim 300 Harften Büyük Olamaz";
    }
    return null;
  }
}