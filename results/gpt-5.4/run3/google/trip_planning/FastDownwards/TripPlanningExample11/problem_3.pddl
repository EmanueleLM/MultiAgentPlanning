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

    (conference_day day_9)
    (conference_day day_15)
    (last_day day_15)

    (current_day day_1)
    (at vienna)
  )

  (:goal
    (and
      (in vienna day_1)
      (in vienna day_2)
      (in vienna day_3)
      (in vienna day_4)
      (in vienna day_5)

      (in vilnius day_6)
      (in vilnius day_7)
      (in vilnius day_8)
      (in vilnius day_10)
      (in vilnius day_11)

      (in valencia day_9)
      (in valencia day_12)
      (in valencia day_13)
      (in valencia day_14)
      (in valencia day_15)

      (in valencia day_9)
      (in valencia day_15)
    )
  )
)