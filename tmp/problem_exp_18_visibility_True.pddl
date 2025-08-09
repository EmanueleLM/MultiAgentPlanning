```pddl
(define (problem vault-problem)
  (:domain vault-domain)

  (:objects
    agentA agentB - agent
    vault key object - thing
  )

  (:init
    (has agentA key)
    (inside-thing object)
    (not (open vault))
    (small agentB)
    (cannot-enter agentA)
    (not (inside agentA))
    (not (inside agentB))
  )

  (:goal
    (and
      (open vault)
      (has agentB object)
    )
  )
)
```