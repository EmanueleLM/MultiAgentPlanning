(define (problem meet-jeffrey-optimization_classical)
  (:domain sf_meetings_classical)

  (:objects
    traveler jeffrey - agent
    the_castro golden_gate_park - location
  )

  (:init
    (at traveler the_castro)
    (at jeffrey golden_gate_park)
    (meeting-possible)
    (= (total-cost) 0)
    (= (time) 540)  ; start time = 09:00 (540 minutes)
  )

  (:goal (finished))

  (:metric minimize (total-cost))
)