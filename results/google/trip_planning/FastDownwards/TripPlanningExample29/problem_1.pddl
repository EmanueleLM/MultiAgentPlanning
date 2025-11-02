(define (problem tripplanningexample29)
  (:domain eurotrip-10days)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    krk fra dbv - city
    dbv1 dbv2 dbv3 dbv4 dbv5 dbv6 dbv7 krk1 krk2 fra1 - slot
  )
  (:init
    (at d1 dbv)
    (assigned d1)

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

    (slotfor dbv1 dbv)
    (slotfor dbv2 dbv)
    (slotfor dbv3 dbv)
    (slotfor dbv4 dbv)
    (slotfor dbv5 dbv)
    (slotfor dbv6 dbv)
    (slotfor dbv7 dbv)
    (slotfor krk1 krk)
    (slotfor krk2 krk)
    (slotfor fra1 fra)

    ; Quotas available to be consumed by days 2..10:
    (available dbv2)
    (available dbv3)
    (available dbv4)
    (available dbv5)
    (available dbv6)
    (available dbv7)
    (available krk1)
    (available krk2)
    (available fra1)
    ; dbv1 is already implicitly used by day 1 (not marked available)
  )
  (:goal (and
    ; Wedding days must be in Krakow
    (at d9 krk)
    (at d10 krk)

    ; Ensure exactly one assignment per day 2..10
    (assigned d2)
    (assigned d3)
    (assigned d4)
    (assigned d5)
    (assigned d6)
    (assigned d7)
    (assigned d8)
    (assigned d9)
    (assigned d10)

    ; All city-day quotas consumed: 7 DBV, 2 KRK, 1 FRA
    (not (available dbv1))
    (not (available dbv2))
    (not (available dbv3))
    (not (available dbv4))
    (not (available dbv5))
    (not (available dbv6))
    (not (available dbv7))
    (not (available krk1))
    (not (available krk2))
    (not (available fra1))
  ))
)