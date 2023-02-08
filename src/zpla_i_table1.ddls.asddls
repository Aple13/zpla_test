@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface CDS for Table 1'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zpla_i_table1
  as select from zpla_atable1
{
  key field_1  as KeyField1,
      field_01 as Field01,
      field_02 as Field02,
      field_03 as Field03,
      field_04 as Field04,
      field_05 as Field05
}
