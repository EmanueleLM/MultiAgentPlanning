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

    ;; direct flights as provided by the specification (directional where specified)
    (direct_flight split geneva)
    (direct_flight geneva split)
    (direct_flight manchester split)
    (direct_flight manchester geneva)
  )

  (:goal
    (and
      ;; every day must be assigned (trip length exactly 4 days)
      (assigned day1)
      (assigned day2)
      (assigned day3)
      (assigned day4)

      ;; meeting requirement (preserved verbatim from the specification):
      ;; be in Split between day2 and day3 (interpreted here as being in Split on day2 and on day3)
      (at split day2)
      (at split day3)

      ;; user-specified visit-duration requirements encoded as concrete day occupancies.
      ;; These requirements are inconsistent with one another and with the 4-day horizon,
      ;; but are preserved exactly from the specification.
      (at manchester day1)
      (at manchester day4)

      (at geneva day1)
      (at geneva day4)
    )
  )
)