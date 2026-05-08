(define (problem orchestrator-problem)
  (:domain orchestrator-domain)
  (:objects
    object_a object_b object_c object_d - agent
  )
  (:init
    ;; initial cravings and global harmony
    (craves object_b object_d)
    (harmony)

    ;; initial planets (planet facts are unary on the same object identifiers)
    (planet object_a)
    (planet object_c)
    (planet object_d)

    ;; initial provinces (unary)
    (province object_a)
    (province object_b)
    (province object_c)
  )
  (:goal (and
    (craves object_b object_c)
    (craves object_d object_a)
  ))
)