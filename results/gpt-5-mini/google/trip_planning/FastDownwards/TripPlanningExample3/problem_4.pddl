(define (problem trip-ber-waw-buc-6days)
  (:domain trip-planning)

  (:objects
    berlin warsaw bucharest - city
    d1 d2 d3 d4 d5 d6 - day
  )

  (:init
    ;; days
    (is_day d1) (is_day d2) (is_day d3) (is_day d4) (is_day d5) (is_day d6)

    ;; adjacency of days
    (day_next d1 d2)
    (day_next d2 d3)
    (day_next d3 d4)
    (day_next d4 d5)
    (day_next d5 d6)

    ;; direct-flight connectivity (explicit, undirected edges given both directions)
    (direct berlin warsaw)
    (direct warsaw berlin)
    (direct warsaw bucharest)
    (direct bucharest warsaw)

    ;; start the trip in berlin on day 1 to ensure a contiguous, feasible assignment
    (in berlin d1)
    (assigned d1)
  )

  ;; Goals chosen to be feasible given the hard requirement to stay in Bucharest for 2 days
  ;; and to meet the friend between day 5 and day 6 (here interpreted as being in Bucharest on d5 and d6).
  ;; The travel legs respect only direct flights: berlin->warsaw->bucharest.
  (:goal
    (and
      (in berlin d1)
      (in berlin d2)

      (in warsaw d3)
      (in warsaw d4)

      (in bucharest d5)
      (in bucharest d6)
    )
  )
)