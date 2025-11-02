(define (problem TripPlanningExample25-problem)
  (:domain trip-planning)

  (:objects
    valencia lyon split - city

    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day

    vslot1 vslot2 vslot3 vslot4 vslot5 - slot
    lslot1 lslot2 lslot3 lslot4 - slot
    sslot1 sslot2 sslot3 sslot4 sslot5 sslot6 sslot7 - slot
  )

  (:init
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)
    (next d9 d10) (next d10 d11) (next d11 d12) (next d12 d13)
    (next d13 d14) (next d14 d15) (next d15 d16)

    (flight valencia lyon) (flight lyon valencia)
    (flight lyon split) (flight split lyon)

    (has-slot vslot1 valencia) (has-slot vslot2 valencia) (has-slot vslot3 valencia)
    (has-slot vslot4 valencia) (has-slot vslot5 valencia)

    (has-slot lslot1 lyon) (has-slot lslot2 lyon) (has-slot lslot3 lyon) (has-slot lslot4 lyon)

    (has-slot sslot1 split) (has-slot sslot2 split) (has-slot sslot3 split) (has-slot sslot4 split)
    (has-slot sslot5 split) (has-slot sslot6 split) (has-slot sslot7 split)

    (unavailable vslot1)

    (assigned d1 valencia)
    (occupied d1)
  )

  (:goal
    (and
      (occupied d1) (occupied d2) (occupied d3) (occupied d4)
      (occupied d5) (occupied d6) (occupied d7) (occupied d8)
      (occupied d9) (occupied d10) (occupied d11) (occupied d12)
      (occupied d13) (occupied d14) (occupied d15) (occupied d16)

      (assigned d10 split) (assigned d11 split) (assigned d12 split)
      (assigned d13 split) (assigned d14 split) (assigned d15 split) (assigned d16 split)

      (unavailable vslot1) (unavailable vslot2) (unavailable vslot3)
      (unavailable vslot4) (unavailable vslot5)

      (unavailable lslot1) (unavailable lslot2) (unavailable lslot3)
      (unavailable lslot4)

      (unavailable sslot1) (unavailable sslot2) (unavailable sslot3)
      (unavailable sslot4) (unavailable sslot5) (unavailable sslot6)
      (unavailable sslot7)
    )
  )
)