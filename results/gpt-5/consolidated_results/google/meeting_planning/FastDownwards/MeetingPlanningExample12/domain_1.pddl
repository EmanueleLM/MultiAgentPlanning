(define (domain meetingplanningexample12)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types agent friend location)

  (:predicates
    (at ?a - agent ?l - location)
    (connected ?from - location ?to - location)
    (before-window-barbara)
    (window-open-barbara)
    (window-closed-barbara)
    (met ?a - agent ?f - friend)
  )

  (:functions
    (total-cost)
  )

  ; Move from North Beach to Alamo Square
  (:action move-north_beach-to-alamo_square
    :parameters (?a - agent)
    :precondition (and
      (at ?a north_beach)
      (connected north_beach alamo_square)
    )
    :effect (and
      (not (at ?a north_beach))
      (at ?a alamo_square)
      (increase (total-cost) 1)
    )
  )

  ; Move from Alamo Square back to North Beach (optional)
  (:action move-alamo_square-to-north_beach
    :parameters (?a - agent)
    :precondition (and
      (at ?a alamo_square)
      (connected alamo_square north_beach)
    )
    :effect (and
      (not (at ?a alamo_square))
      (at ?a north_beach)
      (increase (total-cost) 1)
    )
  )

  ; Advance to the start of Barbara's availability window (18:00).
  ; This abstracts all pre-18:00 waiting anywhere into a single action.
  (:action wait-until-window-open-barbara
    :parameters (?a - agent ?l - location)
    :precondition (and
      (at ?a ?l)
      (before-window-barbara)
      (not (window-open-barbara))
    )
    :effect (and
      (not (before-window-barbara))
      (window-open-barbara)
      (increase (total-cost) 1)
    )
  )

  ; Optionally mark the window as closed (21:30). Meeting requires the window to be open.
  (:action close-window-barbara
    :parameters ()
    :precondition (and
      (window-open-barbara)
      (not (window-closed-barbara))
    )
    :effect (and
      (not (window-open-barbara))
      (window-closed-barbara)
    )
  )

  ; Meet Barbara for at least 90 minutes. This is compiled as a single non-durative action
  ; permitted only while the window is open and at the correct location.
  (:action meet-barbara-90
    :parameters (?a - agent ?f - friend)
    :precondition (and
      (at ?a alamo_square)
      (window-open-barbara)
      (not (met ?a ?f))
    )
    :effect (and
      (met ?a ?f)
      ; Meeting incurs no planning cost; travel and waiting are penalized instead.
    )
  )
)