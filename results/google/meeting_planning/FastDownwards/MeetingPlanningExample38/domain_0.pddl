(define (domain multiagent-meet)
  (:requirements :typing :durative-actions :negative-preconditions :timed-initial-literals :fluents :numeric-fluents)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (met ?p - agent)
    (margaret-present)
  )
  (:functions
    (met-count) ; numeric count of distinct friends met (maximize)
  )

  ;---------------------------
  ; Planner travel actions (distinct agent actions)
  ;---------------------------

  (:durative-action planner-travel-union->north
    :parameters ()
    ; travel time Union Square -> North Beach = 10 minutes
    :duration (= ?duration 10)
    :condition (and
      (at start (at planner union-square))
    )
    :effect (and
      (at end (not (at planner union-square)))
      (at end (at planner north-beach))
    )
  )

  (:durative-action planner-travel-north->union
    :parameters ()
    ; travel time North Beach -> Union Square = 7 minutes
    :duration (= ?duration 7)
    :condition (and
      (at start (at planner north-beach))
    )
    :effect (and
      (at end (not (at planner north-beach)))
      (at end (at planner union-square))
    )
  )

  ;---------------------------
  ; Meeting action (requires both agents present for entire meeting duration)
  ; Distinct action name for the planner side of the meeting
  ; Meeting duration is 45 minutes (minimum requirement encoded as exact duration)
  ; Must occur while margaret-present holds (enforced with over all condition)
  ;---------------------------

  (:durative-action planner-meet-margaret
    :parameters ()
    :duration (= ?duration 45)
    :condition (and
      ; both must be present at the location for the whole meeting
      (over all (at planner north-beach))
      (over all (at margaret north-beach))
      ; meeting must occur while Margaret is present at North Beach
      (over all margaret-present)
    )
    :effect (and
      ; record that Margaret has been met
      (at end (met margaret))
      ; increase the numeric met-count (for maximizing number of friends met)
      (at end (increase (met-count) 1))
    )
  )

  ; No margaret-agent travel actions are provided or assumed beyond her stated window.
  ; Margaret's presence/location is controlled by timed initial literals in the problem file,
  ; reflecting the hard constraint that she will be at North Beach from 21:45 to 22:30 (see problem).
)