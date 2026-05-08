(define (domain depots1)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    hoist
    truck
  )

  (:predicates
    (at_truck ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_place ?s - surface ?p - place)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in ?c - crate ?t - truck)
    (clear ?s - surface)
    (on ?c - crate ?s - surface)
  )

  (:action driver_drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at_truck ?tr ?from)
    )
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  (:action loader_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_place ?s ?p)
      (at_place ?c ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at_place ?c ?p))
      (not (on ?c ?s))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
    )
  )

  (:action loader_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (lifting ?h ?c)
      (at_hoist ?h ?p)
      (at_place ?s ?p)
      (clear ?s)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (at_place ?c ?p)
      (on ?c ?s)
      (not (clear ?s))
      (clear ?c)
    )
  )

  (:action loader_load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (lifting ?h ?c)
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (in ?c ?t)
      (not (at_place ?c ?p))
    )
  )

  (:action loader_unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (available ?h)
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (in ?c ?t)
    )
    :effect (and
      (not (in ?c ?t))
      (lifting ?h ?c)
      (not (available ?h))
    )
  )
)