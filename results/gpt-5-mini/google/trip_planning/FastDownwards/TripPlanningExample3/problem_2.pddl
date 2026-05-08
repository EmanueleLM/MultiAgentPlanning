(define (problem trip-ber-waw-buc-6days)
  (:domain trip-planning)

  (:objects
    berlin warsaw bucharest - city
    d1 d2 d3 d4 d5 d6 - day
  )

  (:init
    ; explicit day objects
    (day d1) (day d2) (day d3) (day d4) (day d5) (day d6)

    ; strict successor ordering (discrete contiguous time)
    (day-succ d1 d2)
    (day-succ d2 d3)
    (day-succ d3 d4)
    (day-succ d4 d5)
    (day-succ d5 d6)

    ; direct-flight connectivity (modeled as directed edges; symmetric connections are provided both ways)
    (direct berlin warsaw)
    (direct warsaw berlin)
    (direct warsaw bucharest)
    (direct bucharest warsaw)

    ; initial conditions: traveler location fixed for day 1 (starting city explicit to make problem solvable)
    (assigned d1)
    (in berlin d1)
  )

  ; Goals encode mandatory hard requirements as exact day-by-day locations:
  ; - every day 1..6 must have a definitive city assignment (implicitly ensured by (in ...) for each day)
  ; - Bucharest stay requirement: exactly two days in Bucharest, covering day 5 and day 6 (contiguous by successor relation)
  ; The listed city per day enforces contiguous occupancy transitions via actions and prevents oscillation.
  (:goal
    (and
      ; days 1-2: Berlin (start + one additional day)
      (in berlin d1)
      (in berlin d2)

      ; days 3-4: Warsaw
      (in warsaw d3)
      (in warsaw d4)

      ; days 5-6: Bucharest (two full days in Bucharest, meeting window between day 5 and day 6 satisfied)
      (in bucharest d5)
      (in bucharest d6)
    )
  )
)