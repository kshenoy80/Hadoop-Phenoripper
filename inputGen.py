#!/usr/bin/env python

par1min=int(raw_input("Par1min: "))
par1max=int(raw_input("Par1max: "))
par2min=int(raw_input("Par2min: "))
par2max=int(raw_input("Par2max: "))

with open("output.txt", "w") as f:
    for i in xrange(par1min,par1max+1):
        for j in xrange(par2min,par2max+1):
            f.write("%s;%s\n" % (i,j))




