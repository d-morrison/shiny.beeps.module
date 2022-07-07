#' beep_page UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_beep_page_ui <- function(id){
  ns <- NS(id)
  tagList(
    # tags$head(tags$script(src = "message-handler.js")),
    actionButton("dobeep" |> ns(), "Play sound")

  )
}

#' beep_page Server Functions
#'
#' @noRd
mod_beep_page_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    observeEvent(input$dobeep, {
      message("clicked dobeep")
      message(paste0("#", ns("dobeep")))
      insertUI(
        session = session,
        immediate = TRUE,
        selector = paste0("#", ns("dobeep")),
        where = "afterEnd",
        # beep.wav should be in /www of the shiny app
        ui = tags$audio(src = "microwave_ping_mono.wav", type = "audio/wav",

          controls = NA,
          # style="display:none;",
          autoplay = T
          )
      )
    })
  })
}

## To be copied in the UI
# mod_beep_page_ui("beep_page_1")

## To be copied in the server
# mod_beep_page_server("beep_page_1")
