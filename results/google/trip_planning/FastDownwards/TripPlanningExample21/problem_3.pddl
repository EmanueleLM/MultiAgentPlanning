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

    (mykonos_alloc_0)
    (vienna_alloc_0)
    (venice_alloc_0)

    (req-mykonos-2)
    (req-vienna-4)
    (req-venice-6)
  )

  (:goal (and
    (allocated-day d1) (allocated-day d2) (allocated-day d3) (allocated-day d4) (allocated-day d5)
    (allocated-day d6) (allocated-day d7) (allocated-day d8) (allocated-day d9) (allocated-day d10)

    (workshop-attended)

    (satisfied-mykonos)
    (satisfied-vienna)
    (satisfied-venice)
  ))