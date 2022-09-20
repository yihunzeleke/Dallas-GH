library(tidyverse)

# Dallas County Police incident open data web URL for csv file format

webUrl <- "https://www.dallasopendata.com/api/views/qv6i-rri7/rows.csv?accessType=DOWNLOAD"

# download csv file from the URL

police_incident_raw <- readr::read_csv(webUrl)

#  clean the column names
police_incident_raw <- police_incident_raw %>% 
  janitor::clean_names()

sub_cols <- c("year_of_incident", "watch", "type_of_incident", "type_location","type_of_property", "incident_address",
              "reporting_area", "beat", "division", "council_district","date1_of_occurrence", "year1_of_occurrence","month1_of_occurence",
              "month1_of_occurence","day1_of_the_week","time1_of_occurrence","day1_of_the_year", "date2_of_occurrence","year2_of_occurrence","month2_of_occurence",                      
              "day2_of_the_week", "time2_of_occurrence","day2_of_the_year","date_of_report","date_incident_created","offense_entered_year",                     
              "offense_entered_month","offense_entered_day_of_the_week", "offense_entered_time","offense_entered_date_time",                
              "call_received_date_time","call_date_time","call_cleared_date_time","call_dispatch_date_time",                  
              "person_involvement_type","victim_type","victim_race","victim_ethnicity","victim_gender","element_number_assigned",                  
              "investigating_unit_1","investigating_unit_2","offense_status","ucr_disposition","modus_operandi_mo","family_offense",                           
              "hate_crime","hate_crime_description","weapon_used","gang_related_offense","drug_related_istevencident",                                 
              "criminal_justice_information_service_code","penal_code", "ucr_offense_name","ucr_offense_description", "ucr_code",                                 
              "offense_type", "nibrs_crime","nibrs_crime_category", "nibrs_crime_against","nibrs_code", "nibrs_group","nibrs_type",                               
              "update_date","x_coordinate","y_cordinate","zip_code","city","state","location1")

police_incident_clean <- police_incident_raw %>% 
  slice(1:1000) %>%
  select(contains(sub_cols))

readr::write_csv(police_incident_clean,paste0("data/", Sys.Date(), "-police_incident", ".csv"))
