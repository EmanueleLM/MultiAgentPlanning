(define (domain meetings-domain)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types agent location timepoint)
  (:predicates
    (at ?a - agent ?l - location)
    (time ?t - timepoint)
    (margaret-present)
    (met-or-penalized)
    (met-margaret)
  )
  (:functions (total-cost))

  (:action travel-traveler-md-to-ph
    :parameters ()
    :precondition (and (at traveler Marina-District) (time t540))
    :effect (and
      (not (at traveler Marina-District))
      (at traveler Pacific-Heights)
      (increase (total-cost) 0)
    )
  )

  (:action advance-to-1140
    :parameters ()
    :precondition (and (time t540))
    :effect (and
      (not (time t540))
      (time t1140)
      (margaret-present)
      (increase (total-cost) 0)
    )
  )

  (:action meet-traveler-margaret-at-ph
    :parameters ()
    :precondition (and
      (time t1140)
      (at traveler Pacific-Heights)
      (margaret-present)
    )
    :effect (and
      (not (time t1140))
      (time t1155)
      (met-or-penalized)
      (met-margaret)
      (increase (total-cost) 0)
    )
  )

  (:action penalize-not-meeting
    :parameters ()
    :precondition (and (not (met-or-penalized)))
    :effect (and
      (met-or-penalized)
      (increase (total-cost) 1)
    )
  )
)