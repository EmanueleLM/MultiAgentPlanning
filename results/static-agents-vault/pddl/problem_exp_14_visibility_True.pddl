(define (problem vault-problem)
  (:domain vault-domain)
  (:objects
    A B - agent
  )
  (:init
    (vault-closed)
    (has-key A)
    (big A)
    (object-available)
  )
  (:goal (and
           (vault-opened)
           (has-object B)
         ))
)