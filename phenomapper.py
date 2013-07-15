#!/usr/bin/env python

import sys
import subprocess
import os
# input comes from STDIN (standard input)

for line in sys.stdin:
    # remove leading and trailing whitespace
    line = line.strip()
    # split the line into words
    _,line=line.split("\t")
    par1, par2 = line.split(";",1)
    par1, par2 = int(par1),int(par2)
  #  os.system("/home/user/bashignorante")
  #  print "Python:" + os.getcwd()
    print "starting pheno"
  #  os.mkdir("afasgasd")
  #  os.system("chmod -R 777 .")
    subprocess.call("/home/userhadoop/phenoripper/bin/./run_PhenoRipper.sh"+" /usr/local/MATLAB/MATLAB_Compiler_Runtime/v81"+" /home/userhadoop/phenoripper/Sample_Images/Sample_FileList.csv"+" /home/userhadoop/phenoripper/Sample_Images/marker_scales.csv "+str(par1)+" 50"+" 30 "+str(par2)+" /home/userhadoop/output.txt "+"1234",shell=True)
   # os.system("/home/user/Course/bin/./run_PhenoRipper.sh /usr/local/MATLAB/MATLAB_Compiler_Runtime/v81/ /home/user/Course/Sample_Images/Sample_FileList.csv /home/user/Course/Sample_Images/marker_scales.csv %s 50 30 %s ./output.txt 1234" % (par1,par2))
    print "pheno over"
    with open("/home/userhadoop/output.txt","r+") as f:
        output = os.getcwd()
        output2 = f.read()

#print output
print output2
