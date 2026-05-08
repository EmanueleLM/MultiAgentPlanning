(define (problem cravings-problem)
  (:domain cravings)
  ;; Problem modeling notes:
  ;; - Objects: a,b,c,d are the domain objects referenced by required-step bindings.
  ;; - Steps: s1, s2, s3 are the three ordered phases; send is a terminal step marker used to accept the final step advancement.
  ;; - Initial state sets s1 as the current step and encodes the required (x craves y) mapping to enforce the required order:
  ;;     s1 -> (a craves c)
  ;;     s2 -> (b craves a)
  ;;     s3 -> (d craves b)
  ;; - Goal requires all three craves facts and that each step has been completed (step-done s1 s2 s3).
  (:objects
    a b c d - object
    s1 s2 s3 send - step
  )

  (:init
    ;; step declarations
    (step s1)
    (step s2)
    (step s3)
    (step send)

    ;; step ordering (explicit chain)
    (step-next s1 s2)
    (step-next s2 s3)
    (step-next s3 send)

    ;; start at s1
    (step-current s1)

    ;; required-step bindings enforce which pair must be created in which step
    (required-step a c s1)
    (required-step b a s2)
    (required-step d b s3)
  )

  (:goal
    (and
      (craves a c)
      (craves b a)
      (craves d b)
      ;; ensure each step was completed and the enforced order was followed
      (step-done s1)
      (step-done s2)
      (step-done s3)
    )
  )
)