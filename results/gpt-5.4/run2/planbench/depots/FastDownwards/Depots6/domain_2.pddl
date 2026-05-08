(define (domain depots6)
  (:requirements :strips :typing)

  (:types
    place
    depot distributor - place
    truck hoist
    surface
    pallet crate - surface
  )

  (:predicates
    (at ?s - surface ?p - place)
    (at_truck ?t - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (on ?c - crate ?s - surface)
    (in ?c - crate ?t - truck)
    (clear ?s - surface)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (road ?from - place ?to - place)
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at_truck ?t ?from)
      (road ?from ?to)
    )
    :effect (and
      (at_truck ?t ?to)
      (not (at_truck ?t ?from))
    )
  )

  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at ?c ?p)
      (at ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (lifting ?h ?c)
      (clear ?s)
      (not (available ?h))
      (not (at ?c ?p))
      (not (on ?c ?s))
    )
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at ?s ?p)
      (lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      (available ?h)
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (not (lifting ?h ?c))
      (not (clear ?s))
    )
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in ?c ?t)
      (available ?h)
      (not (lifting ?h ?c))
    )
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (available ?h)
      (in ?c ?t)
    )
    :effect (and
      (lifting ?h ?c)
      (not (available ?h))
      (not (in ?c ?t))
    )
  )
)