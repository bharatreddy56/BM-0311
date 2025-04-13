output_df.loc[merged_hosp['Account_Hosp_Id'].notna(), 'Match'] = merged_hosp.loc[merged_hosp['Account_Hosp_Id'].notna(), 'Id_y'].reindex(output_df.index[merged_hosp['Account_Hosp_Id'].notna()]).values

output_df.loc[merged_mco['Account_Mco__Id'].notna(), 'Match'] = merged_mco.loc[merged_mco['Account_Mco__Id'].notna(), 'Id_y'].reindex(output_df.index[merged_mco['Account_Mco__Id'].notna()]).values
