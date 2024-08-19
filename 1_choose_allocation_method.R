#SELECT ALLOCATION METHOD

#This file is the first step in the running the analysis for replicating results from Cottrell et al 2024 - "TBC"

#Allocation methods are used throughout this project to estimate the raw material demand in different ingredients and their coproducts, and to assign environmental pressues to these products.

# Economic allocation (the default) assigns biomass and environmental pressures to feed ingredients based on their yields weighted by their price. 
# Energetic allocation assigns biomass and environmental pressures to feed ingredients based on their yields weighted by their gross energy content.
# Mass allocation assigns biomass and environmental pressures to feed ingredients based on their yields only.

#uncomment your preference for allocation method and comment out those not needed.


#this_allocation_method <- "econ_allocation"
this_allocation_method <- "ge_allocation"
#this_allocation_method <- "mass_allocation"
