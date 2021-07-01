# PlOS One Journal Submission

Authors:

 - I.R Bansal
 - S. Pequito

The folders contains resting-state dataset of one subject and 4 runs (used in this study). It is stored in rfMRI_ip.mat file.

Execute the **.m** files in the following order:
```
first run main_filter.m file
next, run evaluation_measures.m file (for performing eigen brain analysis on the output data, change rfMRI_ip to fmri_Op in the eigen brain analysis part)
To plot the vectors on brain overlay, run brain_overlay.m file
```

For additional analysis such as spatial correlation run glm.m file for both the input and output clusters separately.

The file dummy_signals.mat contains one of the synthetic signal used in the study. In the file, x is the clean signal and white_noise_dummy is the generated noise with varaince 100.  white_noise_dummy2 is the vector of noise with variance 10.

For testing the proposed ARFIMA method on other synthetic signals, run generate_dummy.m 
to generate random synthetic signal and observe the effect of ARFIMA filter. 



