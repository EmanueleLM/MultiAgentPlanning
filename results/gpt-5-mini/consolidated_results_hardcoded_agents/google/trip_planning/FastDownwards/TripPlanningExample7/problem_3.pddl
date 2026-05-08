(define (problem trip-example7)
  (:domain trip-planning)
  ;; Problem encoding:
  ;; - Total available days: 11 (day1..day11).
  ;; - Stated desired stays encoded as separate city-specific tokens:
  ;;     Venice: ven1..ven6  (6 days desired)
  ;;     Dubrovnik: dub1..dub4 (4 days desired)
  ;;     Istanbul: ist1..ist3 (3 days desired)
  ;; These desired stays sum to 13, which is greater than the available 11 days above.
  ;; The goal therefore requires more stay tokens to be used than there are day tokens,
  ;; making the problem intentionally unsolvable to reflect the specification conflict.
  (:objects
    dubrovnik istanbul venice - city

    ;; exactly 11 global day tokens (total trip length)
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day

    ;; city-specific stay tokens encoding the stated desired stays (total 13 tokens)
    dub1 dub2 dub3 dub4 - ctok
    ist1 ist2 ist3 - ctok
    ven1 ven2 ven3 ven4 ven5 ven6 - ctok
  )

  (:init
    ;; start location chosen as Dubrovnik to allow reaching both other cities given available direct flights.
    ;; This choice is necessary because only Dubrovnik has outgoing direct flights in the ground facts.
    (at dubrovnik)

    ;; available global days
    (day-available day1) (day-available day2) (day-available day3)
    (day-available day4) (day-available day5) (day-available day6)
    (day-available day7) (day-available day8) (day-available day9)
    (day-available day10) (day-available day11)

    ;; map city-specific stay tokens to their cities (these encode the hard desired-stay quotas)
    (ctok-of dub1 dubrovnik) (ctok-of dub2 dubrovnik) (ctok-of dub3 dubrovnik) (ctok-of dub4 dubrovnik)
    (ctok-of ist1 istanbul) (ctok-of ist2 istanbul) (ctok-of ist3 istanbul)
    (ctok-of ven1 venice) (ctok-of ven2 venice) (ctok-of ven3 venice) (ctok-of ven4 venice) (ctok-of ven5 venice) (ctok-of ven6 venice)

    ;; all city-specific stay tokens initially free
    (free-ctok dub1) (free-ctok dub2) (free-ctok dub3) (free-ctok dub4)
    (free-ctok ist1) (free-ctok ist2) (free-ctok ist3)
    (free-ctok ven1) (free-ctok ven2) (free-ctok ven3) (free-ctok ven4) (free-ctok ven5) (free-ctok ven6)

    ;; Only the direct flights that are grounded in the specification are included.
    ;; No other flight connections are invented.
    (direct dubrovnik istanbul)
    (direct dubrovnik venice)
  )

  ;; Goal: require all stated desired city-specific stay tokens to be used (hard constraints),
  ;; and that all three cities be visited. Because desired stays sum to 13 but only 11 day
  ;; tokens exist, this goal set is inconsistent with the available days.
  (:goal (and
    ;; Dubrovnik desired stays (4)
    (used-ctok dub1) (used-ctok dub2) (used-ctok dub3) (used-ctok dub4)
    ;; Istanbul desired stays (3)
    (used-ctok ist1) (used-ctok ist2) (used-ctok ist3)
    ;; Venice desired stays (6)
    (used-ctok ven1) (used-ctok ven2) (used-ctok ven3) (used-ctok ven4) (used-ctok ven5) (used-ctok ven6)

    ;; ensure each city is visited at least once
    (visited dubrovnik) (visited istanbul) (visited venice)
  ))
)