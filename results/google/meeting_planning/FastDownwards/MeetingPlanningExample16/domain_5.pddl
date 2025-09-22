(define (domain coordinated-meetings)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location timepoint)

  (:constants
    visitor ronald - agent
    chinatown russian-hill - location
    t0 t368 t375 t480 t489 t750 - timepoint
  )

  (:predicates
    (at ?a - agent ?l - location)
    (time-is ?t - timepoint)
    (met_105)
    (available-start ?t - timepoint)
    (available-end ?t - timepoint)
  )

  (:action visitor-wait-to-368
    :parameters ()
    :precondition (time-is t0)
    :effect (and
      (not (time-is t0))
      (time-is t368)
    )
  )

  (:action visitor-travel-chinatown-to-russian
    :parameters ()
    :precondition (and (at visitor chinatown) (time-is t368))
    :effect (and
      (not (at visitor chinatown))
      (at visitor russian-hill)
      (not (time-is t368))
      (time-is t375)
    )
  )

  (:action ronald-arrive-russian-at-375
    :parameters ()
    :precondition (time-is t375)
    :effect (and
      (at ronald russian-hill)
    )
  )

  (:action visitor-ronald-meet-105
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

  (:action visitor-travel-russian-to-chinatown
    :parameters ()
    :precondition (and (at visitor russian-hill) (time-is t480))
    :effect (and
      (not (at visitor russian-hill))
      (at visitor chinatown)
      (not (time-is t480))
      (time-is t489)
    )
  )
)