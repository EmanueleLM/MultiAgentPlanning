(define (problem vault-integrated-problem)
  (:domain vault-integrated)
  (:objects
    A B - agent
    vault - vault
    key object - thing
    outside vault - location)
  (:init
    (big A)
    (small B)
    (at A outside)
    (at B outside)
    (has-key A key)
    (vault-closed)
    (can-enter B vault))
  (:goal (and
           (vault-open)
           (object-grabbed-by B))))