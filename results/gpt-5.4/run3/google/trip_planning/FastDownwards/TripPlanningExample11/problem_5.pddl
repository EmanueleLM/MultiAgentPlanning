(define (problem tripplanningexample11)
  (:domain tripplanningexample11)

  (:objects
    vienna vilnius valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 - day
  )

  (:init
    (direct vienna valencia)
    (direct valencia vienna)
    (direct vienna vilnius)
    (direct vilnius vienna)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)
    (next day_10 day_11)
    (next day_11 day_12)
    (next day_12 day_13)
    (next day_13 day_14)
    (next day_14 day_15)

    (current_day day_1)
    (at vienna)

    (stay_requirement vienna day_1)
    (stay_requirement vienna day_2)
    (stay_requirement vienna day_3)
    (stay_requirement vienna day_4)
    (stay_requirement vienna day_5)

    (stay_requirement vilnius day_6)
    (stay_requirement vilnius day_7)
    (stay_requirement vilnius day_8)
    (stay_requirement vilnius day_10)
    (stay_requirement vilnius day_11)

    (stay_requirement valencia day_9)
    (stay_requirement valencia day_12)
    (stay_requirement valencia day_13)
    (stay_requirement valencia day_14)
    (stay_requirement valencia day_15)

    (conference_day day_9)
    (conference_day day_15)
  )

  (:goal
    (and
      (satisfied_stay vienna day_1)
      (satisfied_stay vienna day_2)
      (satisfied_stay vienna day_3)
      (satisfied_stay vienna day_4)
      (satisfied_stay vienna day_5)

      (satisfied_stay vilnius day_6)
      (satisfied_stay vilnius day_7)
      (satisfied_stay vilnius day_8)
      (satisfied_stay vilnius day_10)
      (satisfied_stay vilnius day_11)

      (satisfied_stay valencia day_9)
      (satisfied_stay valencia day_12)
      (satisfied_stay valencia day_13)
      (satisfied_stay valencia day_14)
      (satisfied_stay valencia day_15)

      (satisfied_conference day_9)
      (satisfied_conference day_15)

      (day_used day_1)
      (day_used day_2)
      (day_used day_3)
      (day_used day_4)
      (day_used day_5)
      (day_used day_6)
      (day_used day_7)
      (day_used day_8)
      (day_used day_9)
      (day_used day_10)
      (day_used day_11)
      (day_used day_12)
      (day_used day_13)
      (day_used day_14)
      (day_used day_15)
    )
  )
)