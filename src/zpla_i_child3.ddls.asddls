@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface CDS for Child 3'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zpla_i_child3
  as select from zpla_achild3
  
  association to parent zpla_i_root as _Root on $projection.RootUuid = _Root.RootUuid
  
{
  key child3_uuid           as Child3Uuid,
      root_uuid             as RootUuid,
      field_1               as Field1,
      field_2               as Field2,
      field_3               as Field3,
      field_4               as Field4,
      field_5               as Field5,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.createdBy: true
      last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.createdAt: true
      last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      
      _Root
}
