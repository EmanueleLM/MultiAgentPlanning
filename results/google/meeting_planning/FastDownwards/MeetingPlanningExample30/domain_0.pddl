(define (domain meeting-domain)
  (:requirements :strips :typing :adl :fluents :negative-preconditions)
  (:types location)
  (:predicates
    (visitor-at ?l - location)
    (stephanie-at ?l - location)
    (met-stephanie)
  )
  (:functions
    (time) ; minutes since midnight
  )

  ; Travel from Richmond_District to North_Beach: 17 minutes
  (:action travel-rd-to-nb
    :parameters ()
    :precondition (and (visitor-at Richmond_District))
    :effect (and
      (not (visitor-at Richmond_District))
      (visitor-at North_Beach)
      (increase (time) 17)
    )
  )

  ; Travel from North_Beach to Richmond_District: 18 minutes
  (:action travel-nb-to-rd
    :parameters ()
    :precondition (and (visitor-at North_Beach))
    :effect (and
      (not (visitor-at North_Beach))
      (visitor-at Richmond_District)
      (increase (time) 18)
    )
  )

  ; Wait one minute (can be repeated to wait arbitrary minutes)
  (:action wait-1min
    :parameters ()
    :precondition (and)
    :effect (and
      (increase (time) 1)
    )
  )

  ; Meet Stephanie for exactly 120 minutes (satisfies "at least 120 minutes")
  ; Preconditions ensure meeting starts no earlier than 09:30 (570) and finishes by 16:15 (975)
  (:action meet-stephanie
    :parameters ()
    :precondition (and
      (visitor-at North_Beach)
      (stephanie-at North_Beach)
      (>= (time) 570)
      (<= (+ (time) 120) 975)
      (not (met-stephanie))
    )
    :effect (and
      (met-stephanie)
      (increase (time) 120)
    )
  )
)