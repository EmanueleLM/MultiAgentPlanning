(define (problem vault-problem)
  (:domain vault-domain)

  (:objects
    A B - agent
    key obj - object
  )

  (:init
    (vault-closed)
    (has A key)
    (small B)
    (not (has B key))
    (not (has B obj))
    (not (has A obj))
  )

  (:goal (has B obj))
)