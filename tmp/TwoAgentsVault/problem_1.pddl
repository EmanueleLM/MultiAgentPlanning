(define (problem multi-open-and-grab)
  (:domain multi-agent-vault)
  (:objects
    key_holder r1 - agent
    vault1 - vault
    e1 - entrance
    key1 - key
    obj1 - object
  )

  (:init
    (vault vault1)
    (vault-closed vault1)
    (requires-key vault1)
    (entrance e1)
    (entrance-small e1)
    (entrance-of e1 vault1)
    (big key_holder)
    (small r1)
    (have key_holder key1)
    (object obj1)
    (object-in obj1 vault1)
  )

  (:goal (and
    (vault-open vault1)
    (has-object r1 obj1)
  ))
)