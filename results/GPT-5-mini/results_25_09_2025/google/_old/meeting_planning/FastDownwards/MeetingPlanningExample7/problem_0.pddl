(define (problem combined-meet-john-problem)
  (:domain combined-meet-john)
  (:objects
    richmond-district north-beach - location
  )
  (:init
    ;; Start time: 09:00 AM -> 9*60 = 540 minutes
    (= (current-time) 540)

    ;; John's availability: 15:15 (915) to 17:15 (1035)
    (= (john-available-start) 915)
    (= (john-available-end) 1035)

    ;; Initial locations for both agents (they start in Richmond District)
    (at-you richmond-district)
    (at richmond-district)
  )
  (:goal (met))
  (:metric minimize (current-time))
)