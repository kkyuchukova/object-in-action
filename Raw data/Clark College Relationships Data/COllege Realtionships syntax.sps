USE ALL.
COMPUTE filter_$=(dyadID~=30 & dyadID~=6).
VARIABLE LABELS filter_$ 'dyadID~=12 & dyadID~=13 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

COMPUTE external = mean(otherint_1, otherint_5, otherint_2, otherint_10).
COMPUTE internal = mean(otherint_3, otherint_7, otherint_11,otherint_12).
COMPUTE odiffthoughts = external - internal. 
EXECUTE.

Pairwise  dyadid =dyadID  i1 = 'A'  i2='P' directory='C:\Users\RaGarcia\Desktop'.

CORRELATIONS
  /VARIABLES=howbody_1_A howbody_2_A howbody_3_A odiffthoughts_P
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

COMPUTE howbody_A = mean(howbody_1_A, howbody_2_A, howbody_3_A).
EXECUTE.


CORRELATIONS
  /VARIABLES=howbody_3_A odiffthoughts_P
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.








