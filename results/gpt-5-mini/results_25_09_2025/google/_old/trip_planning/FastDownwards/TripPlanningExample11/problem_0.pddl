(define (problem integrated-trip-problem)
  (:domain integrated_trip)

  (:objects
    vienna vilnius valencia - city
  )

  (:init
    ;; start day = 1
    (= (day) 1)

    ;; spent counters start at 0
    (= (spent vienna) 0)
    (= (spent vilnius) 0)
    (= (spent valencia) 0)

    ;; starting location chosen (consistent with agent2's provided default)
    (at vienna)

    ;; direct-flight connectivity (public knowledge)
    (direct vienna valencia)
    (direct valencia vienna)
    (direct vienna vilnius)
    (direct vilnius vienna)

    ;; conferences not yet attended (neither agent's predicates are true)
    ;; (conf9-done), (conf15-done), (attended9), (attended15) are all false initially
  )

  ;; Goal:
  ;; - attend both conferences on the required days (both agents' predicates satisfied)
  ;; - finish after 15 days of activity: day = 16 (starting at 1, 15 increments)
  (:goal
    (and
      (conf9-done)
      (conf15-done)
      (attended9)
      (attended15)
      (= (day) 16)
    )
  )
)