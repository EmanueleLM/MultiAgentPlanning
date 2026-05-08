(define (problem travel_plan)
  (:domain travel)

  (:objects
    stockholm athens mykonos - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 - day
  )

  (:init
    (in_city stockholm day_1)
    (direct_flight athens mykonos)
    (direct_flight stockholm athens)
    (conference stockholm day_1)
    (conference stockholm day_6)
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
    ; Restricted days for flying or being in other cities

    ; Can fly or change city before or after conference days
    (can_fly day_2)
    (can_fly day_3)
    (can_fly day_4)
    (can_fly day_5)
    (can_fly day_7)
    (can_fly day_12)
    (can_fly day_13)
  )

  (:goal
    (and
      (in_city stockholm day_13)
      (visited athens)
      (visited mykonos)
      (visited stockholm)
    )
  )
)