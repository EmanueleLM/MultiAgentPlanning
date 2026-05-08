(define (problem europe_trip_problem)
  (:domain europe_trip)
  
  (:objects 
    frankfurt bucharest stuttgart - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init 
    (next day_1 day_2) (next day_2 day_3) (next day_3 day_4)
    (next day_4 day_5) (next day_5 day_6) (next day_6 day_7)
    (next day_7 day_8) (next day_8 day_9) (next day_9 day_10)

    (can_fly bucharest frankfurt)
    (can_fly frankfurt stuttgart)
    (can_fly frankfurt bucharest)
    (can_fly stuttgart frankfurt)

    (workshop_day day_5) (workshop_day day_6) 
    (workshop_day day_7) (workshop_day day_8) 
    (workshop_day day_9) (workshop_day day_10)

    (at bucharest day_1) ; Start trip at Bucharest
  )

  (:goal (and
    (at frankfurt day_4) ; By day 4, visit Frankfurt to ensure 3 days
    (at stuttgart day_7) ; Ensure staying in Stuttgart during a workshop day
    (at bucharest day_10) ; Return to Bucharest to end trip
  ))
)