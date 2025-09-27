(define (domain sf-meet-classical)
  (:requirements :typing :adl :negative-preconditions :fluents)
  (:types agent location timepoint)

  (:constants
    traveler andrew - agent
    Presidio UnionSquare - location
    t540 t562 t586 t675 t780 t1035 - timepoint
  )

  (:predicates
    (at ?ag - agent ?loc - location)
    (at-time ?t - timepoint)
    (met-andrew)
  )

  (:functions (meetings))

  (:action travel-presidio-to-unionsq-from-t540
    :parameters ()
    :precondition (and (at traveler Presidio) (at-time t540))
    :effect (and (not (at traveler Presidio)) (at traveler UnionSquare) (not (at-time t540)) (at-time t562))
  )

  (:action travel-unionsq-to-presidio-from-t562
    :parameters ()
    :precondition (and (at traveler UnionSquare) (at-time t562))
    :effect (and (not (at traveler UnionSquare)) (at traveler Presidio) (not (at-time t562)) (at-time t586))
  )

  (:action wait-at-presidio-540-to-675
    :parameters ()
    :precondition (and (at traveler Presidio) (at-time t540))
    :effect (and (not (at-time t540)) (at-time t675))
  )

  (:action wait-at-unionsq-562-to-675
    :parameters ()
    :precondition (and (at traveler UnionSquare) (at-time t562))
    :effect (and (not (at-time t562)) (at-time t675))
  )

  (:action wait-at-presidio-586-to-675
    :parameters ()
    :precondition (and (at traveler Presidio) (at-time t586))
    :effect (and (not (at-time t586)) (at-time t675))
  )

  (:action meet-andrew-675-to-780
    :parameters ()
    :precondition (and (at traveler UnionSquare) (at andrew UnionSquare) (at-time t675) (not (met-andrew)))
    :effect (and (met-andrew) (not (at-time t675)) (at-time t780) (increase (meetings) 1))
  )
)