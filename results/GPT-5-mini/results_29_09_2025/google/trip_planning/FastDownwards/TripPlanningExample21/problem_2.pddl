(define (problem trip-10days)
  (:domain trip-planning)
  (:objects
    mykonos vienna venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    ; flights (direct only)
    (flight mykonos vienna)
    (flight vienna mykonos)
    (flight vienna venice)
    (flight venice vienna)

    (is-venice venice)

    ; day ordering
    (prev d1 d2) (prev d2 d3) (prev d3 d4) (prev d4 d5)
    (prev d5 d6) (prev d6 d7) (prev d7 d8) (prev d8 d9)
    (prev d9 d10)

    ; workshop days in Venice (day 5..10)
    (is-workshop-day d5) (is-workshop-day d6) (is-workshop-day d7)
    (is-workshop-day d8) (is-workshop-day d9) (is-workshop-day d10)

    ; initial allocated counters = 0 for each city
    (mykonos_alloc_0)
    (vienna_alloc_0)
    (venice_alloc_0)

    ; initial required preferences (as stated by planners)
    (req-mykonos-2)
    (req-vienna-4)
    (req-venice-6)

    ; initial total-cost
    (= (total-cost) 0)
  )

  (:goal (and
    ; every day must be allocated to some city (achieved via allocated-day)
    (allocated-day d1) (allocated-day d2) (allocated-day d3) (allocated-day d4) (allocated-day d5)
    (allocated-day d6) (allocated-day d7) (allocated-day d8) (allocated-day d9) (allocated-day d10)

    ; Venice workshop must be attended (i.e., be in Venice on at least one workshop day)
    (workshop-attended)

    ; each city's allocation must satisfy its current required level (satisfied-* predicates)
    (satisfied-mykonos)
    (satisfied-vienna)
    (satisfied-venice)
  ))

  (:metric minimize (total-cost))
)