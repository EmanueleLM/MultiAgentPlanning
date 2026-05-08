(define (domain depots2)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place truck hoist crate pallet - object
  )
  (:predicates
    (at-truck ?t - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-pallet ?pa - pallet ?p - place)
    (at-crate ?c - crate ?p - place)
    (on ?c - crate ?s - (either crate pallet))
    (clear ?s - (either crate pallet))
    (holding ?h - hoist ?c - crate)
    (in-truck ?c - crate ?t - truck)
    (available ?h - hoist)
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?t ?from)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
    )
  )

  (:action lift-from-pallet
    :parameters (?h - hoist ?c - crate ?pa - pallet ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-pallet ?pa ?p)
      (at-crate ?c ?p)
      (on ?c ?pa)
      (clear ?c)
      (available ?h)
    )
    :effect (and
      (holding ?h ?c)
      (not (on ?c ?pa))
      (not (at-crate ?c ?p))
      (clear ?pa)
      (not (available ?h))
    )
  )

  (:action lift-from-crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-crate ?c ?p)
      (at-crate ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (available ?h)
    )
    :effect (and
      (holding ?h ?c)
      (not (on ?c ?s))
      (not (at-crate ?c ?p))
      (clear ?s)
      (not (available ?h))
    )
  )

  (:action drop-on-pallet
    :parameters (?h - hoist ?c - crate ?pa - pallet ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-pallet ?pa ?p)
      (holding ?h ?c)
      (clear ?pa)
      (not (available ?h))
    )
    :effect (and
      (on ?c ?pa)
      (at-crate ?c ?p)
      (not (holding ?h ?c))
      (not (clear ?pa))
      (clear ?c)
      (available ?h)
    )
  )

  (:action drop-on-crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-crate ?s ?p)
      (holding ?h ?c)
      (clear ?s)
      (not (available ?h))
    )
    :effect (and
      (on ?c ?s)
      (at-crate ?c ?p)
      (not (holding ?h ?c))
      (not (clear ?s))
      (clear ?c)
      (available ?h)
    )
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (holding ?h ?c)
      (not (available ?h))
    )
    :effect (and
      (in-truck ?c ?t)
      (not (holding ?h ?c))
      (available ?h)
    )
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (in-truck ?c ?t)
      (available ?h)
    )
    :effect (and
      (holding ?h ?c)
      (not (in-truck ?c ?t))
      (not (available ?h))
    )
  )
)