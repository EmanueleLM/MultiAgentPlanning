(define (problem vault-cooperative-problem)
  (:domain vault-cooperative)

  (:objects
    A   - agent
    B   - agent
    V   - vault
    K   - key
    O   - object)

  (:init
    (big-robot A)
    (has-key A K)
    (closed V)
    (entrance-small V)
    (object-in-vault O V))

  (:goal
    (has-obj B O)))