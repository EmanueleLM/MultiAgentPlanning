(define (domain multiagent-meet)
  (:requirements :strips :typing :fluents :adl)
  (:types agent location)

  (:predicates
    (at ?x - agent ?l - location)
    (met ?a - agent ?b - agent)
    (nancy-ready) ; Nancy has indicated she is ready to start the meeting at this time
  )

  (:functions
    (current-time)            ; minutes since 09:00 (so 0 == 09:00)
    (friends-met-count)       ; integer count of distinct friends met
  )

  ;; TRAVELER actions (keep traveler actions distinct)
  (:action traveler-move-sunset-to-haight
    :parameters ()
    :precondition (and (at traveler Sunset))
    :effect (and
              (not (at traveler Sunset))
              (at traveler Haight)
              (increase (current-time) 15)
            )
  )

  (:action traveler-move-haight-to-sunset
    :parameters ()
    :precondition (and (at traveler Haight))
    :effect (and
              (not (at traveler Haight))
              (at traveler Sunset)
              (increase (current-time) 15)
            )
  )

  ;; Waiting action for traveler: advance time by 15 minutes
  (:action traveler-wait-15
    :parameters ()
    :precondition (or (at traveler Sunset) (at traveler Haight))
    :effect (and
              (increase (current-time) 15)
            )
  )

  ;; MEET action executed by traveler to start meeting with Nancy.
  ;; Requires Nancy to have indicated readiness (nancy-ready) and both at Haight.
  ;; Meeting increases current-time by 75 minutes and counts as meeting Nancy.
  (:action traveler-meet-nancy
    :parameters ()
    :precondition (and
                    (at traveler Haight)
                    (at nancy Haight)
                    (nancy-ready)
                  )
    :effect (and
              (met traveler nancy)
              (increase (friends-met-count) 1)
              (increase (current-time) 75)
            )
  )

  ;; NANCY actions (keep Nancy actions distinct)
  ;; Nancy indicates she is ready to meet at her start time.
  ;; Nancy's availability window is encoded in the numeric preconditions:
  ;; availability start = 630 (which is 19:30), latest allowed meeting start = 690 (which is 20:30).
  (:action nancy-become-ready
    :parameters ()
    :precondition (and
                    (at nancy Haight)
                    (>= (current-time) 630)   ; at or after 19:30
                    (<= (current-time) 690)   ; at or before last possible start 20:30
                  )
    :effect (and
              (nancy-ready)
            )
  )

  ;; (Optional) Nancy can wait to reach availability window
  (:action nancy-wait-15
    :parameters ()
    :precondition (at nancy Haight)
    :effect (increase (current-time) 15)
  )

)