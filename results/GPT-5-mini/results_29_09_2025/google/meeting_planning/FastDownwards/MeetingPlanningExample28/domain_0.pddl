(define (domain meeting-schedule)
  (:requirements :strips :typing :durative-actions :fluents :negative-preconditions :numeric-fluents)
  (:types agent person location)

  (:predicates
    (at ?l - location)
    (met ?p - person)
  )

  (:functions
    (clock)                 ; time in minutes since midnight
    (total-meetings)        ; integer count of meetings completed
  )

  ;-------------------------
  ; Travel actions for the planner ("you")
  ; Distinct actions for the two travel directions
  ; Travel durations are expressed in minutes (numeric)
  ;-------------------------
  (:durative-action travel-us-to-cn
    :parameters ()
    :duration (= ?duration 15)
    :condition (and
      (at start (at union-square))
    )
    :effect (and
      (at start (not (at union-square)))
      (at end (at chinatown))
      (at end (increase (clock) 15))
    )
  )

  (:durative-action travel-cn-to-us
    :parameters ()
    :duration (= ?duration 15)
    :condition (and
      (at start (at chinatown))
    )
    :effect (and
      (at start (not (at chinatown)))
      (at end (at union-square))
      (at end (increase (clock) 15))
    )
  )

  ;-------------------------
  ; Meeting action with Joshua (distinct action per friend)
  ; Must be scheduled in Chinatown within Joshua's availability:
  ; between 18:00 (1080) and 21:30 (1290).
  ; Meeting must last at least 75 minutes; we model it as exactly 75
  ; (earliest feasible meeting that satisfies the "at least 75" constraint).
  ; To ensure the meeting completes within availability, the start time
  ; is restricted to be >=1080 and <=1215 (1215 = 1290 - 75).
  ;-------------------------
  (:durative-action meet-joshua
    :parameters ()
    :duration (= ?duration 75)
    :condition (and
      (at start (at chinatown))
      (at start (>= (clock) 1080))    ; earliest start 18:00
      (at start (<= (clock) 1215))    ; latest start 21:30 - 75 = 1215
      (over all (at chinatown))
    )
    :effect (and
      (at end (met joshua))
      (at end (increase (total-meetings) 1))
      (at end (increase (clock) 75))
    )
  )

  ;-------------------------
  ; Optional wait action (advance clock while staying in place).
  ; Useful if planner needs to wait until availability windows.
  ;-------------------------
  (:durative-action wait
    :parameters ()
    :duration (= ?duration 5)
    :condition (and)
    :effect (and
      (at end (increase (clock) 5))
    )
  )

)