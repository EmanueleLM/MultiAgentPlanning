(define (problem trip-problem)
  (:domain multiagent-trip)
  (:objects
    berlin frankfurt bucharest - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    ;; linear ordering of days (11-day trip)
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)

    ;; direct flight network (only direct flights allowed)
    (flight berlin frankfurt) (flight frankfurt berlin)
    (flight frankfurt bucharest) (flight bucharest frankfurt)
    ;; Note: no direct flight berlin <-> bucharest (as provided by flight_network agent)

    ;; Traveler starts in Berlin on day 1 (attends annual show there from day1..day7)
    (at berlin d1)
    (visited berlin)
    (occupied d1)
  )

  ;; Goals:
  ;; - The traveler must visit all three cities at some point.
  ;; - Each of the 11 days must have the traveler's location assigned (trip length = 11 days).
  ;; - The traveler must be in Berlin for days 1 through 7 to attend the annual show.
  (:goal
    (and
      (visited berlin) (visited frankfurt) (visited bucharest)

      (occupied d1) (occupied d2) (occupied d3) (occupied d4) (occupied d5)
      (occupied d6) (occupied d7) (occupied d8) (occupied d9) (occupied d10) (occupied d11)

      ;; Berlin show attendance required days 1..7
      (at berlin d1) (at berlin d2) (at berlin d3) (at berlin d4)
      (at berlin d5) (at berlin d6) (at berlin d7)
    )
  )
)