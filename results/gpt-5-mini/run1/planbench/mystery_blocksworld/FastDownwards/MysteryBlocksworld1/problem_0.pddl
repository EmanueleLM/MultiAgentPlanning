(define (problem craving-problem)
  (:domain craving-domain)
  (:objects
    a c d - obj
  )
  (:init
    ;; No initial craving facts (explicitly none). If any craving were true initially,
    ;; it would be listed here; we leave initial state empty of craves facts.
  )
  (:goal (and
    (craves a c)
    (craves d a)
  ))
)