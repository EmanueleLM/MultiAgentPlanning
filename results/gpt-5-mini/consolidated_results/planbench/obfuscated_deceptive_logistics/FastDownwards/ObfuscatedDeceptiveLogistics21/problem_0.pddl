(define (problem next-link-problem)
  (:domain next-link-domain)
  (:objects
    object_11 object_12 object_7 object_5 - object
  )
  (:init
    ; No object has a next link initially.
    ; (assigned ...) facts are absent, so preconditions permitting assignment hold.
  )
  (:goal (and
    (next object_11 object_7)
    (next object_12 object_5)
  ))
)