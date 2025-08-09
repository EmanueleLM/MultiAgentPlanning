(define (problem vault-problem)
  (:domain vault-domain)
  (:objects a b - agent)
  (:init
    (has-key a)
    (vault-closed)
    (can-enter b))
  (:goal
    (and
      vault-open
      (has-object b))))