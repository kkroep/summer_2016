#!/bin/bash
echo "Copying GaN files from wsl_labVIEW to labVIEW/scratch"
rm GaN*
cp /mnt/c/Users/kkroe/Documents/wsl_labVIEW/GaN_* ~/git/summer_2016/labVIEW/scratch

#echo "executing plot_slope.m"
octave-cli plot_slope.m


# echo "Copying reset files from wsl_labVIEW to labVIEW/scratch"
# rm reset*
# cp /mnt/c/Users/kkroe/Documents/wsl_labVIEW/reset_* ~/git/summer_2016/labVIEW/scratch

#echo "executing plot_reset.m"
# octave-cli plot_reset.m

