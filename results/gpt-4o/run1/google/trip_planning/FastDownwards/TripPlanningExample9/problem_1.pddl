(define (problem europe_trip_problem)
  (:domain europe_trip)
  
  (:objects 
    frankfurt bucharest stuttgart - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init 
    (day_order day_1) (day_order day_2) (day_order day_3) 
    (day_order day_4) (day_order day_5) (day_order day_6) 
    (day_order day_7) (day_order day_8) (day_order day_9)
    (day_order day_10)

    (next day_1 day_2) (next day_2 day_3) (next day_3 day_4)
    (next day_4 day_5) (next day_5 day_6) (next day_6 day_7)
    (next day_7 day_8) (next day_8 day_9) (next day_9 day_10)

    (can_fly bucharest frankfurt)
    (can_fly frankfurt stuttgart)

    (workshop_window day_5) (workshop_window day_6) 
    (workshop_window day_7) (workshop_window day_8) 
    (workshop_window day_9) (workshop_window day_10)

    (at bucharest day_1) ; Starting the trip at Bucharest
  )

  (:goal (and
    (workshop_attended day_5)
    (exists (?d1 ?d2 ?d3 - day) 
      (and (at frankfurt ?d1) (at frankfurt ?d2) (at frankfurt ?d3)
           (day_order ?d1) (day_order ?d2) (day_order ?d3)
           (validate_stay frankfurt ?d1 ?d2 ?d3)
      )
    )
    (exists (?d4 ?d5 ?d6 - day) 
      (and (at stuttgart ?d4) (at stuttgart ?d5) (at stuttgart ?d6)
           (day_order ?d4) (day_order ?d5) (day_order ?d6)
           (validate_stay stuttgart ?d4 ?d5 ?d6)
           (or (workshop_attended day_5) (workshop_attended day_6)
               (workshop_attended day_7) (workshop_attended day_8)
               (workshop_attended day_9) (workshop_attended day_10))
      )
    )
    (exists (?d7 ?d8 ?d9 - day) 
      (and (at bucharest ?d7) (at bucharest ?d8) (at bucharest ?d9)
         (day_order ?d7) (day_order ?d8) (day_order ?d9)
         (validate_stay bucharest ?d7 ?d8 ?d9)
      )
    )
  ))
)