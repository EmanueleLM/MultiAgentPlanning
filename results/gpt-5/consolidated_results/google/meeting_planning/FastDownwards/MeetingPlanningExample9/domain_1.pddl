(define (domain meeting-planning-example9)
  (:requirements :strips :typing :negative-preconditions :numeric-fluents)
  (:types
    location person
  )
  ; Domain-level constants to allow direction-specific move schemas
  (:constants
    union_square nob_hill - location
  )
  (:predicates
    (at ?l - location) ; traveler location
  )
  (:functions
    (time)        ; minutes since arrival at 09:00 (t=0)
    (met-mary)    ; cumulative minutes spent meeting Mary
  )

  ; Wait exactly 5 minutes anywhere
  (:action wait_5
    :parameters ()
    :precondition ()
    :effect
      (increase (time) 5)
  )

  ; Direction-dependent travel: Union Square -> Nob Hill takes 9 minutes
  (:action move_union_square_to_nob_hill_9
    :parameters ()
    :precondition (at union_square)
    :effect (and
      (not (at union_square))
      (at nob_hill)
      (increase (time) 9)
    )
  )

  ; Direction-dependent travel: Nob Hill -> Union Square takes 7 minutes
  (:action move_nob_hill_to_union_square_7
    :parameters ()
    :precondition (at nob_hill)
    :effect (and
      (not (at nob_hill))
      (at union_square)
      (increase (time) 7)
    )
  )

  ; Meet Mary for exactly 5 minutes. Can only start within her availability.
  ; Mary is at Nob Hill from 12:00 to 16:15 local, which is t in [180, 435]
  ; relative to 09:00 start. To ensure the meeting ENDS within the window,
  ; we require current time <= 430 before a 5-minute meeting increment.
  (:action meet_mary_5
    :parameters ()
    :precondition (and
      (at nob_hill)
      (>= (time) 180)  ; not before 12:00
      (<= (time) 430)  ; ensures end at or before 16:15
    )
    :effect (and
      (increase (time) 5)
      (increase (met-mary) 5)
    )
  )
)