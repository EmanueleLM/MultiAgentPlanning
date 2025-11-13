(define (problem trip-berlin-warsaw-bucharest)
  (:domain trip-domain)
  (:objects
    berlin warsaw bucharest - city
    d1 d2 d3 d4 d5 d6 - day
  )
  (:init
    ;; starting conditions: start in Berlin on day d1
    (cur d1)
    (at berlin)

    ;; day sequence (contiguity)
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)

    ;; direct-flight adjacency (undirected pairs per validated graph)
    (direct berlin warsaw)
    (direct warsaw berlin)
    (direct warsaw bucharest)
    (direct bucharest warsaw)

    ;; initialize total-cost
    (= (total-cost) 0)
  )

  ;; Hard goals:
  ;; - Be in Bucharest and book day d5
  ;; - Be in Bucharest and book day d6
  ;; Reaching booked d5 and booked d6 necessarily requires booking days d1..d4 sequentially under the domain actions.
  (:goal (and
    (booked d5 bucharest)
    (booked d6 bucharest)
  ))

  ;; Minimize total action cost (each action increases total-cost by 1)
  (:metric minimize (total-cost))
)