(define (problem trip-11-days)
  (:domain travel-multicity)
  (:objects
    amsterdam vilnius bucharest - city
  )
  (:init
    ;; Initial location and counters
    (at amsterdam)
    (= (days) 0)
    (= (total-days) 11)

    ;; Remaining one-day stays per city — adjusted allocation to fit 11 days:
    ;; Amsterdam 5, Vilnius 2, Bucharest 4 (minimal reduction from requested 6 -> 4)
    (= (rem-amsterdam) 5)
    (= (rem-vilnius) 2)
    (= (rem-bucharest) 4)
    ;; 'met' is absent initially (not met)
  )
  (:goal (and
    ;; All one-day stays completed
    (= (rem-amsterdam) 0)
    (= (rem-vilnius) 0)
    (= (rem-bucharest) 0)
    ;; Meeting in Bucharest must have occurred within the 6..11 day window
    (met)
    ;; Total trip days must equal the required target
    (= (days) 11)
  ))
)