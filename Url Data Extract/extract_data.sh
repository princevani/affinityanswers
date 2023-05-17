# -------- Shebang Statement -------- 
#! bin/bash

# -------- Defining paramete/data source path -------- 
url='https://www.amfiindia.com/spages/NAVAll.txt'
output_file='scheme_data.csv'

# Extract Scheme Name and Asset Value fields using cut
curl -s ${url} | cut -d ";" -f 4,5 --output-delimiter=',' >  ${output_file}

echo "Extraction completed. The data is saved in '${output_file}'."
