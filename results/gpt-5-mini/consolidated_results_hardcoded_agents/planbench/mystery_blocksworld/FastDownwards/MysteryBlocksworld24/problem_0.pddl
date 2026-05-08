(define (problem orchestrated-problem)
  (:domain orchestrated)

  (:objects
    attacker feaster - agent
    a b c - thing
  )

  (:init
    ;; Public initial state: the three things exist and the two agents have their roles.
    (exists a)
    (exists b)
    (exists c)

    (is-attacker attacker)
    (is-feaster feaster)

    ;; No (craves ...) facts initially and no phase flags set (attacker-attack-done absent).
  )

  ;; Goal: object a craves object b AND object c craves object a (both must hold).
  (:goal (and
    (craves a b)
    (craves c a)
  ))
)