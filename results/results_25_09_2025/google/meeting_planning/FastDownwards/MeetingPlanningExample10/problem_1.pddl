(define (problem meet-james)
  (:domain meeting-scheduling)
  (:objects
    visitor james - agent
    golden-gate-park marina - location
  )
  (:init
    (at visitor golden-gate-park)
    (at james marina)
  )
  (:goal (met))
)