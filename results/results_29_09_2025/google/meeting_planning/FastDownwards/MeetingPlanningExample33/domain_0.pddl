(define (domain multiagent-meetings)
  (:requirements :strips :typing :fluents :negative-preconditions :numeric-fluents :adl)
  (:types agent location)
  (:predicates
    (at-traveler-sd)        ; traveler at Sunset District
    (at-traveler-us)        ; traveler at Union Square
    (sarah-met)             ; indicates Sarah has been met for required minimum
  )
  (:functions
    (current-time)          ; global clock in minutes since midnight
    (total-meetings)        ; integer count of meetings performed (includes Sarah)
  )

  ; Travel actions for traveler
  (:action travel-sd-to-us-by-traveler
    :parameters ()
    :precondition (and
      (at-traveler-sd)
    )
    :effect (and
      (not (at-traveler-sd))
      (at-traveler-us)
      (increase (current-time) 30)
    )
  )

  (:action travel-us-to-sd-by-traveler
    :parameters ()
    :precondition (and
      (at-traveler-us)
    )
    :effect (and
      (not (at-traveler-us))
      (at-traveler-sd)
      (increase (current-time) 26)
    )
  )

  ; Meeting a friend at Sunset District (15-minute slot)
  (:action meet-friend-at-sd-by-traveler
    :parameters ()
    :precondition (and
      (at-traveler-sd)
      ; ensure time remains within planning horizon implicitly by horizon checks in problem if needed
    )
    :effect (and
      (increase (current-time) 15)
      (increase (total-meetings) 1)
    )
  )

  ; Meet Sarah at Union Square for the minimum required 15 minutes
  (:action meet-sarah-at-us-by-traveler
    :parameters ()
    :precondition (and
      (at-traveler-us)
      (>= (current-time) 750)           ; cannot start before 12:30 (750)
      (<= (+ (current-time) 15) 1290)   ; meeting must finish by 21:30 (1290)
      (not (sarah-met))                 ; only need to mark once (prevents redundant sarah-met flips)
    )
    :effect (and
      (increase (current-time) 15)
      (increase (total-meetings) 1)
      (sarah-met)
    )
  )
)