(define (problem berlin-warsaw-bucharest-trip)
  (:domain trip-domain)
  (:objects
    berlin warsaw bucharest - city
    d1 d2 d3 d4 d5 d6 - day
  )
  (:init
    ;; starting conditions
    (cur d1)
    (at berlin)

    ;; day sequence (contiguity)
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)

    ;; direct-flight adjacency (undirected pairs)
    (direct berlin warsaw)
    (direct warsaw berlin)
    (direct warsaw bucharest)
    (direct bucharest warsaw)

    ;; initialize total-cost
    (= (total-cost) 0)
  )

  ;; Hard goal: enforce audited finalized plan exactly (every day booked to the specified city)
  (:goal (and
    (booked d1 berlin)
    (booked d2 berlin)
    (booked d3 warsaw)
    (booked d4 warsaw)
    (booked d5 bucharest)
    (booked d6 bucharest)
  ))

  ;; Minimize total action cost (each action increases total-cost by 1)
  (:metric minimize (total-cost))
)