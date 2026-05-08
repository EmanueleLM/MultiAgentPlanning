(define (problem trip-ber-waw-buc-6days)
  (:domain trip-planning)

  (:objects
    berlin warsaw bucharest - city
    d1 d2 d3 d4 d5 d6 - day
  )

  (:init
    ; day objects
    (day d1) (day d2) (day d3) (day d4) (day d5) (day d6)

    ; successor ordering
    (day-succ d1 d2)
    (day-succ d2 d3)
    (day-succ d3 d4)
    (day-succ d4 d5)
    (day-succ d5 d6)

    ; direct-flight connectivity (undirected edges are modeled by both directions)
    (direct berlin warsaw)
    (direct warsaw berlin)
    (direct warsaw bucharest)
    (direct bucharest warsaw)

    ; initial location: traveler is in Berlin on day 1 (starting assumption)
    (assigned d1)
    (in berlin d1)
  )

  ; Goals:
  ; - Assign a city for each of the 6 days (explicitly enumerated).
  ; - Enforce the hard requirement: stay in Bucharest for 2 days that cover day 5 and day 6
  ;   (this satisfies the "meet a friend in Bucharest between day 5 and day 6" constraint
  ;    by requiring presence on both day 5 and day 6).
  (:goal
    (and
      ; days 1-2: Berlin (start + one stay)
      (in berlin d1)
      (in berlin d2)

      ; days 3-4: Warsaw
      (in warsaw d3)
      (in warsaw d4)

      ; days 5-6: Bucharest (two full days in Bucharest, meeting window enforced)
      (in bucharest d5)
      (in bucharest d6)
    )
  )
)