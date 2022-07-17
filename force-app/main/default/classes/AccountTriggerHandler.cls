/*********************************************************************************************************
 * @name			AccountTriggerHandler
 * @description		AccountTriggerHandler class is used to create dynamic Account Relationship records.
**********************************************************************************************************/
public without sharing class AccountTriggerHandler {
    

    // /**
    //  * @Description: fetches & create account relationship records for given Account 
    //  * @param : Account account: standard account object
    //  * @param : Id previousParentId : Old Parent Id of current account.
    //  * @return void
    //  */
    // public static void getAllAccountsHeirarchy(Account account, Id previousParentId){

    //     system.debug('accountId ### '+ account.Id);
    //     system.debug('parentID ### '+ account.ParentId);
    //     system.debug('ownerId ### '+ account.OwnerId);
    //     system.debug('isPartnerAcc ### '+ account.IsPartner);

    //     if(account.IsPartner){
            
    //         //Boolean isSharingDisabled = isAccRecSharingNotAllowed(account.Id);

    //     	//if(!isSharingDisabled){
        	
    //         Set<ID> accountIdsSet = new Set<ID>();
    //         Set<ID> accountIdsNotMapped = new Set<ID>();
            
    //         accountIdsSet.add(account.Id);
    //         if(account.ParentId != Null){
    //             accountIdsSet.add(account.ParentId);
    //         }
            
    //         system.debug('Step 1 : set ### '+ accountIdsSet);

    //         getAccountsRecursive(accountIdsSet);

    //         if(accountIdsSet != null && accountIdsSet.size() > 0){
                
    //             if(account.ParentId != previousParentId && !accountIdsSet.contains(previousParentId)){
    //                 deleteOldAccountRelationship(account.Id);;
    //         	}
                
    //             accountIdsNotMapped = getAccountRelationshipRecords(accountIdsSet);
    //             createAccountRelationshipRecords(accountIdsSet, accountIdsNotMapped, account.OwnerId);
    //         }
    //     //}
    //     }
        
    // }

    // /**
    //  * @description : fetches Account present in same hierarchy for given Set of acc Id.
    //  * @param : Set<Id> accountIdsSet : collection of account Id
    //  * @return void
    //  */
    // public static void getAccountsRecursive(Set<Id> accountIdsSet){
    //     System.debug('Inside getAccountsRecursive###');

    //     Boolean isAllAccRetrieved = true;
    //     List<Account> accList = [Select ID, ParentID, Name From Account Where IsPartner=true AND (ID IN :accountIdsSet OR ParentID IN :accountIdsSet)];

    //     for(Account a : accList){
    //         if(!accountIdsSet.contains(a.ID) || ( !accountIdsSet.contains(a.parentID) && a.parentID != null)){
    //             if(a.parentID != null){
    //                 accountIdsSet.add(a.parentID);                    
    //             }

    //             accountIdsSet.add(a.id); 
    //             isAllAccRetrieved = false;
    //         }
    //     }

    //     if(!isAllAccRetrieved){
    //         getAccountsRecursive(accountIdsSet);
    //     }
    // }

    // /**
    //  * @Description: fetches existing Account Relationship records associated with given Set of acc Id.
    //  * @param : Set<Id> accountIdsSet : collection of account Id
    //  * @return void
    //  */
    // public static Set<Id> getAccountRelationshipRecords(Set<Id> accountIdsSet){
    //    Set<Id> accountIdsNotMapped = new Set<Id>();
    //    Set<Id> existingAccs = new Set<Id>();
    //    List<AccountRelationship> accountRelationshipList =  [ select Id,AccountFromId,AccountToId from AccountRelationship where AccountFromId IN :accountIdsSet];

    //    for(AccountRelationship accountRelationship : accountRelationshipList){
    //         existingAccs.add(accountRelationship.AccountFromId);
    //    }

    //    for(Id accountId : accountIdsSet){
    //        if(!existingAccs.contains(accountId)){
    //             accountIdsNotMapped.add(accountId);
    //        }        
    //    }
    //    return accountIdsNotMapped;
    // }
    
    // /**
    //  * @Description: creates dynamic Account Relationship records associated with given Set of acc Id.
    //  * @param : Set<Id> accountIdsSet : collection of account Id
    //  * @param : Set<Id> accountIdsNotMapped : collection of account Id whose relationship records are not created. 
    //  * @param : Id ownerId : account owner Id
    //  * @return void
    //  */
    // public static void createAccountRelationshipRecords(Set<Id> accountIdsSet, Set<Id> accountIdsNotMapped, Id ownerId){
    //     System.debug('Inside createAccountRelationshipRecords###');
    //     List<AccountRelationship> accountRelationshipList = new List<AccountRelationship>();

    //     try{
	// 			if(accountIdsNotMapped != null && accountIdsNotMapped.size()>0){
    //                 Boolean isAccRelationshipNotCreated = accountIdsNotMapped.containsAll(accountIdsSet);
                    
    //                 if(isAccRelationshipNotCreated){
    //                     List<Id> accountIdList = new List<Id>(accountIdsSet);
    //                     System.debug('accountIdList  ## '+accountIdList);
    //                     System.debug('accountIdList  size## '+accountIdList.size());
                        
    //                     for(Integer i=0;i<accountIdList.size();i++){
    //                         for(Integer j=0;j<accountIdList.size();j++){
    //                             AccountRelationship accountRelationship = new AccountRelationship();
    //                             //define variables for this static fields in ConstantUtil Class 
    //                             accountRelationship.Name='Sharing All Account Records'; 
    //                             accountRelationship.Type='System Integrator';
    //                             accountRelationship.AccountFromId=accountIdList[i];
    //                             accountRelationship.AccountToId=accountIdList[j];
    //                             accountRelationship.OwnerId=ownerId;
                
    //                             accountRelationshipList.add(accountRelationship);
    //                         }
    //                     }
    //                 } else {
    //                     for(Id accountIdNotMapped : accountIdsNotMapped){
    //                         for(Id accountIdMapped : accountIdsSet){
    
    //                             if(accountIdMapped == accountIdNotMapped){
    //                                 AccountRelationship accountRelationshipSelf = new AccountRelationship();
    //                                 accountRelationshipSelf.Name='Sharing All Account Records'; 
    //                                 accountRelationshipSelf.Type='System Integrator';
    //                                 accountRelationshipSelf.AccountFromId=accountIdNotMapped;
    //                                 accountRelationshipSelf.AccountToId=accountIdNotMapped;
    //                                 accountRelationshipSelf.OwnerId=ownerId;
    
    //                                 accountRelationshipList.add(accountRelationshipSelf);
    //                             } else {
    //                                 AccountRelationship accountRelationshipFrom = new AccountRelationship();
    //                                 AccountRelationship accountRelationshipTo = new AccountRelationship();
                
    //                                 //define variables for this static fields in ConstantUtil Class 
    //                                 accountRelationshipFrom.Name='Sharing All Account Records'; 
    //                                 accountRelationshipFrom.Type='System Integrator';
    //                                 accountRelationshipFrom.AccountFromId=accountIdNotMapped;
    //                                 accountRelationshipFrom.AccountToId=accountIdMapped;
    //                                 accountRelationshipFrom.OwnerId=ownerId;
                    
    //                                 //define variables for this static fields in ConstantUtil Class 
    //                                 accountRelationshipTo.Name='Sharing All Account Records'; 
    //                                 accountRelationshipTo.Type='System Integrator';
    //                                 accountRelationshipTo.AccountFromId=accountIdMapped;
    //                                 accountRelationshipTo.AccountToId=accountIdNotMapped;
    //                                 accountRelationshipTo.OwnerId=ownerId;
    
    //                                 accountRelationshipList.add(accountRelationshipFrom);
    //                                 accountRelationshipList.add(accountRelationshipTo);
    //                             }
    //                         }
    //                     }
    //                 }
    //             }
            
            
    //         System.debug('accountIdsSet  ## '+accountIdsSet);
    //         System.debug('accountIdsNotMapped Id  ## '+accountIdsNotMapped);
    //         System.debug('Account Relationship Size  ## '+accountRelationshipList.size());
    //         insert accountRelationshipList;
    //     }catch(Exception e){
    //         system.debug('Error occurred in createAccountRelationshipRecords : '+e.getMessage());
    //     }
    // }

    
    // //will be used based on requirement still incomplete
    // public static boolean isAccRecSharingNotAllowed(Id accountId){
    //     Boolean isAccRecSharingDisabled = false;
    //     return isAccRecSharingDisabled;
    // }
    
    // /**
    //  * @Description: deletes Account Relationship records associated with given account Id.
    //  * @param : Id accountId : account Id
    //  * @return void
    //  */
    // public static void deleteOldAccountRelationship(Id accountId){
    // 	List<AccountRelationship> accountRelationshipList = new List<AccountRelationship>();
        
    //     accountRelationshipList = [select Id from AccountRelationship where AccountFromId=:accountId OR AccountToId=:accountId];
            
    //     delete accountRelationshipList;    
    // }

    public static void displayGreetingMessage(){
        System.debug('Good Morning from displayGreetingMessage method');
        System.debug('made changes from dev branch added from master');
        System.debug('Jenkins Build Blank Component');
    }
}
