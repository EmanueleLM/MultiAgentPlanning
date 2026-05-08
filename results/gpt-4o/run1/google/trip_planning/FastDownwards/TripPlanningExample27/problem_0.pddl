(define (problem euro_trip_instance)
  (:domain euro_trip)
  (:objects
    amsterdam santorini istanbul - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day
  )
  
  (:init
    (in_city amsterdam day_1)
    (flight_exists amsterdam santorini)
    (flight_exists istanbul amsterdam)
    (successor day_1 day_2)
    (successor day_2 day_3)
    (successor day_3 day_4)
    (successor day_4 day_5)
    (successor day_5 day_6)
    (successor day_6 day_7)
    (successor day_7 day_8)
    (successor day_8 day_9)
    (successor day_9 day_10)
    (successor day_10 day_11)
    (successor day_11 day_12)
    (successor day_12 day_13)
    (successor day_13 day_14)
  )
  
  (:goal
    (and
      (planned_trip_finished)
      (forall (?c - city ?d - day)
        (imply (in_city ?c ?d) 
          (or
            (and (= ?c amsterdam) (or (= ?d day_1) (= ?d day_2) (= ?d day_3) (= ?d day_4) (= ?d day_5) (= ?d day_6) (= ?d day_7)))
            (and (= ?c istanbul) (or (= ?d day_8) (= ?d day_9) (= ?d day_10) (= ?d day_11) (= ?d day_12) (= ?d day_13)))
            (and (= ?c santorini) (or (= ?d day_12) (= ?d day_13) (= ?d day_14)))
          )
        )
      )
      (exists (?d - day) (visited_relatives_santorini ?d))
    )
  )
)