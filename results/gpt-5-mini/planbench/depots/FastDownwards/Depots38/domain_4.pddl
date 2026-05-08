(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing)
  (:types
    place
    depot distributor - place
    entity
    truck hoist - entity
    surface - entity
    pallet crate - surface
  )

  (:predicates
    (at ?e - entity ?p - place)
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?t - truck)
    (clear ?s - surface)
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)
  )

  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at ?tr ?from))
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)
    )
    :effect (and
      (not (at ?c ?p))
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (at ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?t)
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (not (at ?c ?p))
    )
  )

  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (hoist_available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (not (hoist_available ?h))
      (hoist_lifting ?h ?c)
    )
  )
)