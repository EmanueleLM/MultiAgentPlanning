(define (problem tripplanningexample47_prob)
  (:domain trip_planning)
  (:objects
    paris istanbul salzburg - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
    count0 count1 count2 count3 count4 count5 - count_step
  )

  (:init
    ;; Starting point
    (at paris)
    (current_day day1)
    
    ;; Initial city stay counts
    (count paris count0)
    (count istanbul count0)
    (count salzburg count0)

    ;; City connections (direct flights)
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
    (next_day day7 day8)

    ;; Counter progression
    (next_count count0 count1)
    (next_count count1 count2)
    (next_count count2 count3)
    (next_count count3 count4)
    (next_count count4 count5)
  )

  (:goal
    (and
      ;; Total trip duration (7 actions corresponding to 7 days)
      (current_day day8)
      
      ;; Mandatory conference attendance in Paris during Day 1 and Day 2
      (visited paris day1)
      (visited paris day2)

      ;; Specific stay duration requirements
      ;; Paris: 2 days, Istanbul: 2 days, Salzburg: 5 days
      (count paris count2)
      (count istanbul count2)
      (count salzburg count5)
    )
  )
)