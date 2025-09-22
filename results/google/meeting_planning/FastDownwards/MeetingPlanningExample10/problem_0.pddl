(define (problem meet-james-combined-problem)
  (:domain meet-james-combined)

  (:objects
    visitor james - person
    golden_gate_park marina_district - location
  )

  (:init
    ;; Travel times (minutes)
    (= (travel-time golden_gate_park marina_district) 16)
    (= (travel-time marina_district golden_gate_park) 18)

    ;; Current time knowledge (optional)
    (= (current-time) 540)

    ;; Initial locations
    (at visitor golden_gate_park)
    (at james marina_district)

    ;; James availability window at Marina District (agent2 knowledge)
    (available-window james marina_district)
  )

  ;; Goal: ensure visitor meets James for at least 15 minutes.
  (:goal (met visitor james))

  ;; Optimize: minimize overall plan makespan / total time (FastDownward supports :metric)
  (:metric minimize (total-time))
)