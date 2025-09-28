(define (problem trip-10days)
  (:domain trip-planning)
  (:objects
    mykonos vienna venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    (flight mykonos vienna)
    (flight vienna mykonos)
    (flight vienna venice)
    (flight venice vienna)

    (is-venice venice)

    (prev d1 d2) (prev d2 d3) (prev d3 d4) (prev d4 d5)
    (prev d5 d6) (prev d6 d7) (prev d7 d8) (prev d8 d9)
    (prev d9 d10)

    (is-workshop-day d5) (is-workshop-day d6) (is-workshop-day d7)
    (is-workshop-day d8) (is-workshop-day d9) (is-workshop-day d10)

    (= (allocated-days mykonos) 0)
    (= (allocated-days vienna) 0)
    (= (allocated-days venice) 0)
    (= (total-allocated) 0)

    (= (required-days mykonos) 2)
    (= (required-days vienna) 4)
    (= (required-days venice) 6)
  )

  (:goal (and
    (= (total-allocated) 10)
    (workshop-attended)
    (>= (allocated-days mykonos) (required-days mykonos))
    (>= (allocated-days vienna) (required-days vienna))
    (>= (allocated-days venice) (required-days venice))
  ))
)