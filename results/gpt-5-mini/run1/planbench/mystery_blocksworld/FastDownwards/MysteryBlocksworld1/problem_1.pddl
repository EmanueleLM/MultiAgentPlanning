(define (problem mysteryblocksworld1)
  (:domain mystery_blocksworld_domain)
  (:objects a b c d - obj)
  (:init
    ;; initial craving relations
    (craves b c)
    (craves c d)
    (craves d a)
    ;; global harmony initially present
    (harmony)
    ;; initial planet and province facts
    (planet a)
    (province b)
  )
  (:goal (and
    (craves a c)
    (craves d a)
  ))
)