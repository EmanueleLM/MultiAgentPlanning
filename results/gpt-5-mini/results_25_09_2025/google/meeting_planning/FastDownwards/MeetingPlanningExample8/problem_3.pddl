(define (problem meet-stephanie-problem)
  (:domain multi-agent-meeting)
  (:requirements :typing :action-costs)
  (:objects
    traveler stephanie - agent
    chinatown marina - location
    t0 t12 t16 t117 t360 - time
  )
  (:init
    (at traveler chinatown t0)
    (at stephanie marina t0)
    (= (total-cost) 0)
    (travel-duration-traveler t0 t12)
    (travel-duration-stephanie t0 t16)
    (meeting-duration t12 t117)
    (available-interval stephanie t0 t360)
    (available-interval stephanie t12 t117)
  )
  (:goal (met))
  (:metric minimize (total-cost))
)