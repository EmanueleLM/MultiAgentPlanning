(define (problem trip_problem)
  (:domain jack_of_all_trades_trip)
  (:objects
    copenhagen lisbon florence - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8
    day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day
  )

  (:init
    ;; timeline successive-day links
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
    (next day_15 day_16)

    ;; direct flights (only the explicitly given direct connections; both directions provided)
    (flight copenhagen lisbon)
    (flight lisbon copenhagen)
    (flight lisbon florence)
    (flight florence lisbon)

    ;; starting condition: at Copenhagen on day 1 and day_1 already assigned
    (at copenhagen day_1)
    (assigned day_1)
  )

  ;; Hard goal encoding of the user's requirements.
  ;; Note: The user requested totals that sum to 18 days (7 copenhagen + 7 lisbon + 4 florence)
  ;; while the trip length is 16 days. These constraints are preserved exactly here as hard goals;
  ;; the resulting problem is therefore unsolvable by construction.
  (:goal
    (and
      ;; every day must be assigned (16 days total)
      (assigned day_1) (assigned day_2) (assigned day_3) (assigned day_4)
      (assigned day_5) (assigned day_6) (assigned day_7) (assigned day_8)
      (assigned day_9) (assigned day_10) (assigned day_11) (assigned day_12)
      (assigned day_13) (assigned day_14) (assigned day_15) (assigned day_16)

      ;; Conference constraints: day 1 and day 7 must be in Copenhagen
      (at copenhagen day_1)
      (at copenhagen day_7)

      ;; Required total stays per city encoded as explicit per-day location facts (hard constraints).
      ;; Copenhagen: 7 days (encoded as days 1-7)
      (at copenhagen day_1)
      (at copenhagen day_2)
      (at copenhagen day_3)
      (at copenhagen day_4)
      (at copenhagen day_5)
      (at copenhagen day_6)
      (at copenhagen day_7)

      ;; Lisbon: 7 days (encoded as days 8-14)
      (at lisbon day_8)
      (at lisbon day_9)
      (at lisbon day_10)
      (at lisbon day_11)
      (at lisbon day_12)
      (at lisbon day_13)
      (at lisbon day_14)

      ;; Florence: 4 days (encoded as days 9-12)
      (at florence day_9)
      (at florence day_10)
      (at florence day_11)
      (at florence day_12)
    )
  )
)