(define (problem european_trip_instance)
  (:domain european_trip)

  (:objects 
    venice porto dublin - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day)

  (:init 
    (at venice day1)
    (next_day day1 day2) (next_day day2 day3) (next_day day3 day4) 
    (next_day day4 day5) (next_day day5 day6) (next_day day6 day7) 
    (next_day day7 day8) (next_day day8 day9) (next_day day9 day10)
    (direct_flight dublin porto)
    (direct_flight venice dublin)
    (day_friends_available day1) (day_friends_available day2) 
    (day_friends_available day3) (day_friends_available day4))

  (:goal
    (and 
      (at venice day4)  ; Ensure in Venice on day 4
      (visited porto)
      (visited dublin)
      (exists (?day - day) (and (at venice ?day) (day_friends_available ?day)))))
)