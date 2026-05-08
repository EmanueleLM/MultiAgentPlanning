(define (problem travel_plan)
  (:domain travel_schedule)
  (:objects
    split manchester riga - city
    day_1 day_2 day_3 day_4 day_5 day_6
    day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 - day
  )
  (:init
    (at split day_1)
    (can_fly riga manchester)
    (can_fly manchester riga)
    (can_fly manchester split)
    (successor day_1 day_2) (successor day_2 day_3)
    (successor day_3 day_4) (successor day_4 day_5)
    (successor day_5 day_6) (successor day_6 day_7)
    (successor day_7 day_8) (successor day_8 day_9)
    (successor day_9 day_10) (successor day_10 day_11)
    (successor day_11 day_12) (successor day_12 day_13)
    (successor day_13 day_14) (successor day_14 day_15)
  )
  (:goal (and
    (at riga day_8)
    (at manchester day_12)
    (at split day_15)
  ))
)