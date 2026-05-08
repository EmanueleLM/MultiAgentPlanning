(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place locatable
    entity surface - locatable
    depot distributor - place
    hoist truck - entity
    pallet crate - surface
  )

  (:predicates
    (at ?o - locatable ?p - place)
    (in_truck ?c - crate ?t - truck)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (at ?t ?from)
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (available ?h)
    )
    :effect (and
      (not (at ?c ?p))
      (not (on ?c ?s))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
    )
  )

  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  (:action hoist_load_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?t)
      (not (at ?c ?p))
      (available ?h)
      (not (lifting ?h ?c))
    )
  )

  (:action hoist_unload_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
    )
  )
)