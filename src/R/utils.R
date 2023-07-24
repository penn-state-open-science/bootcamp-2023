update_registration_data <- function(this_dir = "src") {
  require('ggplot2')
  require('dplyr')
  require('tidyr')
  require('stringr')
  require('lubridate')
  options(gargle_oauth_email = "rick.o.gilmore@gmail.com")
  googledrive::drive_auth()
  
  csv_fn <- file.path(this_dir, "csv", "registrations-2023-07.csv")
  googledrive::drive_download("Open Science Bootcamp 2023: Registration (Responses)", 
                              path = csv_fn, type = "csv", overwrite = TRUE)
  
  csv_fn <- file.path(this_dir, "csv", "registrations-2023-07.csv")
  registrations <-
    readr::read_csv(csv_fn, show_col_types = FALSE)
  
  reqistrations_qs <- names(registrations)
  
  registrations_clean <- registrations |>
    dplyr::rename(
      timestamp = "Timestamp",
      confirmed = "Will you attend the Bootcamp on August 9-11, 2023?",
      name = "What is your name?",
      psu_email = "What is your PSU email?",
      dept= "What is your department or unit?",
      position = "What is your current position?",
      email = "Email Address",
      am_sess_1 = "Which of these sessions do you plan to attend?...8",
      am_sess_2 = "Which of these sessions do you plan to attend?...9",
      pm_sess_3 = "Which of these sessions do you plan to attend?...10",
      pm_sess_4 = "Which of these sessions do you plan to attend?...11",
      comments = "Any comments?"
    )
  
  registrations_clean <- registrations_clean |>
    dplyr::mutate(timestamp = lubridate::mdy_hms(timestamp, tz = "America/New_York")) |>
    dplyr::arrange(timestamp) |>
    dplyr::select(-psu_email)
  
  registrations_clean
}

render_open <- function(this_dir = "src") {
  bookdown::render_book(this_dir)
  utils::browseURL("docs/index.html")
}