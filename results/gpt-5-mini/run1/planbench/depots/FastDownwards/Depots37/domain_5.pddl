(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    object
    truck hoist surface - object
    pallet crate - surface
  )

  (:predicates
    (at ?x - object ?p - place)
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?tr - truck)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (clear ?s - surface)
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and (at ?t ?from))
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (not (at ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
    )
  )

  (:action drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      (on ?c ?s)
      (at ?c ?p)
      (available ?h)
      (not (lifting ?h ?c))
      (not (clear ?s))
      (clear ?c)
    )
  )

  (:action load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (available ?h)
      (not (lifting ?h ?c))
      (not (at ?c ?p))
    )
  )

  (:action unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (lifting ?h ?c)
      (not (available ?h))
      (not (at ?c ?p))
    )
  )
)