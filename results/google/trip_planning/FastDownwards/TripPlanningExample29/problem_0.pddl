(define (problem plan-krk-dbv-fra-10)
  (:domain trip-10days)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    krk fra dbv - city
  )
  (:init
    (at d1 dbv)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)

    (flight fra krk)
    (flight krk fra)
    (flight fra dbv)
    (flight dbv fra)
  )
  (:goal (and
    ; Enforce the exact day-by-day city assignments (which also enforce counts)
    (at d1 dbv)
    (at d2 dbv)
    (at d3 dbv)
    (at d4 dbv)
    (at d5 dbv)
    (at d6 dbv)
    (at d7 dbv)
    (at d8 fra)
    (at d9 krk)
    (at d10 krk)

    ; Ensure exactly one transition per day (2..10) was made
    (assigned d2)
    (assigned d3)
    (assigned d4)
    (assigned d5)
    (assigned d6)
    (assigned d7)
    (assigned d8)
    (assigned d9)
    (assigned d10)
  ))
)