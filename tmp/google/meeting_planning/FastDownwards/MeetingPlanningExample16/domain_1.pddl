(define (domain coordinated-meetings)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types agent location timepoint)

  (:predicates
    (at ?a - agent ?l - location)
    (time-is ?t - timepoint)
    (met_105)
    (available-start ?t - timepoint)
    (available-end ?t - timepoint)
  )

  ;; Visitor actions (distinct)
  (:action travel-visitor-chinatown-to-russian
    :parameters ()
    :precondition (and (at visitor chinatown))
    :effect (and
      (not (at visitor chinatown))
      (at visitor russian-hill)
    )
    :cost 7
  )

  (:action travel-visitor-russian-to-chinatown
    :parameters ()
    :precondition (and (at visitor russian-hill))
    :effect (and
      (not (at visitor russian-hill))
      (at visitor chinatown)
    )
    :cost 9
  )

  ;; Ronald actions (distinct)
  (:action travel-ronald-chinatown-to-russian
    :parameters ()
    :precondition (and (at ronald chinatown))
    :effect (and
      (not (at ronald chinatown))
      (at ronald russian-hill)
    )
    :cost 7
  )

  (:action travel-ronald-russian-to-chinatown
    :parameters ()
    :precondition (and (at ronald russian-hill))
    :effect (and
      (not (at ronald russian-hill))
      (at ronald chinatown)
    )
    :cost 9
  )

  ;; Global wait action to advance to Ronald's availability start (discretized time jump)
  (:action wait-to-availability
    :parameters ()
    :precondition (time-is t0)
    :effect (and
      (not (time-is t0))
      (time-is t375)
    )
    :cost 375
  )

  ;; Meeting action (instantaneous encoding of a 105-minute meeting block;
  ;; requires both agents at Russian Hill and that the meeting starts at or after availability start)
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
    :cost 105
  )

)