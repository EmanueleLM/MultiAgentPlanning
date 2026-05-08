(define (problem make-cravings)
  (:domain craving-domain)
  (:objects a b c d - object)

  ;; Minimal initial state: all original initial facts are produced by the parameterized initialize action.
  (:init
  )

  (:goal
    (and
      (craves b a)
      (craves c d)
      (craves d b)
    )
  )
)