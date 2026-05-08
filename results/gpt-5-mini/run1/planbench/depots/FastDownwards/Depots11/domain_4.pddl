(define (domain depots11-hoist)
  (:requirements :strips :typing)
  (:types
    locatable
    place - locatable
    surface - locatable
    crate pallet - surface
    hoist truck - locatable
    depot distributor - place
  )

  (:predicates
    (at ?obj - locatable ?p - place)
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?t - truck)
    (clear ?s - surface)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
  )

  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?support - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?support ?p)
      (on ?c ?support)
      (clear ?c)
      (available ?h)
    )
    :effect (and
      (not (on ?c ?support))
      (not (at ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?support)
    )
  )

  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?support - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?support ?p)
      (lifting ?h ?c)
      (clear ?support)
    )
    :effect (and
      (on ?c ?support)
      (at ?c ?p)
      (clear ?c)
      (not (lifting ?h ?c))
      (available ?h)
      (not (clear ?support))
    )
  )

  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?t)
      (not (lifting ?h ?c))
      (available ?h)
      (not (at ?c ?p))
    )
  )

  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (lifting ?h ?c)
      (not (available ?h))
      (not (at ?c ?p))
    )
  )

  (:action drive_truck
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at ?t ?from)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )
)