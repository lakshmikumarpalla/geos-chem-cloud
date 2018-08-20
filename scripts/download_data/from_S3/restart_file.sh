#!/bin/bash

aws s3 cp --request-payer=requester --recursive \
s3://gcgrid/SPC_RESTARTS/ ./SPC_RESTARTS  \
--exclude "*" \
--include "initial_GEOSChem_rst.4x5_benchmark.nc" \
--include "initial_GEOSChem_rst.4x5_standard.nc"