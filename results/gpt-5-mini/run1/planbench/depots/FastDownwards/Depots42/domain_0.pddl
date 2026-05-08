(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor
    surface pallet crate
    truck
    hoist
  )
  (:predicates
    (at ?o - (either truck hoist pallet crate) ?p - place)
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?t - truck)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (clear ?s - surface)
  )

  ;; Drive a truck from one place to another
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; Hoist lifts a crate from a surface at a place
  (:action hoist_lift_from_surface
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

  ;; Hoist drops a crate to a surface at a place
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

  ;; Hoist loads a crate into a truck at a place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?t)
      (available ?h)
      (not (lifting ?h ?c))
      (not (at ?c ?p))
    )
  )

  ;; Hoist unloads a crate from a truck at a place
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
      (not (available ?h))
      (lifting ?h ?c)
      (not (at ?c ?p))
    )
  )
)