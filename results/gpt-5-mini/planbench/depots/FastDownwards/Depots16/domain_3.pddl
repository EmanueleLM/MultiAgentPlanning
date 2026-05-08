(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    place - object
    depot distributor - place
    surface - object
    pallet crate - surface
    truck hoist - object
  )
  (:predicates
    (at ?o - object ?p - place)
    (on ?top - surface ?bottom - surface)
    (in ?c - crate ?t - truck)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (clear ?s - surface)
    (reachable ?p1 - place ?p2 - place)
    (must-be-loaded ?t - truck)
  )
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (reachable ?from ?to)
      (not (must-be-loaded ?tr))
    )
    :effect (and
      (at ?tr ?to)
      (not (at ?tr ?from))
    )
  )
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (lifting ?h ?c)
      (clear ?s)
      (not (on ?c ?s))
      (not (at ?c ?p))
      (not (available ?h))
    )
  )
  (:action hoist_drop
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
      (clear ?c)
      (available ?h)
      (not (lifting ?h ?c))
      (not (clear ?s))
    )
  )
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in ?c ?tr)
      (available ?h)
      (not (lifting ?h ?c))
      (not (must-be-loaded ?tr))
    )
  )
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (available ?h)
      (in ?c ?tr)
    )
    :effect (and
      (lifting ?h ?c)
      (not (in ?c ?tr))
      (not (available ?h))
    )
  )
)