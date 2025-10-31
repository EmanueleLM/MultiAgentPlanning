(define (problem trip17)
  (:domain trip_planning)
  (:objects
    traveler - agent
    lyon bucharest manchester - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 - day
    ;; slots: 5 for Lyon, 7 for Bucharest, 7 for Manchester
    lslot1 lslot2 lslot3 lslot4 lslot5
    bslot1 bslot2 bslot3 bslot4 bslot5 bslot6 bslot7
    mslot1 mslot2 mslot3 mslot4 mslot5 mslot6 mslot7
    - slot
  )

  (:init
    ;; day sequencing
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)
    (next d11 d12) (next d12 d13) (next d13 d14) (next d14 d15) (next d15 d16)
    (next d16 d17)

    ;; direct flight connectivity (only direct connections allowed)
    (direct manchester bucharest)
    (direct bucharest manchester)
    (direct bucharest lyon)
    (direct lyon bucharest)

    ;; relatives window days (days where relatives visit in Lyon is allowed)
    (window-day d13) (window-day d14) (window-day d15) (window-day d16) (window-day d17)

    ;; No day is initially marked used; no slots are filled; relatives not visited
    ;; (all those predicates are absent initially)
  )

  ;; Goal: all stay slots filled exactly as required and relatives visited in window
  (:goal
    (and
      ;; Lyon: 5 slots must be filled (hard constraint)
      (lyon-slot-filled lslot1) (lyon-slot-filled lslot2) (lyon-slot-filled lslot3) (lyon-slot-filled lslot4) (lyon-slot-filled lslot5)
      ;; Bucharest: 7 slots must be filled (hard constraint)
      (buch-slot-filled bslot1) (buch-slot-filled bslot2) (buch-slot-filled bslot3) (buch-slot-filled bslot4) (buch-slot-filled bslot5) (buch-slot-filled bslot6) (buch-slot-filled bslot7)
      ;; Manchester: 7 slots must be filled (hard constraint)
      (manch-slot-filled mslot1) (manch-slot-filled mslot2) (manch-slot-filled mslot3) (manch-slot-filled mslot4) (manch-slot-filled mslot5) (manch-slot-filled mslot6) (manch-slot-filled mslot7)
      ;; Relatives visit must occur (must be executed on a day within the window while at Lyon)
      (relatives-visited)
    )
  )
)