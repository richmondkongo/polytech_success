library(shiny)
library(shinydashboard)
library(plyr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)
library(DT)
library(lubridate)
library(readxl)

shinyjs::useShinyjs()

path = "D:/S2/projet_tutore/notebook/"
df_candidat = read_excel(paste(path, "df2017.xlsx", sep=""), sheet = "candidat")
df_note = read_excel(paste(path, "df2017.xlsx", sep=""), sheet = "note")
df_choix = read_excel(paste(path, "df2017.xlsx", sep=""), sheet = "choix")
df_test = read_excel(paste(path, "df2017.xlsx", sep=""), sheet = "test")




df = merge(df_candidat, df_choix, by=c("identifiantCandidat", "annee"), all.x = TRUE, all.y = FALSE)
df = merge(df, df_note, by=c("identifiantCandidat", "annee"), all.x = TRUE, all.y = FALSE)
#df = merge(df, df_test, by=c("identifiantCandidat", "annee"), all.x = TRUE, all.y = FALSE)


fieldsMandatory <- c("rangEnTerminale", "codeFiliere_1", "codeFiliere_2", "codeFiliere_6", "1ERE_ANGLAIS", "1ERE_MATHEMATIQUES" , "1ERE_SCIENCES PHYSIQUES", "2NDE_MATHEMATIQUES", "2NDE_SCIENCES PHYSIQUES", "BAC_ANGLAIS", "BAC_FRANCAIS", "BAC_MATHEMATIQUES", "BAC_SCIENCES PHYSIQUES" , "BAC_SVT", "TLE_ANGLAIS", "TLE_FRANCAIS", "TLE_MATHEMATIQUES", "TLE_SCIENCES PHYSIQUES")
labelMandatory <- function(label) {
    tagList(
        label,
        span("*", class = "mandatory_star")
    )
}

appCSS <-"
    .mandatory_star { color: red; } 
    #error { color: red; }
"

fieldsAll <- c("redoublementTerminale", "rangEnTerminale", "codeFiliere_1", "codeFiliere_2", "codeFiliere_6", "1ERE_ANGLAIS", "1ERE_MATHEMATIQUES" , "1ERE_SCIENCES PHYSIQUES", "2NDE_MATHEMATIQUES", "2NDE_SCIENCES PHYSIQUES", "BAC_ANGLAIS", "BAC_FRANCAIS", "BAC_MATHEMATIQUES", "BAC_SCIENCES PHYSIQUES" , "BAC_SVT", "TLE_ANGLAIS", "TLE_FRANCAIS", "TLE_MATHEMATIQUES", "TLE_SCIENCES PHYSIQUES")
responsesDir <- file.path("responses")
epochTime <- function() {
    as.integer(Sys.time())
}

skin <- Sys.getenv("DASHBOARD_SKIN")
skin <- tolower(skin)

if (skin == "")
    skin <- "blue"

