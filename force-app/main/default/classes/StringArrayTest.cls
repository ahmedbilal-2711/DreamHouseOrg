public class StringArrayTest {
    public static List<String> generateStringArray(Integer a){
        List <String> retStr = new List <String>();
        for(Integer n=0;n<a;n++){
            retStr.add('Test '+n);
        }
        return retStr;
    }
}