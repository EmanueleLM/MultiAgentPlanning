(define (domain meeting-scheduling-classical)
  (:requirements :strips :typing :adl :fluents :action-costs)
  (:types agent location)

  (:predicates
    (at ?a - agent ?l - location)
    (arrival-before-window)
    (you-before-window)
    (you-ready-for-meeting)
    (marg-available)
    (marg-window-known)
    (window-long-enough)
    (met-you-margaret)
  )

  (:functions
    (total-cost)
  )

  (:action travel-you-marina-to-pacific
    :parameters ()
    :precondition (and (at you marina-district))
    :effect (and
              (not (at you marina-district))
              (at you pacific-heights)
              (when (arrival-before-window) (you-before-window))
              (increase (total-cost) 7)
            )
  )

  (:action travel-margaret-pacific-to-marina
    :parameters ()
    :precondition (and (at margaret pacific-heights))
    :effect (and
              (not (at margaret pacific-heights))
              (at margaret marina-district)
              (increase (total-cost) 6)
            )
  )

  (:action you-wait-until-marg-start
    :parameters ()
    :precondition (and (at you pacific-heights) (you-before-window) (marg-window-known))
    :effect (and
              (you-ready-for-meeting)
              (increase (total-cost) 0)
            )
  )

  (:action marg-start-availability
    :parameters ()
    :precondition (and (at margaret pacific-heights) (marg-window-known))
    :effect (and
              (marg-available)
              (increase (total-cost) 0)
            )
  )

  (:action meet-margaret
    :parameters ()
    :precondition (and
                    (at you pacific-heights)
                    (at margaret pacific-heights)
                    (marg-available)
                    (you-ready-for-meeting)
                    (window-long-enough)
                  )
    :effect (and
              (met-you-margaret)
              (increase (total-cost) -1000)
            )
  )
)