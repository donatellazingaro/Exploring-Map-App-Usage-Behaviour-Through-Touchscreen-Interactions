library(dplyr)
library(corrplot)
library(RColorBrewer)
library(archetypes)
library(ggplot2)
library(lme4)


dataset <- exploded_dataset %>% select(c(2,4:27))

#without participant id
dataset_pure <- dataset %>% select(c(2:25))

#scaling of all tapping columns, keeping the id and home distance
dataset_complete <- dataset_pure %>% select(c(2:24)) %>% rescale() %>% as.data.frame() %>% cbind(dataset$level_0) %>% cbind(dataset$home_distance)

#same but scaling 0-1
dataset_norm <- dataset_pure %>% select(c(2:24)) 
dataset_norm <- mutate(dataset_norm-min(dataset_norm))/(max(dataset_norm)-min(dataset_norm))
dataset_norm <- cbind(dataset_norm, dataset$level_0, dataset$home_distance)
dataset_norm_all <- mutate(dataset_pure-min(dataset_pure))/(max(dataset_pure)-min(dataset_pure))
dataset_norm_all <- cbind(dataset_norm_all, dataset$level_0)



#### correlation matrix 
corr_dataset_pure <- cor(dataset_pure)
corrplot(corr_dataset_pure, type="upper")

#### plotting distances
ggplot(dataset_pure, aes(home_distance)) + 
  geom_histogram(binwidth = 2) +
  scale_x_continuous(limits = c(0,500)) 

#### regression analysis
glmer_all <- glmer(home_distance ~ maps_taps + travel_taps + productivity_taps + personalisation_taps + tools_taps +
                     communication_taps + news_magazines_taps + social_taps + shopping_taps + video_players_taps + finance_taps + 
                     weather_taps + photography_taps + entertainement_taps + sport_taps + lifestyle_taps + music_audio_taps +
                     game_taps + education_taps + business_taps + health_fitness_taps + food_drink_taps + books_reference_taps + 
                          (1|dataset$level_0), 
                        data = dataset_norm_all, family = binomial(), 
                        glmerControl(optimizer = "bobyqa", optCtrl = list(maxfun = 100000)))
summary(glmer_all)

#### AA 
set.seed(1986)

dataset_aa <- dataset_norm %>% select(c(1:23,25))

aa <- stepArchetypes(dataset_aa, k = 1:10, verbose = TRUE)
screeplot(aa)

best_aa <- bestModel(aa[[6]])
simplexplot(best_aa, show_points = T, show_direction = F, show_circle = F, edges_col ="light grey")

best_aa_archetypes <- as.data.frame(best_aa$archetypes)
best_aa_alphas <- as.data.frame(best_aa$alphas)

barplot(best_aa, dataset_aa, percentiles = TRUE)

View(rbind(dataset$level_0, dataset_scaled))


