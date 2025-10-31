(define (problem combined-meet-john-problem)
  (:domain combined-meet-john)
  (:objects
    richmond_district north_beach - location
    t540 t557 t915 t990 - time
  )

  (:init
    (= (total-cost) 0)
    (time_now t540)
    (at_you richmond_district)
    (at_john richmond_district)

    (succ17 t540 t557)
    (succ_jump t557 t915)
    (succ75 t915 t990)

    (john_start_ok t915)
  )

  (:goal (met))

  (:metric minimize (total-cost))
)