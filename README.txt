-----------------------------------------------------------------------------------------

FRETShrink

coded in MATLAB R2009b

Nick Taylor
Landes Research Group
Rice University
Department of Chemistry

January 2011

for details on the various methods and their implementation, see:
Taylor, J.N., D.E. Makarov, and C.F. Landes. Biophys. J. 198:164-173.
Taylor, J.N. and C.F. Landes. J. Phys. Chem. B. ASAP on web. DOI: 10.1021/jp1050707

-----------------------------------------------------------------------------------------
Instructions for installation:

If you are using the MATLAB source, extract to any directory you like.  Before its first use, add the directory to the MATLAB path.  FRETShrink will add its directory to the path after its first launch.

If you are using a compiled .exe, it was compiled with the MATLAB Compiler. As such, you will need the MATLAB Compiler Runtime installed on your machine. If you do not have the MCR 
already installed on your machine, then it is recommended that you download the compiled
version that includes the MCR.

----------------------------------------------------------------------------------------
Instructions for use:

To run, simply install and type 'FRETShrink' at the MATLAB prompt.

Prepare files in ASCII format (.dat or .txt) with trajectories to be denoised
in each column.  There is no limit as to the number of columns in the file, nor
is there a limit as to the number of files you can select.

FRETShrink will denoise each column of each file separately, and will output an ASCII file 
in the same format as the input file.  For example, if a file named 'file.txt' is input. 
A file named 'file_den.txt' is output to the same directory. The columns of 'file_den.txt'
contain the denoised version of the same column of 'file.txt'.

The outputs in the GUI window are simply the results of the last 2 columns that were denoised.

-------------------------------------------------------------------------------------------
