(define (problem craving-problem)
  (:domain craving-domain)
  (:objects a b c d - creature)
  (:init
    ;; initial existence
    (alive a)
    (alive b)
    (alive c)
    (alive d)

    ;; allowed attack connectivity (only these attack relations exist)
    (can-attack a d)
    (can-attack d b)
  )
  (:goal (and
    (craves a d)
    (craves d b)
  ))
)