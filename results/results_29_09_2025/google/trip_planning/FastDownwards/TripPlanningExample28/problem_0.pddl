(define (problem trip-12days)
  (:domain trip-planning)
  (:objects
    venice zurich florence - city
  )

  (:init
    ;; starting location (Venice assumed from Venice-local planner context)
    (at venice)

    ;; direct flight availability (as reported)
    (direct venice zurich)
    (direct zurich venice)
    (direct zurich florence)

    ;; numeric initializations
    (= (used-days) 0)
    (= (days-in venice) 0)
    (= (days-in zurich) 0)
    (= (days-in florence) 0)

    ;; hard minimum-day requirements derived from agent reports (encoded as strict constraints)
    (= (min-days venice) 6)
    (= (min-days florence) 6)
    (= (min-days zurich) 2)
  )

  (:goal
    (and
      ;; must satisfy each city's required stay (agent hard preferences / public stated desires)
      (>= (days-in venice) 6)
      (>= (days-in florence) 6)
      (>= (days-in zurich) 2)

      ;; overall trip budget must not exceed 12 days
      (<= (used-days) 12)
    )
  )
)