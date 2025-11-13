(define (problem TripPlanningExample17-problem)
  (:domain TripPlanningExample17-domain)
  (:objects
    copenhagen vienna lyon - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )
  (:init
    ;; start on day 1 in Copenhagen
    (current d1)
    (at d1 copenhagen)

    ;; conference obligations (must be physically at the conference city on these days)
    (conf_day d1)
    (conf_day d5)
    (conf_city copenhagen)

    ;; ready is true for all non-conference days so they can be advanced without attend_conf
    (ready d2) (ready d3) (ready d4)
    (ready d6) (ready d7) (ready d8) (ready d9) (ready d10) (ready d11)

    ;; direct flight connectivity (directed)
    (direct copenhagen vienna)
    (direct vienna copenhagen)
    (direct vienna lyon)
    (direct lyon vienna)

    ;; linear day chain
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    (next d10 d11)
  )

  ;; Hard goal: exactly the contiguous assignment validated by the auditor:
  ;; Copenhagen on days 1-5 (conference days included), Vienna on days 6-8, Lyon on days 9-11,
  ;; and reach the final day.
  (:goal (and
    (current d11)
    (at d1 copenhagen)
    (at d2 copenhagen)
    (at d3 copenhagen)
    (at d4 copenhagen)
    (at d5 copenhagen)
    (at d6 vienna)
    (at d7 vienna)
    (at d8 vienna)
    (at d9 lyon)
    (at d10 lyon)
    (at d11 lyon)
  ))
)