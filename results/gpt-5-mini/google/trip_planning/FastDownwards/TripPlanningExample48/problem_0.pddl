(define (problem jack_trip_problem)
  (:domain jackofalltrades_trip_domain)
  (:objects
    split manchester geneva - city
    day1 day2 day3 day4 - day
  )

  (:init
    ;; day ordering
    (succ day1 day2)
    (succ day2 day3)
    (succ day3 day4)

    ;; direct flights (encoded exactly as provided)
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

      ;; hard visit-duration requirements (encoded as concrete day occupancy requirements)
      ;; Manchester for 2 days (chosen concretely as day1 and day4)
      (at manchester day1)
      (at manchester day4)

      ;; Geneva for 2 days (chosen concretely as day1 and day4)
      (at geneva day1)
      (at geneva day4)
    )
  )
)