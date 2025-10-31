(define (problem travel-problem-with-slots)
  (:domain travel-planning-with-slots)
  (:objects
    ; cities
    florence barcelona helsinki - city

    ; days
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day

    ; slots (tokens) to enforce number of days allocated to each city for days 2..14
    ; We allocate tokens so that:
    ;  - Barcelona total days = 5 (day1 already at Barcelona), so we provide 4 Barcelona tokens for days 2..14
    ;  - Helsinki total days = 3 -> 3 Helsinki tokens
    ;  - Florence total days = 6 -> 6 Florence tokens
    bslot1 bslot2 bslot3 bslot4 - slot
    hslot1 hslot2 hslot3 - slot
    fslot1 fslot2 fslot3 fslot4 fslot5 fslot6 - slot
  )
  (:init
    ;; day objects
    (day d1) (day d2) (day d3) (day d4) (day d5) (day d6) (day d7) (day d8)
    (day d9) (day d10) (day d11) (day d12) (day d13) (day d14)

    ;; successor (discrete horizon)
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6) (next d6 d7)
    (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11) (next d11 d12)
    (next d12 d13) (next d13 d14)

    ;; Start state: traveler begins in Barcelona on day 1
    (current d1)
    (at barcelona d1)
    (covered d1)

    ;; Meeting allowed days: 9..14
    (allowed-meet-day d9) (allowed-meet-day d10) (allowed-meet-day d11)
    (allowed-meet-day d12) (allowed-meet-day d13) (allowed-meet-day d14)

    ;; Slot-to-city mapping: provide tokens for days 2..14 corresponding to chosen allocations
    ;; Barcelona tokens (4 tokens for days 2..14, together with day1 yields 5 Barcelona days total)
    (slot-for bslot1 barcelona) (available bslot1)
    (slot-for bslot2 barcelona) (available bslot2)
    (slot-for bslot3 barcelona) (available bslot3)
    (slot-for bslot4 barcelona) (available bslot4)

    ;; Helsinki tokens (3 tokens)
    (slot-for hslot1 helsinki) (available hslot1)
    (slot-for hslot2 helsinki) (available hslot2)
    (slot-for hslot3 helsinki) (available hslot3)

    ;; Florence tokens (6 tokens for days 2..14, to be used to reach total Florence 6 days)
    (slot-for fslot1 florence) (available fslot1)
    (slot-for fslot2 florence) (available fslot2)
    (slot-for fslot3 florence) (available fslot3)
    (slot-for fslot4 florence) (available fslot4)
    (slot-for fslot5 florence) (available fslot5)
    (slot-for fslot6 florence) (available fslot6)
  )

  ;; Goals:
  ;; - every day d1..d14 must be covered (planner must assign a city for each day by advancing current day)
  ;; - met must be achieved by being in Florence on one of the allowed meeting days (9..14)
  ;; The slots enforce the allocation: Barcelona total 5 days (day1 + 4 tokens), Helsinki 3 days, Florence 6 days.
  (:goal
    (and
      (covered d1) (covered d2) (covered d3) (covered d4) (covered d5) (covered d6)
      (covered d7) (covered d8) (covered d9) (covered d10) (covered d11) (covered d12)
      (covered d13) (covered d14)
      (met)
    )
  )
)