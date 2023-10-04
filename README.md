# ethoscopeCodes_eLife
Custom scripts to compute sleep from raw ethoscope data.

There are three files in this repository. The first script, the Yoked_notebook_LD_10sec_bins_NEW.Rmd file is required to convert raw ethoscope files to RDS files for downstream processing. The second script (CreateSleepDataFilesFromRawEthoscopeOutput.R) is code to compute sleep profiles for flies exposed to different treatments from the output of the .Rmd files. The third file (newSleepDataEtho.R) is a function for computing sleep which is used in the second script.

Once sleep files are generated. The downstream analyses are performed as previously reported.
