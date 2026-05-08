(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place surface truck hoist
    depot distributor - place
    pallet crate - surface
  )

  (:predicates
    (truck_at ?tr - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (surface_at ?s - surface ?p - place)

    (at ?c - crate ?p - place)
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?t - truck)
    (lifting ?h - hoist ?c - crate)

    (hoist_available ?h - hoist)
    (clear ?s - surface)
  )

  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (truck_at ?tr ?from)
    )
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
    )
  )

  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (surface_at ?s ?p)
      (on ?c ?s)
      (at ?c ?p)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at ?c ?p))
      (not (on ?c ?s))
      (not (surface_at ?c ?p))
      (lifting ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
    )
  )

  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (surface_at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (hoist_available ?h)
      (at ?c ?p)
      (on ?c ?s)
      (surface_at ?c ?p)
      (not (clear ?s))
      (clear ?c)
    )
  )

  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (hoist_available ?h)
      (in_truck ?c ?t)
      (not (at ?c ?p))
      (not (surface_at ?c ?p))
    )
  )

  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?t ?p)
      (hoist_available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (not (hoist_available ?h))
      (lifting ?h ?c)
    )
  )
)