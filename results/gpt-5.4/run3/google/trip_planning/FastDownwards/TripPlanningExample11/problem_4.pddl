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

    (required vienna day_1)
    (required vienna day_2)
    (required vienna day_3)
    (required vienna day_4)
    (required vienna day_5)

    (required vilnius day_6)
    (required vilnius day_7)
    (required vilnius day_8)
    (required vilnius day_10)
    (required vilnius day_11)

    (required valencia day_9)
    (required valencia day_12)
    (required valencia day_13)
    (required valencia day_14)
    (required valencia day_15)
  )

  (:goal
    (and
      (visited vienna day_1)
      (visited vienna day_2)
      (visited vienna day_3)
      (visited vienna day_4)
      (visited vienna day_5)

      (visited vilnius day_6)
      (visited vilnius day_7)
      (visited vilnius day_8)
      (visited vilnius day_10)
      (visited vilnius day_11)

      (visited valencia day_9)
      (visited valencia day_12)
      (visited valencia day_13)
      (visited valencia day_14)
      (visited valencia day_15)
    )
  )
)