sidebar <- dashboardSidebar(
    tags$aside(
        tags$style(HTML("
            .irs-grid-text { color: white !important }
        "))
    ),
    
    #sidebarSearchForm(label = "Search...", "searchText", "searchButton"),
    
    sidebarMenu(
        menuItem("VUE GLOBALE", tabName = "vue", icon=icon("chart-line", lib = "font-awesome")),
        menuItem("PREVISION", tabName = "prev", icon = icon("bullseye")),
        #menuItem("Données", icon = icon("database"), href = "https://www.recenter.tamu.edu/"),
        #menuItem("Liste des icônes", icon = icon("font-awesome"), href = "http://fontawesome.io/icons/"),
        
        hr(),
        checkboxGroupInput(
            "annee_checkbox",
            "Année:",
            choices = c("2017", "2018"),
            selected = c("2017", "2018"),
            inline = F
        ),
        
        checkboxGroupInput(
            "serie_checkbox",
            "Sériee:",
            choices = sort(unique(df$serie)),
            selected = c("D", "A2", "C", "A1"),
            inline = F
        ),
        
        checkboxGroupInput("Sexe_checkbox",
                           "sexe:",
                           choiceNames = c("Féminin", "Masculin"),
                           choiceValues = sort(unique(df$genre)),
                           selected = sort(unique(df$genre)),
                           inline = T
        ),
        
        checkboxGroupInput("mention_select",
                           "mention:",
                           choiceNames = sort(unique(df$mentionAuBac)),
                           choiceValues = sort(unique(df$mentionAuBac)),
                           selected = sort(unique(df$mentionAuBac)),
                           inline = F
        ),
        
        
        sliderInput("age_slider",
                    "Age:",
                    min = min(df$age, na.rm = T),
                    max = max(df$age, na.rm = T),
                    value = c(min(df$age, na.rm = T), max(df$age, na.rm = T)),
                    step = 1,
        ),
        
        checkboxGroupInput("admis_checkbox",
                           "Admis:",
                           choiceNames = c("NON", "OUI"),
                           selected = sort(unique(df$admis)),
                           choiceValues = sort(unique(df$admis)),
                           inline = T
        ),
        
        selectInput("etablissement_select",
                    "Etablissement:",
                    choices = sort(unique(df$etablissementOrigine)),
                    multiple = TRUE,
                    selectize = TRUE,
                    selected = sort(unique(df$etablissementOrigine))
                    #selected = c("LYCEE CLASSIQUE ABIDJAN")
        )
    )
)

header <- dashboardHeader(
    title = "Dashboard"
)


body <- dashboardBody(
    tags$body(
        tags$style(
            HTML(".sidebar { height: 120vh; overflow-y: auto; }")   
        )
    ),     
    
    fluidRow(
        valueBoxOutput("vbox1", width = 3),
        valueBoxOutput("vbox2", width = 3),
        valueBoxOutput("vbox3", width = 3),
        valueBoxOutput("vbox4", width = 3)
    ),     
    
    fluidRow(
        valueBoxOutput("vbox5", width = 3),
        valueBoxOutput("vbox6", width = 3),
        valueBoxOutput("vbox7", width = 3),
        valueBoxOutput("vbox8", width = 3)
    ),
    
    tabItems(
        tabItem(
            "vue",
            fluidRow(
                tabBox(
                    title = "KPI",
                    side = "left",
                    selected = "KPI SIMPLES",
                    id = "tabset1",
                    width = 12,
                    tabPanel(
                        "KPI SIMPLES",
                        fluidRow(
                            column(4, plotlyOutput("plot_eff_age")),
                            column(4, plotlyOutput("plot_eff_genre")),
                            column(4, plotlyOutput("plot_eff_redoublement")),
                            column(6, plotlyOutput("plot_eff_serie")),
                            #column(6, plotlyOutput("plot_eff_dren")),
                            column(6, plotlyOutput("plot_eff_nationalite")),
                        )
                    ),
                    tabPanel(
                        "KPI AVANCES", 
                        fluidRow(
                            column(4, plotlyOutput("plot_admis_genre")),
                            column(8, plotlyOutput("plot_filiere_choix")),
                            column(
                                12, 
                                div(sliderInput(
                                    "cls_slider",
                                    "Classement voulu:",
                                    min = 1,
                                    max = length(unique(df$DREN)),
                                    #value = c(1, length(unique(df$DREN))),
                                    value = c(1, 5),
                                    step = 1
                                ),
                                plotlyOutput("plot_classement_dren"))
                            ),
                            column(9, plotlyOutput("plot_admis_choix")),
                            column(3, tableOutput("tab_admis_choix")),
                            #column(6, tableOutput("plot_admis_redoublemnt")),
                            #column(6, tableOutput("plot_admis_mention"))
                        ),
                    )
                )
            ),
        ),
        tabItem(
            "prev",
            fluidRow(
                tabsetPanel(
                    tabPanel(
                        "Formulaire",
                        fluidPage(
                            shinyjs::useShinyjs(),
                            shinyjs::inlineCSS(appCSS),
                            titlePanel("FORMULAIRE DE TEST D'ADMISSIBILITE AU CONCOURS"),
                            
                            div(
                                id = "form",
                                fluidRow(
                                    fluidRow(
                                        column(3, textInput("rangEnTerminale", labelMandatory("Rang en terminale"),value = "1")),
                                        column(3, selectInput("codeFiliere_1", labelMandatory("Sélectionnez votre filière 1") , unique(df$codeFiliere_1))),
                                        column(3, selectInput("codeFiliere_2", "Sélectionnez votre filière 2", unique(df$codeFiliere_2))),
                                        column(3, selectInput("codeFiliere_6", labelMandatory("Sélectionnez votre filière 6"), unique(df$codeFiliere_6))),
                                    ),
                                    
                                    fluidRow(
                                        column(3, textInput("2NDE_MATHEMATIQUES", labelMandatory("Votre moyenne de mathématiques en seconde"),value = "1")),
                                        column(3, textInput("2NDE_SCIENCES PHYSIQUES", labelMandatory("Votre moyenne de sciences physiques en seconde"),value = "1")),
                                        column(3, textInput("1ERE_ANGLAIS", labelMandatory("Votre moyenne d'anglais en première"),value = "1")),
                                        column(3, textInput("1ERE_MATHEMATIQUES", labelMandatory("Votre moyenne de mathématiques en première"),value = "1")),
                                    ),
                                    
                                    fluidRow(
                                        column(3, textInput("1ERE_SCIENCES PHYSIQUES", labelMandatory("Votre moyenne de sciences physiques en première"),value = "1")),
                                        column(3, textInput("TLE_ANGLAIS", labelMandatory("Votre moyenne d'anglais en terminale"),value = "1")),
                                        column(3, textInput("TLE_FRANCAIS", labelMandatory("Votre moyenne de francais en terminale"),value = "1")),
                                        column(3, textInput("TLE_MATHEMATIQUES", labelMandatory("Votre moyenne de mathématiques en terminale"),value = "1")),
                                    ),
                                    
                                    fluidRow(
                                        column(3, textInput("TLE_SCIENCES PHYSIQUES", labelMandatory("Votre moyenne de sciences physiques en terminale"),value = "1")),
                                        column(3, textInput("BAC_ANGLAIS", labelMandatory("Votre moyenne d'anglais au BAC"),value = "1")),
                                        column(3, textInput("BAC_FRANCAIS", labelMandatory("Votre moyenne de francais au BAC"),value = "1")),
                                        column(3, textInput("BAC_MATHEMATIQUES", labelMandatory("Votre moyenne de au BAC"),value = "1")),
                                    ),
                                    
                                    fluidRow(
                                        column(3, textInput("BAC_SCIENCES PHYSIQUES", labelMandatory("Votre moyenne de sciences physiques au BAC"),value = "1")),
                                        column(3, textInput("BAC_SVT", labelMandatory("Votre moyenne de svt au BAC"),value = "1")),
                                        column(3, checkboxInput("redoublementTerminale", "Avez-vous redoublé en terminale ?", value=T)),
                                        column(3, actionButton("submit", "ENVOYER", class = "btn-primary"))
                                    )
                                    
                                    
                                )
                                #sliderInput("r_num_years", "Number of years using R", 0, 25, 2, ticks = FALSE),
                                
                                
                            ),
                            
                            shinyjs::hidden(
                                div(
                                    id = "thankyou_msg",
                                    h3("Thanks, your response was submitted successfully!"),
                                    valueBoxOutput("resultat_admissibilite", width = 3),
                                    actionLink("submit_another", "Faire un nouveau test")
                                )
                            ),
                            
                            shinyjs::hidden(
                                span(id = "submit_msg", "Envoie en cours..."),
                                div(id = "error",
                                    div(br(), tags$b("L'erreur suivante est survenue lors de l'envoi des données, réessayé s'il vous plait: "), span(id = "error_msg"))
                                )
                            )
                        )
                    ),
                    tabPanel("Summary", div(h6("Top empl"))),
                    tabPanel("table", DTOutput('tbl')),
                    type="tab"
                )
            ),
        )
    ),
)



ui <- dashboardPage(header, sidebar, body, skin = skin)

server <- function(input, output, session) {

    df_reactive <- reactive({
        df <- df %>% 
            filter(etablissementOrigine %in% input$etablissement_select) %>%
            filter(annee %in% input$annee_checkbox) %>%
            filter(genre %in% input$Sexe_checkbox) %>%
            filter(mentionAuBac %in% input$mention_select) %>%
            filter(age >= input$age_slider[1] & age <= input$age_slider[2]) %>%
            filter(admis %in% input$admis_checkbox) %>%
            filter(serie %in% input$serie_checkbox) 
        return(df)
    })
    
    observe({
        mandatoryFilled <-
            vapply(fieldsMandatory,
                   function(x) {
                       !is.null(input[[x]]) && input[[x]] != ""
                   },
                   logical(1))
        mandatoryFilled <- all(mandatoryFilled)
        
        shinyjs::toggleState(id = "submit", condition = mandatoryFilled)
    })
    
    formData <- reactive({
        data <- sapply(fieldsAll, function(x) input[[x]])
        data <- c(data, timestamp = epochTime())
        data <- t(data)
        data
    })
    
    
    humanTime <- function() format(Sys.time(), "%Y%m%d-%H%M%OS")
    
    saveData <- function(data) {
        fileName <- sprintf("%s_%s.csv",
                            humanTime(),
                            digest::digest(data))
        
        data = as.data.frame(data)
        data$redoublementTerminale = ifelse(data$redoublementTerminale == FALSE, "NON", "OUI")
        
        
        k = 1
        for (i in colnames(data)) {
            if (k > 5) {
                #data[is.na(data[, i]), i] = "0"
                data[, colnames(data%>%select(i))[1]] = as.double(unlist(data%>%select(i)))
            } else {
                #data[is.na(data[, i]), i] = "aucun"
                data[, colnames(data%>%select(i))[1]] = as.factor(unlist(data%>%select(i)))
            }
            k = k + 1
        }
        
        model = readRDS(file = "regression_logistique_succes_echec.rds")
        prev = predict(model, newdata=data , type="response")
        prev_prob <- data.frame(probabilte = round(prev, 5))
        prev_class = ifelse(prev_prob>=0.5, 1, 0)
        #prev_class <- apply(prev_prob>=0.5, 2, factor,labels=c(0 , 1))
        prev_class <- data.frame(prevision = prev_class)
        res = (cbind(prev_prob, prev_class))
        colnames(res) = c("prob", "prev")
        
        resultat_test = res
        View(resultat_test)
        #write.csv(x = data, file = file.path(responsesDir, fileName),row.names = FALSE, quote = TRUE)
    }
    
    # action to take when submit button is pressed
    observeEvent(input$submit, {
        shinyjs::disable("submit")
        shinyjs::show("submit_msg")
        shinyjs::hide("error")
        
        tryCatch({
            saveData(formData())
            shinyjs::reset("form")
            shinyjs::hide("form")
            shinyjs::show("thankyou_msg")
        },
        error = function(err) {
            shinyjs::html("error_msg", err$message)
            shinyjs::show(id = "error", anim = TRUE, animType = "fade")
        },
        finally = {
            shinyjs::enable("submit")
            shinyjs::hide("submit_msg")
        })
    })
    
    observeEvent(input$submit_another, {
        shinyjs::show("form")
        shinyjs::hide("thankyou_msg")
    }) 

    
    output$vbox1 <- renderValueBox({
        # total des candidats dans notre dataframe
        valueBox("Total candidat", value = nrow(df), color = "black")
    })
    
    output$vbox2 <- renderValueBox({
        # stat des candidats admissible
        admissible = df%>%filter(admissible==1)
        percent = round(nrow(admissible) * 100 / nrow(df), 2)
        percent = paste("(", percent, sep = "")
        percent = paste(percent, "%)",sep = "")
        percent = paste(nrow(admissible), percent, sep = "")
        valueBox("Total admissible", value = percent, icon=icon("filter"), color = "orange")
    })
    
    output$vbox3 <- renderValueBox({
        # stat des candidats admis
        admis = df%>%filter(admis==1)
        percent = round(nrow(admis) * 100 / nrow(df), 2)
        percent = paste("(", percent, sep = "")
        percent = paste(percent, "%)",sep = "")
        percent = paste(nrow(admis), percent, sep = "")
        valueBox("Total admis", value = percent, icon=icon("hashtag"), color = "aqua")
    })
    
    output$vbox4 <- renderValueBox({
        # stat des candidats respectant nos critères et ayant reussi au concours
        all_succes = df_reactive()[which(df_reactive()$admis == 1),]
        percent = paste("(",round(nrow(all_succes) * 100 / nrow(df_reactive()), 1), sep="")
        percent = paste(percent, "%)", sep="")
        tot_succes = nrow(all_succes)
        
        valueBox("Total avec filtres", value = paste(tot_succes, percent, sep=""), icon=icon("filter"), color = "green")
    })
    
    output$vbox5 <- renderValueBox({
        # stat fille
        nb_all_girl = length(which(df_reactive()$genre == 'F'))
        percent = paste("(", round(nb_all_girl / nrow(df_reactive()), 2) * 100, sep="")
        percent = paste(percent, "%)", sep="")
        valueBox("Candidat féminin", value = paste0(nb_all_girl, percent), icon=icon("female", lib = "font-awesome"), color = "fuchsia")
    })
    
    output$vbox6 <- renderValueBox({
        # stat succès féminin
        nb_all_girl_succes = length(which(df_reactive()$genre == 'F' & df_reactive()$admis == 1))
        percent = paste("(", round(nb_all_girl_succes / nrow(df_reactive()), 2) * 100, sep="")
        percent = paste(percent, "%)", sep="")
        valueBox("Succès féminin", value = paste0(nb_all_girl_succes, percent), icon=icon("venus", lib = "font-awesome"), color = "light-blue")
    })
    
    output$vbox7 <- renderValueBox({
        # stat garçon
        nb_all_boy = length(which(df_reactive()$genre == 'M'))
        percent = paste("(", round(nb_all_boy / nrow(df_reactive()), 2) * 100, sep="")
        percent = paste(percent, "%)", sep="")
        valueBox("Candidat masculin", value = paste0(nb_all_boy, percent), icon=icon("male", lib = "font-awesome"), color = "navy")
    })
    
    output$vbox8 <- renderValueBox({
        # stat succès masculin
        nb_all_boy_succes = length(which(df_reactive()$genre == 'M' & df_reactive()$admis == 1))
        percent = paste("(", round(nb_all_boy_succes / nrow(df_reactive()), 2) * 100, sep="")
        percent = paste(percent, "%)", sep="")
        valueBox("Succès masculin", value = paste0(nb_all_boy_succes, percent), icon=icon("mars", lib = "font-awesome"), color = "maroon")
    })
    
    output$resultat_admissibilite <- renderValueBox({
        
        
        valueBox("Résultat du test:", value = 5, icon=icon("mars", lib = "font-awesome"), color = "black")
    
        
    })
    

    output$plot_admis_genre <- renderPlotly({
        dat = df_reactive()%>%
            group_by(genre)%>%
            summarize(total=length(genre), nb_admis=length(which(df_reactive()$admis==1 & df_reactive()$genre == genre)), nb_admissible=length(which(df_reactive()$admissible==1 & df_reactive()$genre == genre)) )%>%
            arrange(desc(nb_admis), desc(nb_admissible))
        
        labels = dat$genre
        values = dat$nb_admis
        
        fig <- plot_ly(type='pie', labels=labels, values=values, 
                       textinfo='label+percent',
                       insidetextorientation='radial')
        
        fig <- fig%>%layout(title = "Admis par genre",
                            xaxis = list(title = ""),
                            yaxis = list(title = ""))
        fig
        
    })
    
    output$plot_classement_dren <- renderPlotly({
        dat = df_reactive()%>%
            group_by(DREN)%>%
            summarize(total=length(DREN), nb_admis=length(which(df_reactive()$admis==1 & df_reactive()$DREN == DREN)) )%>%
            arrange(desc(nb_admis), desc(total))
        
        dat = dat[input$cls_slider[1]:input$cls_slider[2], ]
        x <- dat$DREN
        y1 <- dat$nb_admis
        y2 <- dat$total - dat$nb_admis
        data <- data.frame(x, y1, y2)
        
        #The default order will be alphabetized unless specified as below:
        data$x <- factor(data$x, levels = data[["x"]])
        
        fig <- plot_ly(data, x = ~x, y = ~y1, type = 'bar', name = 'Admis', marker = list(color = 'rgb(49,130,189)'), textinfo='label+percent')
        fig <- fig %>% add_trace(y = ~y2, name = 'Non-admis', marker = list(color = 'rgb(204,204,204)'))
        fig <- fig %>% layout(
                            title = toupper("Classement des DREN suivant l'admission"),
                            xaxis = list(title = "", tickangle = -45),
                              yaxis = list(title = ""),
                              margin = list(b = 100),
                              barmode = 'group')
        
        fig
        
    })
    
    output$plot_admis_choix <- renderPlotly({
        dat = df_reactive()
        
        succes1 = nrow(dat[which(dat$codeFiliere_1 == dat$FiliereAccueil), c("FiliereAccueil", "codeFiliere_1")])
        succes2 = nrow(dat[which(dat$codeFiliere_2 == dat$FiliereAccueil), c("FiliereAccueil", "codeFiliere_2")])
        succes3 = nrow(dat[which(dat$codeFiliere_3 == dat$FiliereAccueil), c("FiliereAccueil", "codeFiliere_3")])
        succes4 = nrow(dat[which(dat$codeFiliere_4 == dat$FiliereAccueil), c("FiliereAccueil", "codeFiliere_4")])
        succes5 = nrow(dat[which(dat$codeFiliere_5 == dat$FiliereAccueil), c("FiliereAccueil", "codeFiliere_5")])
        succes6 = nrow(dat[which(dat$codeFiliere_6 == dat$FiliereAccueil), c("FiliereAccueil", "codeFiliere_6")])
        succes7 = nrow(dat[which(dat$codeFiliere_7 == dat$FiliereAccueil), c("FiliereAccueil", "codeFiliere_7")])
        succes8 = nrow(dat[which(dat$codeFiliere_8 == dat$FiliereAccueil), c("FiliereAccueil", "codeFiliere_8")])
        succes9 = nrow(dat[which(dat$codeFiliere_9 == dat$FiliereAccueil), c("FiliereAccueil", "codeFiliere_9")])
        
        total = rep(nrow(dat), 9)
            
        choix <- paste("choix", (1:9), sep=" ")
        nb_succes <- c(succes1, succes2, succes3, succes4, succes5, succes6, succes7, succes8, succes9)
        nb_echec <- total - nb_succes
        
        nb_succes = round(nb_succes / total * 100, 2)
        nb_echec = 100 - nb_succes
        
        data <- data.frame(choix, nb_succes, nb_echec)
        
        fig <- plot_ly(data, x = ~choix, y = ~nb_succes, type = 'bar', text = paste(nb_succes, "%", sep=""), name = 'Succes')
        fig <- fig %>% add_trace(y = ~nb_echec, name = 'Echec', text = paste(nb_echec, "%", sep=""))
        fig <- fig %>% layout(yaxis = list(title = 'Pourcentage'), barmode = 'stack', title = toupper("Admis et échec suivant les choix"))
        
        fig
        
        # pyramide des age
        #age <- rep(1:5, 2)
        #sex <- rep(c('Male', 'Female'), each = 5)
        #pop <- c(-1000, -944, -888, -762, -667, 1100, 999, 844, 789, 655)
        #df <- data.frame(age, sex, pop) %>%
        #    mutate(abs_pop = abs(pop))
        #df %>% 
        #    plot_ly(x= ~pop, y=~age,color=~sex) %>% 
        #    add_bars(orientation = 'h', hoverinfo = 'text', text = ~abs_pop) %>%
        #    layout(bargap = 0.1, barmode = 'overlay',
        #           xaxis = list(tickmode = 'array', tickvals = c(-1000, -500, 0, 500, 1000),
        #                        ticktext = c('1000', '500', '0', '500', '1000')))
        
        #fig <- plot_ly()
        #fig <- fig %>% add_bars(
        #    x = choix,
        #    y = nb_echec,
        #    base = -1*nb_echec,
        #    marker = list(
        #        color = 'orange'
        #    ),
        #    name = 'non-admis'
        #)
        #fig <- fig %>% add_bars(
        #    x = choix,
        #    y = nb_succes,
        #    base = 0,
        #    marker = list(
        #        color = 'blue'
        #    ),
        #    name = 'admis'
        #)
    })
    
    output$tab_admis_choix <- renderTable({
        dat = df_reactive()
        
        succes1 = nrow(dat[which(dat$codeFiliere_1 == dat$FiliereAccueil), c("FiliereAccueil", "codeFiliere_1")])
        succes2 = nrow(dat[which(dat$codeFiliere_2 == dat$FiliereAccueil), c("FiliereAccueil", "codeFiliere_2")])
        succes3 = nrow(dat[which(dat$codeFiliere_3 == dat$FiliereAccueil), c("FiliereAccueil", "codeFiliere_3")])
        succes4 = nrow(dat[which(dat$codeFiliere_4 == dat$FiliereAccueil), c("FiliereAccueil", "codeFiliere_4")])
        succes5 = nrow(dat[which(dat$codeFiliere_5 == dat$FiliereAccueil), c("FiliereAccueil", "codeFiliere_5")])
        succes6 = nrow(dat[which(dat$codeFiliere_6 == dat$FiliereAccueil), c("FiliereAccueil", "codeFiliere_6")])
        succes7 = nrow(dat[which(dat$codeFiliere_7 == dat$FiliereAccueil), c("FiliereAccueil", "codeFiliere_7")])
        succes8 = nrow(dat[which(dat$codeFiliere_8 == dat$FiliereAccueil), c("FiliereAccueil", "codeFiliere_8")])
        succes9 = nrow(dat[which(dat$codeFiliere_9 == dat$FiliereAccueil), c("FiliereAccueil", "codeFiliere_9")])
        
        total = rep(nrow(dat), 9)
        
        choix <- paste("choix", (1:9), sep=" ")
        nb_succes <- c(succes1, succes2, succes3, succes4, succes5, succes6, succes7, succes8, succes9)
        nb_echec <- total - nb_succes
        
        nb_succes = round(nb_succes / total * 100, 2)
        nb_echec = 100 - nb_succes
        
        data <- data.frame(choix, pourcentage_admis=paste(nb_succes, "%", sep=""), pourcentage_non_admis=paste(nb_echec, "%", sep=""))
        data
    })
    
    output$plot_filiere_choix <- renderPlotly({
        dat = df_reactive()
        
        filiere = dat$codeFiliere_1
        filiere = append(filiere, dat$codeFiliere_2)
        filiere = append(filiere, dat$codeFiliere_3)
        filiere = append(filiere, dat$codeFiliere_4)
        filiere = append(filiere, dat$codeFiliere_5)
        filiere = append(filiere, dat$codeFiliere_6)
        filiere = append(filiere, dat$codeFiliere_7)
        filiere = append(filiere, dat$codeFiliere_8)
        filiere = append(filiere, dat$codeFiliere_9)
        filiere = unique(filiere)
        
        d1 = dat%>%select(codeFiliere_1)%>%mutate(choix="choix 1")%>%rename(filiere=codeFiliere_1)
        d2 = dat%>%select(codeFiliere_2)%>%mutate(choix="choix 2")%>%rename(filiere=codeFiliere_2)
        d3 = dat%>%select(codeFiliere_3)%>%mutate(choix="choix 3")%>%rename(filiere=codeFiliere_3)
        d4 = dat%>%select(codeFiliere_4)%>%mutate(choix="choix 4")%>%rename(filiere=codeFiliere_4)
        d5 = dat%>%select(codeFiliere_5)%>%mutate(choix="choix 5")%>%rename(filiere=codeFiliere_5)
        d6 = dat%>%select(codeFiliere_6)%>%mutate(choix="choix 6")%>%rename(filiere=codeFiliere_6)
        d7 = dat%>%select(codeFiliere_7)%>%mutate(choix="choix 7")%>%rename(filiere=codeFiliere_7)
        d8 = dat%>%select(codeFiliere_8)%>%mutate(choix="choix 8")%>%rename(filiere=codeFiliere_8)
        d9 = dat%>%select(codeFiliere_9)%>%mutate(choix="choix 9")%>%rename(filiere=codeFiliere_9)
        
        d = rbind(d1, d2, d3, d4, d5, d6, d7, d8, d9)
        d = na.omit(d)
        choix <- paste("choix", (1:9), sep=" ")
        
        
        fig <- d
        fig <- fig %>% count(choix, filiere)
        fig <- fig %>% plot_ly(x = ~choix, y = ~n, color = ~filiere)
        fig <- fig %>% layout(
            title = toupper("Taux des filieres dans chaque choix"))
        fig
    })
    
    
    output$plot_eff_age <- renderPlotly({
        dat = df_reactive()
        ggplot(dat) + aes(x = age) + geom_bar(aes(fill=as.factor(annee)))+ylab("Effectifs")+labs(title = "EFFECTIFS DES CANDIDATS PAR AGE", fill="Annee")+
            scale_x_continuous(breaks = seq(11, 24,by=1))+
            scale_fill_manual(values = c("#ff7f0e","#1f77b4"))
    })
    
    output$plot_eff_genre <- renderPlotly({
        dat = df_reactive()
        dat <- dat %>% group_by(genre)
        dat <- dat %>% summarize(count = n())
        fig <- dat %>% plot_ly(labels = ~genre, values = ~count)
        fig <- fig %>% add_pie(hole = 0.6)
        fig <- fig %>% layout(title = toupper("Effectif par genre"),  showlegend = T,
                              xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                              yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
        
        fig
    })
    
    
    output$plot_eff_redoublement <- renderPlotly({
        dat = df_reactive()
        dat <- dat %>% group_by(redoublementTerminale)
        dat <- dat %>% summarize(count = n())
        fig <- dat %>% plot_ly(labels = ~redoublementTerminale, values = ~count, textinfo='label+percent')
        fig <- fig %>% add_pie(hole = 0.6)
        fig <- fig %>% layout(title = toupper("Effectif par redoublement"),  showlegend = T,
                              xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                              yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
        
        fig
    })
    
    output$plot_eff_serie <- renderPlotly({
        dat = df_reactive()
        ggplot(dat,aes(y=serie,fill=as.factor(annee)))+geom_bar()+labs(title = "EFFECTIFS DES CANDIDATS PAR SERIE", fill="annee") +xlab("EFFECTIF")+scale_fill_manual(values = c("#ff7f0e","#1f77b4"))
    })
    
    #output$plot_eff_dren <- renderPlotly({
    #    dat = df_reactive()
    #    ggplot(dat,aes(y=DREN, fill=as.factor(annee)))+geom_bar()+labs(title = "CANDIDATS/DREN", fill="Annee")+xlab("EFFECTIF")+scale_fill_manual(values = c("#ff7f0e","#1f77b4"))
    #})
    
    output$plot_eff_nationalite <- renderPlotly({
        dat <- df_reactive()
        dat$Nationalite[dat$Nationalite == "BURKINABE" | dat$Nationalite == "GUINEENNE" | dat$Nationalite == "BENINOISE" | dat$Nationalite == "NIGERIANNE" | dat$Nationalite == "TOGOLAISE" | dat$Nationalite == "MALIENNE" | dat$Nationalite == "NIGERIENNE" | dat$Nationalite == "SENEGALAISE" | dat$Nationalite == "GHANEENNE" ] = "SOUS-REGION"
        dat$Nationalite[dat$Nationalite == "CAMEROUNAISE" | dat$Nationalite == "CONGOLAISE(RDC)" | dat$Nationalite == "CENTRAFRICAINE" | dat$Nationalite == "SIERALEONAISE" | dat$Nationalite == "MAURITANIENNE" | dat$Nationalite == "CONGOLAISE" | dat$Nationalite == "FRANCAISE" | dat$Nationalite == "RWUANDAISE" ] = "AUTRE"

        dat <- dat %>% group_by(Nationalite)
        dat <- dat %>% summarize(count = n())
        fig <- dat %>% plot_ly(type='pie', labels = ~Nationalite, values = ~count, textinfo='label+percent', insidetextorientation='radial')
        fig <- fig %>% layout(
            title = toupper("Effectif par Nationalité \n"),  showlegend = T,
                              xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                              yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
        
        fig
    })
    
    output$plot_admis_mention <- renderPlotly({
        dat <- df_reactive()
        
        dat <- dat %>% group_by(mentionAuBac)
        dat <- dat %>% summarize(count = n())
        fig <- dat %>% plot_ly(type='pie', labels = ~mentionAuBac, values = ~count, textinfo='label+percent', insidetextorientation='radial')
        fig <- fig %>% layout(title = toupper("Admis par mention"),  showlegend = T,
                              xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                              yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
        
        fig
    })
    
    output$plot_admis_redoublement <- renderPlotly({
        dat <- df_reactive()
        
        dat <- dat %>% group_by(redoublementTerminale)
        dat <- dat %>% summarize(count = n())
        fig <- dat %>% plot_ly(type='pie', labels = ~redoublementTerminale, values = ~count, textinfo='label+percent', insidetextorientation='radial')
        fig <- fig %>% layout(title = toupper("Admis par redoublement"),  showlegend = T,
                              xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                              yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
        
        fig
    })
    
    
    output$tbl <- DT::renderDataTable({
        dat <- df_reactive()
        DT::datatable(dat,
                      rownames = F,
                      colnames = colnames(df),
                      extensions = 'Buttons',
                      options = list(pageLength = 25, 
                                     scrollX = T,
                                     filter = "top",
                                     dom = 'Bfrtip',
                                     buttons = c('csv', 'copy', 'print')
                                     
                      )) %>%
            formatStyle(columns = seq(1, 21, 1), fontSize = "9pt") %>%  # Reduce fontsize for all columns
            #formatRound(columns = c('Lat', 'Long'), 5) %>%  # Round latitude and longitude to 5 decimal places, still outputs full value
            formatStyle(
                'genre',
                target = 'cell',
                backgroundColor = styleEqual(c('M', 'F'), c('lightblue', 'pink'))
            ) %>%
            formatStyle(
                'admis',
                target = 'cell',
                backgroundColor = styleEqual(c('0', '1'), c('red', 'green'))
            )
    })
    
}

shinyApp(ui, server)