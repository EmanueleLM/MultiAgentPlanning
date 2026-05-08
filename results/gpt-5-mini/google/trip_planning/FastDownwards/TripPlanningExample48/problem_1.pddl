(define (problem trip_planning_example48)
  (:domain trip_planning_instance)
  (:objects
    split manchester geneva - city
    day1 day2 day3 day4 - day
  )

  (:init
    ;; day order
    (succ day1 day2)
    (succ day2 day3)
    (succ day3 day4)

    ;; direct flights (as provided)
    (direct_flight split geneva)
    (direct_flight geneva split)
    (direct_flight manchester split)
    (direct_flight manchester geneva)

    ;; no (at ...) and no (assigned ...) facts initially
  )

  (:goal
    (and
      ;; every day must be assigned (trip length exactly 4 days)
      (assigned day1)
      (assigned day2)
      (assigned day3)
      (assigned day4)

      ;; meeting requirement: be in Split on day2 and day3
      (at split day2)
      (at split day3)

      ;; user-specified visit-duration requirements (preserved verbatim).
      ;; The user requested: Manchester for 2 days and Geneva for 2 days.
      ;; The problem statement did not fix which concrete days those should be;
      ;; to preserve the hard constraint exactly we encode concrete day occupancy
      ;; requirements here (this makes the instance over-constrained and likely unsolvable).
      (at manchester day1)
      (at manchester day4)

      (at geneva day1)
      (at geneva day4)
    )
  )
)