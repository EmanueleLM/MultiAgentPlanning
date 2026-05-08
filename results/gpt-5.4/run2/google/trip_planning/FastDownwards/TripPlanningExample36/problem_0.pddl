(define (problem european_trip_13_days_instance_problem)
  (:domain european_trip_13_days_instance)

  (:objects
    florence munich warsaw - city

    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day

    florence_t1 florence_t2
    warsaw_t1 warsaw_t2 warsaw_t3 warsaw_t4 warsaw_t5 warsaw_t6 warsaw_t7
    munich_t1 munich_t2 munich_t3 munich_t4 munich_t5 munich_t6 - token
  )

  (:init
    (first_day d1)
    (last_day d13)

    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    (next_day d10 d11)
    (next_day d11 d12)
    (next_day d12 d13)

    (current_day d1)

    (direct florence munich)
    (direct florence warsaw)

    (token_for_city florence_t1 florence)
    (token_for_city florence_t2 florence)
    (token_for_city warsaw_t1 warsaw)
    (token_for_city warsaw_t2 warsaw)
    (token_for_city warsaw_t3 warsaw)
    (token_for_city warsaw_t4 warsaw)
    (token_for_city warsaw_t5 warsaw)
    (token_for_city warsaw_t6 warsaw)
    (token_for_city warsaw_t7 warsaw)
    (token_for_city munich_t1 munich)
    (token_for_city munich_t2 munich)
    (token_for_city munich_t3 munich)
    (token_for_city munich_t4 munich)
    (token_for_city munich_t5 munich)
    (token_for_city munich_t6 munich)

    (unused florence_t1)
    (unused florence_t2)
    (unused warsaw_t1)
    (unused warsaw_t2)
    (unused warsaw_t3)
    (unused warsaw_t4)
    (unused warsaw_t5)
    (unused warsaw_t6)
    (unused warsaw_t7)
    (unused munich_t1)
    (unused munich_t2)
    (unused munich_t3)
    (unused munich_t4)
    (unused munich_t5)
    (unused munich_t6)
  )

  (:goal
    (and
      (trip_complete)

      (assigned d1)
      (assigned d2)
      (assigned d3)
      (assigned d4)
      (assigned d5)
      (assigned d6)
      (assigned d7)
      (assigned d8)
      (assigned d9)
      (assigned d10)
      (assigned d11)
      (assigned d12)
      (assigned d13)

      (used florence_t1)
      (used florence_t2)

      (used warsaw_t1)
      (used warsaw_t2)
      (used warsaw_t3)
      (used warsaw_t4)
      (used warsaw_t5)
      (used warsaw_t6)
      (used warsaw_t7)

      (used munich_t1)
      (used munich_t2)
      (used munich_t3)
      (used munich_t4)
      (used munich_t5)
      (used munich_t6)
    )
  )
)