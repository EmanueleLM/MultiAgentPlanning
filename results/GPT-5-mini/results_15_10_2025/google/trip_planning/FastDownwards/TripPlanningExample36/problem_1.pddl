(define (problem TripPlanningExample36)
  (:domain TripPlanning)
  (:objects
    florence munich warsaw - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
    fl1 fl2 - token
    mu1 mu2 mu3 mu4 mu5 mu6 - token
    wa1 wa2 wa3 wa4 wa5 wa6 wa7 - token
  )
  (:init
    ; all days available
    (day-available d1) (day-available d2) (day-available d3) (day-available d4) (day-available d5)
    (day-available d6) (day-available d7) (day-available d8) (day-available d9) (day-available d10)
    (day-available d11) (day-available d12) (day-available d13)

    ; starting enabling for day 1
    (prev-done d1)

    ; next relations
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)
    (next d11 d12) (next d12 d13)

    ; adjacency (direct flights available, both directions)
    (adjacent florence munich) (adjacent munich florence)
    (adjacent munich warsaw) (adjacent warsaw munich)

    ; planner must choose a start location before day 1
    (start-unset)

    ; preference tokens representing preferred counts (traveler preferences)
    ; Florence preferred 2 days
    (pref-token fl1 florence) (pref-token fl2 florence)
    ; Munich preferred 6 days
    (pref-token mu1 munich) (pref-token mu2 munich) (pref-token mu3 munich)
    (pref-token mu4 munich) (pref-token mu5 munich) (pref-token mu6 munich)
    ; Warsaw preferred 7 days
    (pref-token wa1 warsaw) (pref-token wa2 warsaw) (pref-token wa3 warsaw)
    (pref-token wa4 warsaw) (pref-token wa5 warsaw) (pref-token wa6 warsaw) (pref-token wa7 warsaw)
  )
  (:goal
    (and
      (stayed d1) (stayed d2) (stayed d3) (stayed d4) (stayed d5) (stayed d6) (stayed d7)
      (stayed d8) (stayed d9) (stayed d10) (stayed d11) (stayed d12) (stayed d13)
    )
  )
)