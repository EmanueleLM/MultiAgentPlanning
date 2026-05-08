(define (problem trip_planning_example46_instance)
  (:domain trip_planning_example46)

  (:objects
    seville manchester stockholm - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
    len0 len1 len2 len3 len4 len5 - staylen
  )

  (:init
    (current_day day_1)
    (at stockholm)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)
    (next_day day_10 day_11)
    (final_day day_11)

    (direct manchester seville)
    (direct seville manchester)
    (direct stockholm manchester)
    (direct manchester stockholm)

    (succ_len len0 len1)
    (succ_len len1 len2)
    (succ_len len2 len3)
    (succ_len len3 len4)
    (succ_len len4 len5)

    (days_used seville len0)
    (days_used manchester len0)
    (days_used stockholm len0)

    (required_city day_1 stockholm)
    (required_city day_2 stockholm)
    (required_city day_3 stockholm)
    (required_city day_4 manchester)
    (required_city day_5 manchester)
    (required_city day_6 manchester)
    (required_city day_7 manchester)
    (required_city day_8 manchester)
    (required_city day_9 seville)
    (required_city day_10 seville)
    (required_city day_11 seville)
  )

  (:goal
    (and
      (days_used seville len3)
      (days_used manchester len5)
      (days_used stockholm len3)
      (visited seville)
      (visited manchester)
      (visited stockholm)
      (not (current_day day_1))
      (not (current_day day_2))
      (not (current_day day_3))
      (not (current_day day_4))
      (not (current_day day_5))
      (not (current_day day_6))
      (not (current_day day_7))
      (not (current_day day_8))
      (not (current_day day_9))
      (not (current_day day_10))
      (not (current_day day_11))
    )
  )
)