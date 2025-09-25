(define (problem trip-multiagent-problem)
  (:domain trip-multiagent)

  (:objects
    london bucharest riga - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )

  (:init
    ; direct flights (bidirectional as given between the pairs)
    (direct london bucharest)
    (direct bucharest london)
    (direct bucharest riga)
    (direct riga bucharest)

    ; day ordering for an 8-day trip
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)

    ; workshop window: must attend between day5 and day8 inclusive
    (workshop-window day5)
    (workshop-window day6)
    (workshop-window day7)
    (workshop-window day8)

    ; Riga is the workshop city
    (workshop-city riga)

    ; starting location: London on day1
    (at london day1)
  )

  ; Goals:
  ; - visit London, Bucharest, Riga at least once
  ; - attend the workshop in Riga sometime between day5 and day8
  ; - complete the trip on day8 in Riga (ensures an 8-day itinerary)
  (:goal (and
           (visited london)
           (visited bucharest)
           (visited riga)
           (attended)
           (at riga day8)
         )
  )
)