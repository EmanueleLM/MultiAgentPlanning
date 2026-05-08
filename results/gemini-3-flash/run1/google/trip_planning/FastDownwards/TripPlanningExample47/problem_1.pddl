(define (problem tripplanningexample47_prob)
  (:domain trip_planning)
  (:objects
    paris istanbul salzburg - city
    day1 day2 day3 day4 day5 day6 day7 - day
    count0 count1 count2 count3 count4 count5 - count_step
  )

  (:init
    ;; Starting point
    (at paris)
    (current_day day1)
    
    ;; Initial counts (Day 1 in Paris is already spent)
    (count_paris count1)
    (count_istanbul count0)
    (count_salzburg count0)

    ;; City connections
    (conn paris istanbul)
    (conn istanbul paris)
    (conn istanbul salzburg)
    (conn salzburg istanbul)

    ;; Day progression
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)

    ;; Counter progression
    (next_count count0 count1)
    (next_count count1 count2)
    (next_count count2 count3)
    (next_count count3 count4)
    (next_count count4 count5)
  )

  (:goal
    (and
      ;; Total trip duration reached
      (current_day day7)
      
      ;; Mandatory conference attendance in Paris (on Day 2, since Day 1 is starting point)
      (conference_attended)

      ;; City stay requirements
      (count_paris count2)
      (count_istanbul count2)
      (count_salzburg count5)
    )
  )
)