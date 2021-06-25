# Load packages
library(tidyverse)

# Load data
funny <- read.csv(here::here("data/FUN-t.csv"))
glimpse(FUN)

# rename columns
funny <- funny %>%
    rename(number_papers = How.many.scientific.papers.do.you.read.per.week.,
           coffee_time = What.is.the.optimal.time.for.afternoon.coffee.tea.,
           coffee_tea = Do.you.prefer.coffee.or.tea.,
           coffee_cups = How.many.cups.of.coffee.do.you.drink.each.day.,
           number_children = How.many.children.do.you.have.,
           km_from_tower = How.many.km.from.the.tower.do.you.live.,
           hours_zoom = How.many.hours.of.zoom.meetings.do.you.have.per.week.,
           group_meeting = What.is.the.optimal.time.for.group.meeting.,
           evening_work = Do.you.work.in.the.evening.,
           yoga = Do.you.practice.yoga.,
           run = Do.you.run.,
           pets = Do.you.have.any.pets.,
           liquorice = Do.you.like.liquorice.,
           music = Do.you.work.with.music.in.your.ears.,
           start_work = When.do.you.normally.start.work.,
           end_work = When.do.you.normally.end.work.,
           pajamas_zoom = Have.you.ever.done.a.zoom.meeting.in.pajamas.,
           sports_zoom = Have.you.ever.done.a.zoom.meeting.in.sports.clothes.,
           phys_active_days = How.many.days.week.are.you.physically.active.for.a.total.of.at.least.1.hour.day...physically.active.to.the.point.where.the.heart.rate.increases.and.your.breathing.becomes.faster.)

str(funny)

# change to factor
for(i in c(4, 7:12, 15, 19)) {
    funny[ ,i] <- as.factor(funny[ ,i])
}

# change to time
#for(i in c(3, 16:18)) {
#     funny[ ,i] <- as.POSIXlt(funny[ ,i])
# } # Not working

# change times to numeric
getTime <- function(x){
    sub(":",".",
        sub(":30",":50",x)
        )
    }

funny$coffee_time <- as.numeric(getTime(funny$coffee_time))
funny$group_meeting <- as.numeric(getTime(funny$group_meeting))
funny$start_work <- as.numeric(getTime(funny$start_work))
funny$end_work <- <- as.numeric(getTime(funny$end_work))

# Change theme
theme_set(theme_bw())

# y = when afternoon tea, x = papers, the more papers one reads, the later the afternoon tea
funny %>%
    drop_na(coffee_time) %>%
    ggplot(aes(x = number_papers, y = coffee_time)) +
    geom_point() +
    geom_smooth(method = lm)

# y = children, x = zoom hours, the more children the more zoom hours
funny %>%
    ggplot(aes(x = hours_zoom, y = number_children)) +
    geom_point() +
    geom_smooth(method = lm)

# y = start work, x = end work, the later you end the later you start :slightly_smiling_face:

# y = liquorice, x = children, the more children the higher the risk of liking liquorice

funny %>%
    ggplot(aes(y = number_children, fill = liquorice)) +
    # geom_bar(position = position_dodge())
    geom_boxplot() +
    scale_fill_viridis_d()

# y = pyjamaes meeting, x = optimal time for afternoon tea, the later tea time the higher the risk of pyjamas meeting
# y = work in the evening , x = optimal time afternoon tea, the later the tea time the lower the risk of working in the evening
# y = work in the evening , x = papers the more papers you read the lower the risk of working in the evening

