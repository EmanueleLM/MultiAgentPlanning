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
    (at ?t - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (crate_at ?c - crate ?p - place)
    (on ?c - crate ?s - surface)
    (in ?c - crate ?t - truck)
    (clear ?s - surface)
    (pallet_at ?pa - pallet ?p - place)
    (road ?from - place ?to - place)
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at ?t ?from)
      (road ?from ?to)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action lift_from_pallet
    :parameters (?h - hoist ?c - crate ?pa - pallet ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (available ?h)
      (crate_at ?c ?p)
      (on ?c ?pa)
      (clear ?c)
      (pallet_at ?pa ?p)
    )
    :effect (and
      (not (crate_at ?c ?p))
      (not (on ?c ?pa))
      (not (available ?h))
      (lifting ?h ?c)
      (clear ?pa)
    )
  )

  (:action lift_from_crate
    :parameters (?h - hoist ?c - crate ?support - crate ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (available ?h)
      (crate_at ?c ?p)
      (on ?c ?support)
      (clear ?c)
      (crate_at ?support ?p)
    )
    :effect (and
      (not (crate_at ?c ?p))
      (not (on ?c ?support))
      (not (available ?h))
      (lifting ?h ?c)
      (clear ?support)
    )
  )

  (:action drop_on_pallet
    :parameters (?h - hoist ?c - crate ?pa - pallet ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (lifting ?h ?c)
      (clear ?pa)
      (pallet_at ?pa ?p)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (crate_at ?c ?p)
      (not (clear ?pa))
      (clear ?c)
      (on ?c ?pa)
    )
  )

  (:action drop_on_crate
    :parameters (?h - hoist ?c - crate ?support - crate ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (lifting ?h ?c)
      (clear ?support)
      (crate_at ?support ?p)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (crate_at ?c ?p)
      (not (clear ?support))
      (clear ?c)
      (on ?c ?support)
    )
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (in ?c ?t)
    )
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at ?t ?p)
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