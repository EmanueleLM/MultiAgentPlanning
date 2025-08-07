(define (problem vault-problem)
  (:domain vault-domain)

  (:objects
    agent-a agent-b - agent
    vault - location
    outside - location
    obj1 - object
  )

  (:init
    (closed vault)
    (has-key agent-a)
    (big agent-a)
    (small agent-b)
    (at agent-a outside)
    (at agent-b outside)
    (in obj1 vault)
  )

  (:goal
    (and
      (open vault)
      (has-object agent-b)
    )
  )
)