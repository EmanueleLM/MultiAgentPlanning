(define (problem combined-vault-problem)
  (:domain combined-vault)
  (:objects
    agent-a agent-b   - agent
    key-1          - key
    obj-1          - object
    outside vault  - location
  )
  (:init
    (at agent-a outside)
    (at agent-b outside)
    (has-key agent-a)
    (vault-closed)
    (object-in-vault obj-1)
    (small agent-b)
  )
  (:goal
    (and
      (open-vault)
      (has-object obj-1)
    )
  )
)