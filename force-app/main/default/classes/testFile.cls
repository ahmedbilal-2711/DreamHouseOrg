public with sharing class testFile {
    public testFile() {

    }
    public static void doAfterInsert(List<ContentVersion> cvList) {
    if(!cvList.IsEmpty()){
        List<ContentDistribution> cdListToInsert = new List<ContentDistribution>();
        for(ContentVersion cv : cvList){
            cdListToInsert.add(new ContentDistribution(
                ContentVersionId = cv.Id,
                Name = cv.Title,
                PreferencesAllowViewInBrowser= true
            ));
        }
        if(!cdListToInsert.IsEmpty())INSERT cdListToInsert;
        List<ContentDistribution> listOfContent = new List<ContentDistribution>();
        listOfContent = [SELECT DistributionPublicUrl FROM ContentDistribution];
        System.debug(listOfContent); //your ContentDistribution which will have public & download URL for the file.
    }
}
}