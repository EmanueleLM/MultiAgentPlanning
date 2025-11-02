; TripPlanningExample25 problem
; Notes / adjustments:
; - Original requested stays: Valencia 5 + Split 7 + Lyon 6 = 18 days, which exceeds the total trip length 16.
; - To satisfy the fixed 16-day trip and the non-negotiable Split requirement (must be in Split days 10..16 inclusive = 7 days),
;   we reduce Lyon's stay from 6 to 4 days. Final stays: Valencia 5, Lyon 4, Split 7 (total 16).
; - The planned (feasible) itinerary consistent with these constraints is:
;   Days 1-5 Valencia, Days 6-9 Lyon, Days 10-16 Split.
; - Flights allowed only on direct edges: Valencia <-> Lyon and Lyon <-> Split. No direct Valencia <-> Split.

(define (problem TripPlanningExample25-problem)
  (:domain trip-planning)

  (:objects
    valencia lyon split - city

    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day

    ; Valencia slots (5)
    vslot1 vslot2 vslot3 vslot4 vslot5 - slot
    ; Lyon slots (4) -- reduced from 6 to 4 to fit 16 days
    lslot1 lslot2 lslot3 lslot4 - slot
    ; Split slots (7)
    sslot1 sslot2 sslot3 sslot4 sslot5 sslot6 sslot7 - slot
  )

  (:init
    ; day ordering
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)
    (next d9 d10) (next d10 d11) (next d11 d12) (next d12 d13)
    (next d13 d14) (next d14 d15) (next d15 d16)

    ; flight graph (direct flights only)
    (flight valencia lyon) (flight lyon valencia)
    (flight lyon split) (flight split lyon)

    ; slots bound to cities
    (slot vslot1 valencia) (slot vslot2 valencia) (slot vslot3 valencia)
    (slot vslot4 valencia) (slot vslot5 valencia)

    (slot lslot1 lyon) (slot lslot2 lyon) (slot lslot3 lyon) (slot lslot4 lyon)

    (slot sslot1 split) (slot sslot2 split) (slot sslot3 split) (slot sslot4 split)
    (slot sslot5 split) (slot sslot6 split) (slot sslot7 split)

    ; slot-free indicates an available "day slot" for that city.
    ; One Valencia slot is pre-consumed by the initial assignment to day 1 (d1 = Valencia).
    ; We therefore list slot-free for all slots except vslot1 (vslot1 is already consumed).
    (slot-free vslot2) (slot-free vslot3) (slot-free vslot4) (slot-free vslot5)
    (slot-free lslot1) (slot-free lslot2) (slot-free lslot3) (slot-free lslot4)
    (slot-free sslot1) (slot-free sslot2) (slot-free sslot3) (slot-free sslot4)
    (slot-free sslot5) (slot-free sslot6) (slot-free sslot7)

    ; day assignment state:
    ; day 1 is already assigned to Valencia (consumes vslot1 implicitly).
    (assigned d1 valencia)
    ; remaining days initially free
    (free d2) (free d3) (free d4) (free d5)
    (free d6) (free d7) (free d8) (free d9)
    (free d10) (free d11) (free d12) (free d13)
    (free d14) (free d15) (free d16)
  )

  (:goal
    (and
      ; All days must be assigned (no free days remain).
      (not (free d1)) (not (free d2)) (not (free d3)) (not (free d4))
      (not (free d5)) (not (free d6)) (not (free d7)) (not (free d8))
      (not (free d9)) (not (free d10)) (not (free d11)) (not (free d12))
      (not (free d13)) (not (free d14)) (not (free d15)) (not (free d16))

      ; Mandatory attendance: must be in Split for days 10..16 inclusive.
      (assigned d10 split) (assigned d11 split) (assigned d12 split)
      (assigned d13 split) (assigned d14 split) (assigned d15 split) (assigned d16 split)

      ; All city slots must be consumed exactly (ensures exact day counts per city).
      (not (slot-free vslot1)) (not (slot-free vslot2)) (not (slot-free vslot3))
      (not (slot-free vslot4)) (not (slot-free vslot5))

      (not (slot-free lslot1)) (not (slot-free lslot2)) (not (slot-free lslot3))
      (not (slot-free lslot4))

      (not (slot-free sslot1)) (not (slot-free sslot2)) (not (slot-free sslot3))
      (not (slot-free sslot4)) (not (slot-free sslot5)) (not (slot-free sslot6))
      (not (slot-free sslot7))
    )
  )
)