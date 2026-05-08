(define (domain jack_of_all_trades_instance)
  (:requirements :typing :strips :negative-preconditions)
  (:types
    place depot distributor - place
    surface pallet crate - surface
    hoist
    truck
  )

  (:predicates
    (at_hoist ?h - hoist ?p - place)
    (at_truck ?tr - truck ?p - place)
    (at_surface ?s - surface ?p - place)
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?tr - truck)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (clear ?s - surface)
  )

  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at_truck ?tr ?from)
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (available ?h)
      (at_surface ?c ?p)
    )
    :effect (and
      (not (on ?c ?s))
      (not (at_surface ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
    )
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (at_surface ?c ?p)
      (on ?c ?s)
      (not (clear ?s))
      (clear ?c)
    )
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (not (lifting ?h ?c))
      (available ?h)
      (not (at_surface ?c ?p))
    )
  )

  (:action unload
    :parameters (?h - hoist ?tr - truck ?c - crate ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (not (available ?h))
      (lifting ?h ?c)
      (not (at_surface ?c ?p))
    )
  )
)