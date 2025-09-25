(define (domain coordinated-meetings)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location timepoint)

  (:predicates
    (at ?a - agent ?l - location)
    (time-is ?t - timepoint)
    (met_105)
    (available-start ?t - timepoint)
    (available-end ?t - timepoint)
  )

  (:action travel-visitor-chinatown-to-russian
    :parameters ()
    :precondition (and (at visitor chinatown))
    :effect (and
      (not (at visitor chinatown))
      (at visitor russian-hill)
    )
  )

  (:action travel-visitor-russian-to-chinatown
    :parameters ()
    :precondition (and (at visitor russian-hill))
    :effect (and
      (not (at visitor russian-hill))
      (at visitor chinatown)
    )
  )

  (:action travel-ronald-chinatown-to-russian
    :parameters ()
    :precondition (and (at ronald chinatown))
    :effect (and
      (not (at ronald chinatown))
      (at ronald russian-hill)
    )
  )

  (:action travel-ronald-russian-to-chinatown
    :parameters ()
    :precondition (and (at ronald russian-hill))
    :effect (and
      (not (at ronald russian-hill))
      (at ronald chinatown)
    )
  )

  (:action wait-to-availability
    :parameters ()
    :precondition (time-is t0)
    :effect (and
      (not (time-is t0))
      (time-is t375)
    )
  )

  (:action meet-visitor-105
    :parameters ()
    :precondition (and
      (at visitor russian-hill)
      (at ronald russian-hill)
      (time-is t375)
      (available-start t375)
      (available-end t750)
    )
    :effect (and
      (met_105)
      (not (time-is t375))
      (time-is t480)
    )
  )
)