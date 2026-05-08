(define (problem orchestrated-problem)
  (:domain orchestrated)
  (:objects
    a b c d - agent
    p1 - province
    pl1 - planet
  )
  (:init
    ;; province and planet topology
    (on-planet p1 pl1)
    ;; initial locations: all agents in same province p1
    (in-province a p1)
    (in-province b p1)
    (in-province c p1)
    (in-province d p1)
    ;; all agents start alive and not subdued, not in pain, no harmony or cravings initially
    (alive a)
    (alive b)
    (alive c)
    (alive d)
    ;; explicitly ensure no unwanted predicates are true initially by omission:
    ;; (subdued ?), (pain ?), (harmony ?), (craves ?), (ready-for-succumb ?) are all false initially
  )
  (:goal (and
    (craves a c)
    (craves d a)
  ))
)