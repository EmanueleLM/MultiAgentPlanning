; Problem: itinerary-15
; This problem encodes a 15-day itinerary that must visit Split, Manchester, and Riga
; using only direct flights. It assumes the traveler starts in Split on d1 and that
; direct flights exist pairwise among the three cities. The plan must allocate every day
; from d1..d15 (one city per day) by using stay or fly actions that consume the next day.

(define (problem itinerary-15)
  (:domain travel-itinerary)
  (:objects
    split manchester riga - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )

  (:init
    ; successor (next-day) relation
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)
    (next d11 d12) (next d12 d13) (next d13 d14) (next d14 d15)

    ; Direct-flight network (assumed pairwise direct flights among the three cities)
    (direct split manchester) (direct manchester split)
    (direct split riga)      (direct riga split)
    (direct manchester riga) (direct riga manchester)

    ; Initial location and day allocation
    (at split d1)
    (assigned d1)

    ; Initially no city is marked visited explicitly; visitation is set by actions.
  )

  ; Goals:
  ; - Every day d1..d15 must be allocated (i.e., the itinerary has a city assigned each day).
  ; - The itinerary must include visits to Split, Manchester, and Riga at least once.
  (:goal (and
    (assigned d1)  (assigned d2)  (assigned d3)  (assigned d4)  (assigned d5)
    (assigned d6)  (assigned d7)  (assigned d8)  (assigned d9)  (assigned d10)
    (assigned d11) (assigned d12) (assigned d13) (assigned d14) (assigned d15)

    (visited split) (visited manchester) (visited riga)
  ))
)