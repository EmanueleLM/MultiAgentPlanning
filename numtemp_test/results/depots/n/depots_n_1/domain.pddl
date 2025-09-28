(define (domain orchestrator-domain)
  (:requirements :typing :negative-preconditions :equality :numeric-fluents)
  (:types truck hoist pallet crate - object place)

  (:predicates
    (at ?obj - object ?p - place)
    (on ?c - crate ?surface - object)
    (in ?c - crate ?t - truck)
    (clear ?s - object)
    (available ?h - hoist)
    (holding ?h - hoist ?c - crate)
  )

  (:functions
    (current-load ?t - truck)
    (load-limit ?t - truck)
    (crate-weight ?c - crate)
    (fuel-cost)
  )

  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
      (increase (fuel-cost) 10)
    )
  )

  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?surface - object ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?surface ?p)
      (at ?c ?p)
      (on ?c ?surface)
      (clear ?c)
      (available ?h)
    )
    :effect (and
      (not (on ?c ?surface))
      (holding ?h ?c)
      (not (available ?h))
      (clear ?surface)
      (not (clear ?c))
      (not (at ?c ?p))
      (increase (fuel-cost) 1)
    )
  )

  (:action hoist-put-down
    :parameters (?h - hoist ?c - crate ?surface - object ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?surface ?p)
      (holding ?h ?c)
      (clear ?surface)
    )
    :effect (and
      (on ?c ?surface)
      (at ?c ?p)
      (not (holding ?h ?c))
      (available ?h)
      (clear ?c)
      (not (clear ?surface))
      (increase (fuel-cost) 1)
    )
  )

  (:action hoist-put-in-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (holding ?h ?c)
      (<= (+ (current-load ?tr) (crate-weight ?c)) (load-limit ?tr))
    )
    :effect (and
      (in ?c ?tr)
      (not (holding ?h ?c))
      (available ?h)
      (increase (current-load ?tr) (crate-weight ?c))
      (increase (fuel-cost) 1)
      (not (clear ?c))
      (not (at ?c ?p))
    )
  )

  (:action hoist-take-out-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (in ?c ?tr)
      (available ?h)
    )
    :effect (and
      (not (in ?c ?tr))
      (holding ?h ?c)
      (not (available ?h))
      (decrease (current-load ?tr) (crate-weight ?c))
      (increase (fuel-cost) 1)
    )
  )
)