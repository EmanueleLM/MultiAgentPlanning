(define (problem trip-planning-problem)
  (:domain trip-planning)
  (:objects
    berlin warsaw bucharest - city
  )
  (:init
    (at berlin) ; Starting city, inferred from plan proposal
    (= (current-day) 0) ; Initialize day counter (before Day 1 starts)
    (= (days-in-berlin) 0)
    (= (days-in-warsaw) 0)
    (= (days-in-bucharest) 0)
    (not (friend_met))

    ;; Direct flight connectivity
    (connected berlin warsaw)
    (connected warsaw berlin)
    (connected warsaw bucharest)
    (connected bucharest warsaw)
  )
  (:goal (and
    (= (days-in-berlin) 2)   ; Desired duration for Berlin, adjusted to fit 6-day total
    (= (days-in-warsaw) 2)   ; Desired duration for Warsaw, adjusted to fit 6-day total
    (= (days-in-bucharest) 2) ; Mandatory duration for Bucharest
    (friend_met)             ; Friend meeting constraint
    (= (current-day) 6)      ; Total trip duration must be 6 days
  ))
)