(define (problem crave-problem)
  (:domain crave-domain)
  (:objects
    a b d - obj
    orchestrator auditor - agent
  )
  (:init
    ;; Objects present in the world
    (exists a)
    (exists b)
    (exists d)

    ;; Agent roles (static)
    (is-orchestrator orchestrator)
    (is-auditor auditor)
  )
  ;; Goal: object b craves object d and object d craves object a.
  (:goal (and
           (craves b d)
           (craves d a)
         )
  )
)