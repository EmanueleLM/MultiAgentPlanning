(define (domain multiagent-meet)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types agent location time)
  (:constants
    planner margaret - agent
    union-square north-beach - location
    time0 time755 time765 time810 time817 - time
  )
  (:predicates
    (at ?a - agent ?l - location)
    (now ?t - time)
    (margaret-present ?t - time)
    (margaret-at ?l - location)
    (met ?a - agent)
  )
  (:functions (total-cost))

  (:action wait-0-to-755
    :parameters ()
    :precondition (and (now time0))
    :effect (and (not (now time0)) (now time755) (increase (total-cost) 755))
  )

  (:action travel-755-to-765
    :parameters ()
    :precondition (and (now time755) (at planner union-square))
    :effect (and
      (not (now time755))
      (now time765)
      (not (at planner union-square))
      (at planner north-beach)
      (increase (total-cost) 10)
    )
  )

  (:action meet-765-to-810
    :parameters ()
    :precondition (and
      (now time765)
      (at planner north-beach)
      (margaret-present time765)
      (margaret-at north-beach)
    )
    :effect (and
      (not (now time765))
      (now time810)
      (met margaret)
      (increase (total-cost) 45)
    )
  )

  (:action travel-810-to-817
    :parameters ()
    :precondition (and (now time810) (at planner north-beach))
    :effect (and
      (not (now time810))
      (now time817)
      (not (at planner north-beach))
      (at planner union-square)
      (increase (total-cost) 7)
    )
  )
)