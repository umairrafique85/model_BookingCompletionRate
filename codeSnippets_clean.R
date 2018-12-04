# data pull ####
df_usersWSessCount <- google_analytics(viewId, date_range = c("2017-11-15", "2018-11-15"), 
                                       dimensions = c('userType', 'sessionCount'), 
                                       metrics = c('sessions', 'goal12Completions', 'goal8Completions'), 
                                       anti_sample = TRUE)
df_usrTypeSesCntDay <- google_analytics(viewId, date_range = c("2017-11-15", "2018-11-15"), 
                                        dimensions = c('userType', 'sessionCount', 'dayOfWeekName'), 
                                        metrics = c('sessions', 'goal12Completions', 'goal8Completions'), 
                                        anti_sample = TRUE)
which(is.na(df_mother3$completionRate))
df_sessionCount <- google_analytics(viewId, date_range = c("2017-11-15", "2018-11-15"), 
                                    dimensions = 'sessionCount', 
                                    metrics = c('sessions', 'goal12Completions', 'goal8Completions'), 
                                    anti_sample = TRUE)
df_userType <- google_analytics(viewId, date_range = c("2017-11-15", "2018-11-15"), 
                                dimensions = 'userType', 
                                metrics = c('sessions', 'goal12Completions', 'goal8Completions'), 
                                anti_sample = TRUE)
df_dayOfWeek <- google_analytics(viewId, date_range = c("2017-11-15", "2018-11-15"), 
                                 dimensions = 'dayOfWeekName', 
                                 metrics = c('sessions', 'goal12Completions', 'goal8Completions'), 
                                 anti_sample = TRUE)
