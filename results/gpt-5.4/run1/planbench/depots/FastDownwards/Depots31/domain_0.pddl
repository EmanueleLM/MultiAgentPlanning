(define (domain depot_instance)
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
    (road ?from - place ?to - place)
    (truck_at ?t - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (at ?c - crate ?p - place)
    (surface_at ?s - surface ?p - place)
    (in ?c - crate ?t - truck)
    (lifting ?h - hoist ?c - crate)
    (available ?h - hoist)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (truck_at ?t ?from)
      (road ?from ?to)
    )
    :effect (and
      (not (truck_at ?t ?from))
      (truck_at ?t ?to)
    )
  )

  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (available ?h)
      (at ?c ?p)
      (surface_at ?s ?p)
      (on ?c ?s)
      (clear ?c)
    )
    :effect (and
      (not (at ?c ?p))
      (not (surface_at ?c ?p))
      (not (on ?c ?s))
      (clear ?s)
      (not (available ?h))
      (lifting ?h ?c)
    )
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (surface_at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p)
      (surface_at ?c ?p)
      (on ?c ?s)
      (not (clear ?s))
      (clear ?c)
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