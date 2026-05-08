(define (problem craving-problem)
  (:domain craving-domain)
  (:objects a b c d - thing)
  (:init
    ;; No additional facts required initially beyond declared objects.
    ;; All required constraints (ordering) are enforced by action preconditions.
  )
  (:goal (and
    (craves c a)
    (craves d b)
  ))
)