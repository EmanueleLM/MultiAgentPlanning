(define (problem vault-coop-prob)
  (:domain vault-coop-domain)

  (:objects
    robotA - robot
    robotB - robot
    vaultV - vault
    keyK - key
    objectO - object
    entrance - location
    vaultroom - location
  )

  (:init
    (big robotA)
    (small robotB)
    (closed vaultV)
    (entrance-small vaultV)
    (has-key robotA keyK)
    (at robotA entrance)
    (at robotB entrance)
    (object-in objectO vaultV)
    (not (open vaultV))
    (not (grabbed objectO))
  )

  (:goal
    (and
      (open vaultV)
      (grabbed objectO)
    )
  )
)