(define (problem combined-meet-john-problem)
  (:domain combined-meet-john)
  (:objects
    richmond-district north-beach - location
    t540 t557 t915 t990 - time
  )

  (:init
    (time-now t540)
    (at-you richmond-district)
    (at-john richmond-district)

    (succ17 t540 t557)
    (succ-jump t557 t915)
    (succ75 t915 t990)

    (john-start-ok t915)
  )

  (:goal (met))

  (:metric minimize (total-cost))
)