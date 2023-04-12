
class StringUtils {

  static String checkNull({required String possibleNull}){
    return possibleNull.toString() == 'null' ? '' : possibleNull;
  }
}