(define (problem meeting-planning-instance)
  (:domain meeting-planning)
  (:objects
    you james - agent
    ggp marina - location
    t0 t16 t75 t90 t255 t270 - time
  )

  (:init
    (at you ggp t0)
    (travel-edge ggp marina t0 t16)
    (wait-edge t16 t75)
    (wait-edge t75 t255)
    (available-james t75 t90)
    (available-james t255 t270)
  )

  (:goal (met))
)