df_dayOfWeek$dayOfWeekName <- factor(df_dayOfWeek$dayOfWeekName, 
                                     levels = c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'))
df_srcTimeCmpn <- google_analytics(viewId, date_range = c("2017-11-15", "2018-11-15"), 
                                   dimensions = c('campaign', 'sourceMedium', 'hour', 'month', 'dayOfWeekName'), 
                                   metrics = c('goal12Completions', 'goal8Completions', 'sessions', 'newUsers'), 
                                   anti_sample = TRUE)
df_srcTimeCmpn$dayOfWeekName <- factor(df_srcTimeCmpn$dayOfWeekName, 
                                       levels = c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'))
df_src <- google_analytics(viewId, date_range = c("2017-11-15", "2018-11-15"), 
                           dimensions = 'sourceMedium', 
                           metrics = c('goal12Completions', 'goal8Completions', 'sessions', 'newUsers'), 
                           anti_sample = TRUE)
df_device <- google_analytics(viewId, date_range = c("2017-11-15", "2018-11-15"), 
                              dimensions = 'deviceCategory',
                              metrics = c('sessions', 'goal12Completions', 'goal8Completions'), 
                              anti_sample = TRUE)
df_dvcUsr <- google_analytics(viewId, date_range = c("2017-11-15", "2018-11-15"), 
                              dimensions = c('deviceCategory', 'userType'),
                              metrics = c('sessions', 'goal12Completions', 'goal8Completions'), 
                              anti_sample = TRUE)
df_campnDist <- google_analytics(viewId, date_range = c(Sys.Date() - 365, Sys.Date()), 
                                 dimensions = c('adDistributionNetwork', 'campaign'), 
                                 metrics = c('sessions', 'goal12Completions', 'goal8Completions'), 
                                 anti_sample = TRUE)
df_srcMdmSgmntd12 <- google_analytics(viewId, date_range = c("2017-11-15", "2018-11-15"), 
                                      dimensions = 'sourceMedium', 
                                      metrics = 'sessions',
                                      segments = segment_ga4("abandoned", segment_id = "gaid::oApAkgQCQGO5mNNe5q4XFg"),
                                      anti_sample = TRUE)
df_srcMdmSgmntd8 <- google_analytics(viewId, date_range = c("2017-11-15", "2018-11-15"), 
                                     dimensions = 'sourceMedium', 
                                     metrics = 'sessions',
                                     segments = segment_ga4("abandoned", segment_id = "gaid::AzJ-RWvbSCu6oZlXT2-K6A"),
                                     anti_sample = TRUE)
df_srcMdmSgmntd <- google_analytics(viewId, date_range = c("2017-11-15", "2018-11-15"), 
                                    dimensions = 'sourceMedium', 
                                    metrics = 'sessions',
                                    segments = list(segment_ga4("abandoned", segment_id = "gaid::AzJ-RWvbSCu6oZlXT2-K6A"),
                                                    segment_ga4("abandoned", segment_id = "gaid::oApAkgQCQGO5mNNe5q4XFg")),
                                    anti_sample = TRUE)
df_campnSgmntd <- google_analytics(viewId, date_range = c("2017-11-15", "2018-11-15"), dimensions = 'campaign',
                                   metrics = 'sessions', 
                                   segments = list(segment_ga4("abandoned", segment_id = "gaid::AzJ-RWvbSCu6oZlXT2-K6A"),
                                                   segment_ga4("abandoned", segment_id = "gaid::oApAkgQCQGO5mNNe5q4XFg")),
                                   anti_sample = TRUE)
fltr_GoogleCpc <- dim_filter("sourceMedium", "EXACT", 'google / cpc')
fltrClause_dim <- filter_clause_ga4(list(fltr_GoogleCpc))
df_DayMnthGglCpc <- google_analytics(viewId, date_range = c("2017-11-15", "2018-11-15"), 
                                     dimensions = c('month', 'dayOfWeekName'), 
                                     metrics = 'sessions',
                                     segments = list(segment_ga4("abandoned", segment_id = "gaid::AzJ-RWvbSCu6oZlXT2-K6A"),
                                                     segment_ga4("abandoned", segment_id = "gaid::oApAkgQCQGO5mNNe5q4XFg")),
                                     filtersExpression = "ga:sourceMedium==google / cpc",
                                     anti_sample = TRUE)
df_DayMnthGglCpc$dayOfWeekName <- factor(df_DayMnthGglCpc$dayOfWeekName, 
                                         levels = c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'))
df_sessCostByMonth <- google_analytics(viewId, date_range = c("2017-11-15", "2018-11-15"), dimensions = 'month',
                                       metrics = c('sessions', 'adCost'), anti_sample = TRUE)
df_mother1 <- google_analytics(viewId, date_range = c("2017-11-15", "2018-11-15"), 
                               dimensions = c('day', 'dayOfWeekName', 'month', 'sourceMedium',
                                              'campaign', 'city'), 
                               metrics = c('sessions', 'goal12Completions', 'goal8Completions'), anti_sample = TRUE)
df_mother2 <- google_analytics(viewId, date_range = c("2017-11-15", "2018-11-15"), 
                               dimensions = c('day', 'dayOfWeekName', 'month', 
                                              'userType', 'landingPagePath', 'deviceCategory'), 
                               metrics = c('sessions', 'goal12Completions', 'goal8Completions'), anti_sample = TRUE)
df_mother3 <- google_analytics(viewId, date_range = c("2017-08-14", "2018-11-15"), 
                               dimensions = c('date', 'sourceMedium', 'campaign', 'userType', 'landingPagePath', 
                                              'deviceCategory'), 
                               metrics = c('sessions', 'goal12Completions', 'goal8Completions'), anti_sample = TRUE)
df_campTrgtVrf <- google_analytics(viewId, date_range = c("2018-10-03", "2018-11-21"), 
                                   dimensions = c('campaign', 'dimension4'), 
                                   metrics = c('sessions', 'goal12Completions', 'goal8Completions'), 
                                   anti_sample = TRUE)
df_campTrgtVrfSrcMdm <- google_analytics(viewId, date_range = c("2018-10-03", "2018-11-21"), 
                                         dimensions = c('sourceMedium', 'campaign', 'dimension4'), 
                                         metrics = c('sessions', 'goal12Completions', 'goal8Completions'), 
                                         anti_sample = TRUE)
df_recentData <- google_analytics(viewId, date_range = c('2018-10-03', '2018-11-25'), 
                                  dimensions = c('date', 'sourceMedium', 'campaign', 'dimension4', 'userType',
                                                 'landingPagePath', 'deviceCategory'), 
                                  metrics = c('sessions', 'goal12Completions', 'goal8Completions'),
                                  anti_sample = TRUE)

# data engineering ####
## aggregating data 
### google/cpc
df_gglCpc_rdy4act <- df_gglCpc %>% 
  group_by(campaignName, targetMarket, month, dayOfWeek, userType, deviceCategory, 
           landingPagePath) %>% 
  summarise(sessions = sum(sessions), goal12=sum(goal12Completions), 
            goal8=sum(goal8Completions))

df_gglCpc_rdy4act$completionRate <- df_gglCpc_rdy4act$goal8/df_gglCpc_rdy4act$goal12
df_gglCpc_rdy4act$completionRate[which(is.infinite(df_gglCpc_rdy4act$completionRate))] <- 1
lm_gglCpcAggr_upper <- lm(completionRate ~ campaignName + targetMarket + month + 
                            dayOfWeek + userType + deviceCategory + 
                            landingPagePath + sessions + userType:landingPagePath + 
                            campaignName:targetMarket, data = df_gglCpc_rdy4act)
lm_gglCpcAggr_sess <- lm(completionRate ~ sessions, data = df_gglCpc_rdy4act)
lm_gglCpcAggr_basic <- lm(completionRate ~ 1, data = df_gglCpc_rdy4act)
lm_gglCpcAggr_step <- stepAIC(object = lm_gglCpcAggr_sess, 
                              scope=list(upper=formula(lm_gglCpcAggr_upper), 
                                         lower=~1), direction='both')
save(lm_gglCpcAggr_step, file="RData/lm_gglCpcAggr_step")
save(lm_gglCpcAggr_upper, file="RData/lm_gglCpcAggr_upper")
### bing/cpc
df_bingCpc_rdy4act <- df_bingCPC %>% 
  group_by(campaignName, targetMarket, month, dayOfWeek, userType, deviceCategory, 
           landingPagePath) %>% 
  summarise(sessions = sum(sessions), goal12=sum(goal12Completions), 
            goal8=sum(goal8Completions))
df_bingCpc_rdy4act$completionRate <- df_bingCpc_rdy4act$goal8/df_bingCpc_rdy4act$goal12
df_bingCpc_rdy4act$completionRate[which(is.infinite(df_bingCpc_rdy4act$completionRate))] <- 1
## fix landing pages 
### google/cpc
landingPageRdcd <- gsub(".+schedule.*", "schedule", df_gglCpc_rdy4act$landingPagePath)
landingPageRdcd <- gsub(".+finalize.*", "finalize", landingPageRdcd)
landingPageRdcd <- gsub(".+confirm.*", "confirm", landingPageRdcd)
landingPageRdcd <- gsub(".+welcome.*", "welcome", landingPageRdcd)
landingPageRdcd <- gsub(".+congratulations.*", "congratulations", landingPageRdcd)
isLocation <- sapply(landingPageRdcd, function(path) {
  any(str_detect(gsub("[[:punct:]]|\\s", "", path), regex(vec_markets, ignore_case = TRUE)))
})
landingPageRdcd[which(isLocation)] <- "some location"
landingPageRdcd <- gsub(".+locations.*", "some location", landingPageRdcd)
landingPageRdcd <- gsub(".+cinninati.*", "some location", landingPageRdcd)
landingPageRdcd <- gsub("www.championwindow.com\\/", "/", landingPageRdcd)
df_gglCpc_rdy4act$landingPagePath <- landingPageRdcd
### bing/cpc
landingPageRdcd <- gsub(".+schedule.*", "schedule", df_bingCpc_rdy4act$landingPagePath)
landingPageRdcd <- gsub(".+finalize.*", "finalize", landingPageRdcd)
landingPageRdcd <- gsub(".+confirm.*", "confirm", landingPageRdcd)
landingPageRdcd <- gsub(".+welcome.*", "welcome", landingPageRdcd)
landingPageRdcd <- gsub(".+congratulations.*", "congratulations", landingPageRdcd)
isLocation <- sapply(landingPageRdcd, function(path) {
  any(str_detect(gsub("[[:punct:]]|\\s", "", path), regex(vec_markets, ignore_case = TRUE)))
})
landingPageRdcd[which(isLocation)] <- "some location"
landingPageRdcd <- gsub(".+locations.*", "some location", landingPageRdcd)
landingPageRdcd <- gsub(".+ft-wayne.*", "some location", landingPageRdcd)
landingPageRdcd <- gsub("www.championwindow.com\\/", "/", landingPageRdcd)
df_bingCpc_rdy4act$landingPagePath <- landingPageRdcd



# modelling ####
## google/cpc 
lm_gglCpcAggr_upper <- lm(completionRate ~ campaignName + targetMarket + month + 
                            dayOfWeek + userType + deviceCategory + 
                            landingPagePath + sessions + userType:landingPagePath + 
                            campaignName:targetMarket, data = df_gglCpc_rdy4act)
save(lm_gglCpcAggr_upper, file="RData/lm_gglCpcAggr_upper")
lm_gglCpcAggr_sess <- lm(completionRate ~ sessions, data = df_gglCpc_rdy4act)
lm_gglCpcAggr_step <- stepAIC(object = lm_gglCpcAggr_sess, 
                              scope=list(upper=formula(lm_gglCpcAggr_upper), 
                                         lower=~1), direction='both')
save(lm_gglCpcAggr_step, file="RData/lm_gglCpcAggr_step")
## bing/cpc 
lm_bingCpcAggr_upper <- lm(completionRate ~ campaignName + targetMarket + month + 
                            dayOfWeek + userType + deviceCategory + 
                            landingPagePath + sessions + userType:landingPagePath + 
                            campaignName:targetMarket, data = df_bingCpc_rdy4act)
save(lm_bingCpcAggr_upper, file="RData/lm_bingCpcAggr_upper")
lm_bingCpcAggr_sess <- lm(completionRate ~ sessions, data = df_bingCpc_rdy4act)
lm_bingCpcAggr_step <- stepAIC(object = lm_bingCpcAggr_sess, 
                              scope=list(upper=formula(lm_bingCpcAggr_upper), 
                                         lower=~1), direction='both')
save(lm_bingCpcAggr_step, file="RData/lm_bingCpcAggr_step")