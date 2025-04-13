    # 1. Check Account_Hosp_Id_r vs Account_Hosp_Id
    merged_hosp = pd.merge(df_sheet1, df_sheet2, left_on='Account_Hosp_Id_r', right_on='Account_Hosp_Id', how='left', indicator=True)
    
    # Create a boolean mask for matched rows based on the merge result
    matched_hosp_mask = merged_hosp['_merge'] == 'both'
    
    # Assign the matched values to output_df using the original index
    output_df.loc[merged_hosp[matched_hosp_mask].index, 'Match'] = merged_hosp.loc[merged_hosp[matched_hosp_mask].index, 'Id_y'].values

    # 2. Check Account_Mco__Id_r vs Account_Mco__Id for unmatched rows
    unmatched_idx = output_df['Match'].isna()
    merged_mco = pd.merge(df_sheet1[unmatched_idx], df_sheet2, left_on='Account_Mco__Id_r', right_on='Account_Mco__Id', how='left', indicator=True)
    
    # Create a boolean mask for matched rows based on the merge result
    matched_mco_mask = merged_mco['_merge'] == 'both'
    
    # Assign the matched values to output_df using the original index
    output_df.loc[merged_mco[matched_mco_mask].index, 'Match'] = merged_mco.loc[merged_mco[matched_mco_mask].index, 'Id_y'].values
pip install pandas rapidfuzz python-Levenshtein
