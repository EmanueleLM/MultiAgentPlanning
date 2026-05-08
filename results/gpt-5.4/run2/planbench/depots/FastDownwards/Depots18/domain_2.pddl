(define (domain depots18)
  (:requirements :strips :typing)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    truck hoist
  )

  (:predicates
    (at ?c - crate ?p - place)
    (surface_at ?s - surface ?p - place)
    (truck_at ?t - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
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
      (truck_at ?t ?from)
      (road ?from ?to)
    )
    :effect (and
      (truck_at ?t ?to)
      (not (truck_at ?t ?from))
    )
  )

  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at ?c ?p)
      (surface_at ?s ?p)
      (available ?h)
      (clear ?c)
      (on ?c ?s)
    )
    :effect (and
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
      (not (on ?c ?s))
      (not (at ?c ?p))
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
      (at ?c ?p)
      (clear ?c)
      (on ?c ?s)
      (not (lifting ?h ?c))
      (not (clear ?s))
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
      (lifting ?h ?c)
      (not (in ?c ?t))
      (not (available ?h))
    )
  )
)