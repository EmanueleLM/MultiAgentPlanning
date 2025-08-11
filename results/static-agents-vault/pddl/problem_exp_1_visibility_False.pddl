(define (problem vault-problem)
  (:domain vault-domain)

  (:objects
    robotA robotB - agent
    vault1 - vault
    key1 - key
    object1 - object
  )

  (:init
    (closed vault1)
    (has-key robotA key1)
    (big robotA)
    (small robotB)
  )

  (:goal
    (and
      (not (closed vault1))
      (has robotB object1)
    )
  )
)