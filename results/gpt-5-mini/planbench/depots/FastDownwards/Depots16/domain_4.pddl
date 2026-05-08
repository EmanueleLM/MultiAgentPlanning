(define (domain depots-orchestrator)
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
    (at ?o - object ?p - place)                    ; object (truck/hoist/pallet/crate) is at place
    (on ?top - surface ?bottom - surface)         ; top surface is on bottom surface
    (in ?c - crate ?t - truck)                    ; crate is inside truck
    (available ?h - hoist)                        ; hoist is available
    (lifting ?h - hoist ?c - crate)               ; hoist is currently lifting crate
    (clear ?s - surface)                          ; surface has nothing on it (top is clear)
    (reachable ?p1 - place ?p2 - place)           ; road connectivity
  )

  ; Drive a truck from one place to another (requires truck at origin and connectivity).
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (reachable ?from ?to)
    )
    :effect (and
      (at ?tr ?to)
      (not (at ?tr ?from))
    )
  )

  ; Use hoist to lift a crate from a surface at a place.
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
      (not (on ?c ?s))
      (not (at ?c ?p))
      (not (available ?h))
      (clear ?s)
    )
  )

  ; Use hoist to drop a lifted crate to a surface at a place.
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

  ; Use hoist to load a lifted crate into a truck at a place.
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
    )
  )

  ; Use hoist to unload a crate from a truck (hoist becomes lifting and crate removed from truck).
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