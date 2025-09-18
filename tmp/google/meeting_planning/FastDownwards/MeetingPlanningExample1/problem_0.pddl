(define (problem meet-betty-combined-problem)
  (:domain meet-betty-combined)
  (:objects
    richmond financial - location
  )
  (:init
    ;; You arrive at Richmond District at 09:00 -> 9*60 = 540 minutes
    (= (time) 540)
    (at-you richmond)
    ;; Betty will be at Financial District during her availability window
    (at-betty financial)
  )
  (:goal (met))
)