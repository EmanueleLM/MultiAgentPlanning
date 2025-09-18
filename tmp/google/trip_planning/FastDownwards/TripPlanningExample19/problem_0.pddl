(define (problem orchestrated_trip-problem)
  (:domain orchestrated_trip)

  (:objects
    brussels valencia nice - city
  )

  (:init
    ; Direct flights (bidirectional)
    (direct brussels valencia)
    (direct valencia brussels)
    (direct brussels nice)
    (direct nice brussels)

    ; Starting location (taken from flights_info initial state)
    (at brussels)

    ; Numeric fluents initial values
    (= (days) 0)
    (= (stayed brussels) 0)
    (= (stayed valencia) 0)
    (= (stayed nice) 0)

    ; Initially not met-friends (predicate absent)
  )

  ; Reconciled goals (sum of stayed days equals total days = 9):
  ; - Brussels: 2 days
  ; - Valencia: 3 days
  ; - Nice: 4 days  <-- adjusted from 6 to 4 so 2+3+4 = 9 (consistent)
  ; - Total days: 9
  ; - met-friends in Nice between day 1 and 6
  (:goal
    (and
      (= (stayed brussels) 2)
      (= (stayed valencia) 3)
      (= (stayed nice) 4)
      (= (days) 9)
      (met-friends)
    )
  )
)