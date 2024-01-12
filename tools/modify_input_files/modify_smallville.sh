#!/bin/bash

# Script that prepares landuse files for smallvilleIA.
# Load the nco module and run the script in the ctsm_pylib environment:
module load nco
module load conda
conda activate ctsm_pylib

# Subset a global landuse file with 78 pfts, i.e. with crops
../site_and_regional/subset_data point --lat 40.6878 --lon 267.0228 --site 1x1_smallvilleIA --create-surface --create-landuse --crop

# Trim the file to just the years 1850-1855
ncks -d time,0,5 subset_data_single_point/landuse.timeseries_1x1_smallvilleIA_hist_78_CMIP6_1850-2015_c240103.nc subset_data_single_point/landuse.timeseries_1x1_smallvilleIA_hist_78_CMIP6_1850-1855_c240103.nc

# Replace all values in the LAKE and CROP variables
ncap2 -s "PCT_LAKE=array(0.,0.,PCT_CROP); PCT_LAKE={0.,50.,25.,25.,25.,25.} ; PCT_LAKE_MAX=array(50.,50.,PCT_CROP_MAX); PCT_CROP=array(0.,0.,PCT_LAKE); PCT_CROP={0.,25.,12.,12.,12.,12.}; PCT_CROP_MAX=array(25.,25.,PCT_LAKE_MAX)" subset_data_single_point/landuse.timeseries_1x1_smallvilleIA_hist_78_CMIP6_1850-1855_c240103.nc subset_data_single_point/landuse.timeseries_1x1_smallvilleIA_hist_78pfts_1850-1855_dynLakes_c240103.nc

# Replace all values in the URBAN and CROP variables
ncap2 -s "PCT_URBAN=array(0.,0.,PCT_URBAN); PCT_URBAN={0.,0.,0.,20.,15.,0.,10.,8.,0.,10.,8.,0.,10.,8.,0.,10.,8.,0.} ; PCT_URBAN_MAX=array(0.,0.,PCT_URBAN_MAX); PCT_URBAN_MAX={20.,15.,0.}; PCT_CROP=array(0.,0.,PCT_LAKE); PCT_CROP={0.,25.,12.,12.,12.,12.}; PCT_CROP_MAX=array(25.,25.,PCT_LAKE_MAX)" subset_data_single_point/landuse.timeseries_1x1_smallvilleIA_hist_78_CMIP6_1850-1855_c240103.nc subset_data_single_point/landuse.timeseries_1x1_smallvilleIA_hist_78pfts_1850-1855_dynUrban_c240103.nc

# Update values in the pft, cft, harvest, and grazing variables as posted here:
# https://github.com/ESCOMP/CTSM/issues/1673#issuecomment-1879156989
ncap2 -s "PCT_NAT_PFT=array(0.,0.,PCT_NAT_PFT); PCT_NAT_PFT={0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,100.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,100.,0.,100.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,100.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,50.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,50.,0.,25.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,75.,0.} ; PCT_NAT_PFT_MAX=array(0.,0.,PCT_NAT_PFT_MAX); PCT_NAT_PFT_MAX={100.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,100.,0.}; PCT_CFT=array(0.,0.,PCT_CFT); PCT_CFT={100.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,100.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,1.,1.,1.,1.,1.,1.,1.,1.,1.,91.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,91.,1.,1.,1.,1.,1.,1.,1.,1.,1.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,2.,4.,4.,6.,6.,8.,8.,10.,10.,42.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,4.,4.,4.,4.,4.,4.,4.,4.,4.,64.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.}; PCT_CFT_MAX=array(0.,0.,PCT_CFT_MAX); PCT_CFT_MAX={100.,2.,2.,3.,3.,4.,4.,5.,5.,91.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.}; PCT_CROP=array(0.,0.,PCT_CROP); PCT_CROP={0.,0.,100.,100.,50.,25.}; PCT_CROP_MAX=array(100.,100.,PCT_CROP_MAX); HARVEST_SH1=array(0.,0.,HARVEST_SH1); HARVEST_SH1={0.,0.,0.,0.,0.,0.}; HARVEST_SH2=array(0.,0.,HARVEST_SH2); HARVEST_SH2={0.,0.,0.,0.,0.,0.}; HARVEST_SH3=array(0.,0.,HARVEST_SH3); HARVEST_SH3={0.,0.,0.,0.,0.,0.}; HARVEST_VH1=array(0.,0.,HARVEST_VH1); HARVEST_VH1={0.,0.,0.,0.,0.,0.}; HARVEST_VH2=array(0.,0.,HARVEST_VH2); HARVEST_VH2={0.,0.,0.,0.,0.,0.}; GRAZING=array(0.,0.,GRAZING); GRAZING={0.,0.,0.,0.,0.,0.}" subset_data_single_point/landuse.timeseries_1x1_smallvilleIA_hist_78_CMIP6_1850-1855_c240103.nc subset_data_single_point/landuse.timeseries_1x1_smallvilleIA_hist_78pfts_1850-1855_dynPft_c240103.nc

exit
