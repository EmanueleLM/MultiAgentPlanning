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

    (slot-available vslot2) (slot-available vslot3) (slot-available vslot4) (slot-available vslot5)
    (slot-available lslot1) (slot-available lslot2) (slot-available lslot3) (slot-available lslot4)
    (slot-available sslot1) (slot-available sslot2) (slot-available sslot3) (slot-available sslot4)
    (slot-available sslot5) (slot-available sslot6) (slot-available sslot7)

    (assigned d1 valencia)

    (free d2) (free d3) (free d4) (free d5)
    (free d6) (free d7) (free d8) (free d9)
    (free d10) (free d11) (free d12) (free d13)
    (free d14) (free d15) (free d16)
  )

  (:goal
    (and
      (not (free d1)) (not (free d2)) (not (free d3)) (not (free d4))
      (not (free d5)) (not (free d6)) (not (free d7)) (not (free d8))
      (not (free d9)) (not (free d10)) (not (free d11)) (not (free d12))
      (not (free d13)) (not (free d14)) (not (free d15)) (not (free d16))

      (assigned d10 split) (assigned d11 split) (assigned d12 split)
      (assigned d13 split) (assigned d14 split) (assigned d15 split) (assigned d16 split)

      (not (slot-available vslot1)) (not (slot-available vslot2)) (not (slot-available vslot3))
      (not (slot-available vslot4)) (not (slot-available vslot5))

      (not (slot-available lslot1)) (not (slot-available lslot2)) (not (slot-available lslot3))
      (not (slot-available lslot4))

      (not (slot-available sslot1)) (not (slot-available sslot2)) (not (slot-available sslot3))
      (not (slot-available sslot4)) (not (slot-available sslot5)) (not (slot-available sslot6))
      (not (slot-available sslot7))
    )
  )
)