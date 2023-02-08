@EndUserText.label: 'Consumption CDS for Child2'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define view entity zpla_c_child2
  as projection on zpla_i_child2
{
  key Child2Uuid,
      RootUuid,
      Field1,
      Field2,
      Field3,
      Field4,
      Field5,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      /* Associations */
      _Root : redirected to parent zpla_c_root
}
