(define (problem meet-margaret-problem)
  (:domain meetings-domain)
  (:objects
    traveler margaret - agent
    Marina-District Pacific-Heights - location
    t540 t1140 t1155 t1170 t1185 - timepoint
  )
  (:init
    (at traveler Marina-District)
    (time t540)
    (= (total-cost) 0)
  )
  (:goal (and (met-or-penalized)))
  (:metric minimize (total-cost))
)