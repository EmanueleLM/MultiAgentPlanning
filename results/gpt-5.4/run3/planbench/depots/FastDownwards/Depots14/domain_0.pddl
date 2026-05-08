(define (domain depots_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    place
    depot distributor - place
    truck
    hoist
    surface
    pallet crate - surface
  )

  (:predicates
    (truck_at ?t - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (crate_at ?c - crate ?p - place)
    (pallet_at ?pl - pallet ?p - place)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in ?c - crate ?t - truck)
    (connected ?from - place ?to - place)
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (truck_at ?t ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (truck_at ?t ?from))
      (truck_at ?t ?to)
    )
  )

  (:action lift_from_pallet
    :parameters (?h - hoist ?c - crate ?s - pallet ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (crate_at ?c ?p)
      (pallet_at ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (crate_at ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  (:action lift_from_crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (crate_at ?c ?p)
      (crate_at ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (crate_at ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  (:action drop_to_pallet
    :parameters (?h - hoist ?c - crate ?s - pallet ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (pallet_at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (crate_at ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  (:action drop_to_crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (crate_at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (crate_at ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?t ?p)
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
      (hoist_at ?h ?p)
      (truck_at ?t ?p)
      (available ?h)
      (in ?c ?t)
    )
    :effect (and
      (not (in ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
    )
  )
)