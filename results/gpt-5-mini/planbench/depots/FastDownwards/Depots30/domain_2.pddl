(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place surface truck hoist
    depot distributor - place
    pallet crate - surface
  )

  (:predicates
    (at_truck ?t - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_surface ?s - surface ?p - place)
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?tr - truck)
    (lifting ?h - hoist ?c - crate)
    (available ?h - hoist)
    (clear ?s - surface)
  )

  (:action drive_truck
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (at_truck ?t ?from)
    :effect (and
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
    )
  )

  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at_surface ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at_surface ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  (:action hoist_load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (available ?h)
      (not (lifting ?h ?c))
      (not (at_surface ?c ?p))
    )
  )

  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
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
    )
  )
)