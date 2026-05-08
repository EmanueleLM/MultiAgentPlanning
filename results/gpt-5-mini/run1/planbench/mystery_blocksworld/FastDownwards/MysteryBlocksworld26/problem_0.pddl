(define (problem feast-attack-toggle-problem)
  (:domain feast-attack-toggle)
  (:objects
    a b c d - object
  )

  (:init
    ;; Initial "crave" relations (some goal craves are seeded so the remaining goal can be achieved)
    (craves a b)
    (craves c a)
    (craves d c)

    ;; Initial Province holdings (non-exclusive variant: multiple Province facts allowed)
    (province a)
    (province c)
    (province d)

    ;; Some Planet facts (present to allow Attack to target planets if used)
    (planet c)
    (planet d)

    ;; Global token state: Harmony initially true, Pain false (omitted)
    (harmony)
    ;; (pain) is intentionally not present in the initial state (closed-world)
  )

  ;; Goal: enforce final Craves relations exactly as requested.
  (:goal (and
    (craves b d)
    (craves c a)
    (craves d c)
  ))
)