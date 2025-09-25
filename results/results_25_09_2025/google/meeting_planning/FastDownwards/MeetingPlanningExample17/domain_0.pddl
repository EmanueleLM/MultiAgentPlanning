(define (domain orchestrator)
  (:requirements :typing :durative-actions :negative-preconditions :timed-initial-literals :fluents)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (met-matthew)
  )
  (:functions
    (meetings-count)  ; numeric fluent to count meetings (to maximize)
  )

  ;; TRAVELER actions (labeled for the traveler agent)
  (:durative-action traveler-travel-als-to-sunset
    :duration (= ?duration 16)
    :condition (and
      (at start (at traveler AlamoSquare))
    )
    :effect (and
      (at start (not (at traveler AlamoSquare)))
      (at end (at traveler SunsetDistrict))
    )
  )

  (:durative-action traveler-travel-sunset-to-als
    :duration (= ?duration 17)
    :condition (and
      (at start (at traveler SunsetDistrict))
    )
    :effect (and
      (at start (not (at traveler SunsetDistrict)))
      (at end (at traveler AlamoSquare))
    )
  )

  ;; Meeting action involving both agents (explicitly labeled)
  ;; Minimum meeting duration of 15 minutes is enforced by setting duration = 15.
  ;; Requires both agents to be at SunsetDistrict for the whole meeting interval.
  (:durative-action traveler-meet-matthew
    :duration (= ?duration 15)
    :condition (and
      (at start (at traveler SunsetDistrict))
      (at start (at matthew SunsetDistrict))
      (over all (at traveler SunsetDistrict))
      (over all (at matthew SunsetDistrict))
    )
    :effect (and
      (at end (met-matthew))
      (at end (increase (meetings-count) 1))
    )
  )
)