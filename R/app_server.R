#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  observeEvent(input$dobeep, {
    print(getwd())
    print(dir("inst/app/www"))
    insertUI(selector = "#dobeep",
      # session = session,
      where = "afterEnd",
      # beep.wav should be in /www of the shiny app
      ui = tags$audio(src = "microwave_ping_mono.wav", type = "audio/wav",
        # style="display:none;",
        autoplay = TRUE, controls = NA)
    )
  })
  mod_beep_page_server("beep_page_1")
}
