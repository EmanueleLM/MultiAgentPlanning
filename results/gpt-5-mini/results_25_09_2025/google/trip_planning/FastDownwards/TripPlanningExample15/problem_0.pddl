(define (problem trip-11-days)
  (:domain multiagent-trip)

  (:objects
    berlin porto krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    n6 n5 n2 - object
  )

  (:init
    ; direct flights (bidirectional where provided)
    (flight berlin porto)
    (flight porto berlin)
    (flight berlin krakow)
    (flight krakow berlin)

    ; day succession chain for an 11-day trip
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)

    ; initial location and first day present
    (at berlin d1)
    (present d1)
    (visited berlin)

    ; agent-declared desired stays (informational; not enforced as hard goals here)
    (desired-stay berlin n6)
    (desired-stay porto n2)
    (desired-stay krakow n5)

    ; wedding information (Porto between day 10 and day 11 represented as event at d10)
    (wedding porto d10)
  )

  (:goal (and
    ; visit every city at least once
    (visited berlin)
    (visited porto)
    (visited krakow)

    ; ensure the wedding attendance: be in Porto on day 10
    (at porto d10)

    ; ensure all 11 days are part of the itinerary (forces actions to advance day-by-day)
    (present d1) (present d2) (present d3) (present d4) (present d5)
    (present d6) (present d7) (present d8) (present d9) (present d10) (present d11)
  ))
)