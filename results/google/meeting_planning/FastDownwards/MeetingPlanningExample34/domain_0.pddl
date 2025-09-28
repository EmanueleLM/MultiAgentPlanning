(define (domain meet-friends)
  (:requirements :strips :typing :fluents :negative-preconditions)
  (:types location)
  (:constants bayview pacific-heights - location)

  (:predicates
    (at-traveler ?l - location)
    (met-thomas)
  )

  (:functions
    (time)        ; current time in minutes since 00:00
    (met-count)   ; number of friends met
  )

  ; Travel action: Bayview -> Pacific Heights (23 minutes)
  (:action travel-bayview-to-ph
    :parameters ()
    :precondition (and
      (at-traveler bayview)
    )
    :effect (and
      (not (at-traveler bayview))
      (at-traveler pacific-heights)
      (increase (time) 23)
    )
  )

  ; Travel action: Pacific Heights -> Bayview (22 minutes)
  (:action travel-ph-to-bayview
    :parameters ()
    :precondition (and
      (at-traveler pacific-heights)
    )
    :effect (and
      (not (at-traveler pacific-heights))
      (at-traveler bayview)
      (increase (time) 22)
    )
  )

  ; Non-location-specific wait action to advance time to 12:15 (735) if earlier.
  ; This lets the traveler wait until Thomas's availability window begins.
  (:action wait-until-12-15
    :parameters ()
    :precondition (and
      (<= (time) 735)
    )
    :effect (and
      (assign (time) 735)
    )
  )

  ; Meeting action: meet Thomas at Pacific Heights for at least 105 minutes.
  ; Must start no earlier than 12:15 (735) and no later than 15:30 (930),
  ; so that the 105-minute meeting ends by 17:15 (1035).
  (:action meet-with-thomas
    :parameters ()
    :precondition (and
      (at-traveler pacific-heights)
      (not (met-thomas))
      (>= (time) 735)
      (<= (time) 930)
    )
    :effect (and
      (met-thomas)
      (increase (met-count) 1)
      (increase (time) 105)
    )
  )
)