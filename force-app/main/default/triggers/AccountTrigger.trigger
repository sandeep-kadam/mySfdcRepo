/*********************************************************************************************************
 * @name			AccountTrigger
 * @description		AccountTrigger is used to create dynamic Account Relationship 
 *                  records for partner accounts.
**********************************************************************************************************/
trigger AccountTrigger on Account (after update) {

    if(Trigger.isUpdate &&  Trigger.isAfter){
        AccountTriggerHandler.getAllAccountsHeirarchy(Trigger.New[0],Trigger.OldMap.get(Trigger.New[0].Id).ParentId);
    }
}