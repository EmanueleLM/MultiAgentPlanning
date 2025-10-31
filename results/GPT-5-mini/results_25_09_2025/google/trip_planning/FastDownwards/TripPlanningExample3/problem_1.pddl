(define (problem trip-problem)
  (:domain trip-domain)

  (:objects
    berlin warsaw bucharest - city
    d1 d2 d3 d4 d5 d6 - day
  )

  (:init
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)

    (first d1)

    (direct berlin warsaw)
    (direct warsaw berlin)
    (direct warsaw bucharest)
    (direct bucharest warsaw)

    (meet_window d5)
    (meet_window d6)

    (is_meet_city bucharest)

    (unstarted)
  )

  (:goal (and
    (visited berlin)
    (visited warsaw)
    (visited bucharest)
    (met_friend)
    (assigned d1)
    (assigned d2)
    (assigned d3)
    (assigned d4)
    (assigned d5)
    (assigned d6)
    (at bucharest d5)
    (at bucharest d6)
  ))
)