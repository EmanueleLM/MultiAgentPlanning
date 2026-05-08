(define (domain depots_repairs)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    thing
    surface - thing
    depot distributor - place
    truck hoist - thing
    pallet crate - surface
  )

  (:predicates
    (at ?x - thing ?p - place)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
    (hoist_available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in_truck ?c - crate ?t - truck)
  )

  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at ?tr ?from)
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  (:action lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at ?c ?p))
      (lifting ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  (:action drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (hoist_available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
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
      (not (lifting ?h ?c))
      (hoist_available ?h)
    )
  )

  (:action unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (hoist_available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (not (hoist_available ?h))
      (lifting ?h ?c)
    )
  )
)