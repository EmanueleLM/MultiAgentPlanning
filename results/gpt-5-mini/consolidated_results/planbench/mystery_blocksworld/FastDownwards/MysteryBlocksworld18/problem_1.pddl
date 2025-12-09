(define (problem make-cravings)
  (:domain craving-domain)
  (:objects a b c d - object)

  (:init
    ;; Initial cravings
    (craves b d)
    (craves c a)

    ;; Global state
    (harmony)

    ;; Planet facts
    (planet a)
    (planet d)

    ;; Province facts
    (province b)
    (province c)
  )

  (:goal
    (and
      (craves b a)  ;; b craves a
      (craves c d)  ;; c craves d
      (craves d b)  ;; d craves b
    )
  )
)