(define (domain multiagent_logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    truck
    hoist
    time
  )

  (:predicates
    ;; static road connectivity (directed)
    (road-connects ?p1 - place ?p2 - place)

    ;; locations
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-surface ?s - surface ?p - place)  ;; surface or crate is located at place

    ;; stacking and containment
    (on ?c - crate ?s - surface)
    (in-truck ?c - crate ?t - truck)

    ;; hoist state
    (holding ?h - hoist ?c - crate)
    (free-hoist ?h - hoist)

    ;; surface/crate top-clear predicate
    (clear ?s - surface)

    ;; explicit discrete time progression (enforced sequential execution)
    (next ?t1 - time ?t2 - time)
    (current ?t - time)
  )

  ;; Drive a truck from one place to another (sequential: consumes one time step)
  (:action truck_coordinator-drive
    :parameters (?tr - truck ?from - place ?to - place ?t - time ?t2 - time)
    :precondition (and
      (at-truck ?tr ?from)
      (road-connects ?from ?to)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      ;; advance time
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Hoist lifts a crate from a surface at a place (hoist becomes busy, surface top becomes clear)
  (:action hoist_manager-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?t - time ?t2 - time)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (free-hoist ?h)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (holding ?h ?c)
      (not (on ?c ?s))
      (not (free-hoist ?h))
      (clear ?s)
      (not (at-surface ?c ?p))
      ;; advance time
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Hoist drops a crate to a surface at a place (hoist becomes available)
  (:action hoist_manager-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?t - time ?t2 - time)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (holding ?h ?c)
      (clear ?s)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (holding ?h ?c))
      (on ?c ?s)
      (free-hoist ?h)
      (not (clear ?s))
      (clear ?c)
      (at-surface ?c ?p)
      ;; advance time
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Hoist loads a held crate into a truck at the same place (hoist becomes available)
  (:action hoist_manager-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?t - time ?t2 - time)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (holding ?h ?c)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (holding ?h ?c))
      (in-truck ?c ?tr)
      (free-hoist ?h)
      (not (at-surface ?c ?p))
      (not (on ?c ?tr)) ;; safe no-op if not present
      ;; crate in truck is not considered at a place or on a surface
      ;; advance time
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Hoist unloads a crate from a truck (hoist becomes busy and holds the crate)
  (:action hoist_manager-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?t - time ?t2 - time)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (in-truck ?c ?tr)
      (free-hoist ?h)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (holding ?h ?c)
      (not (in-truck ?c ?tr))
      (not (free-hoist ?h))
      ;; advance time
      (not (current ?t))
      (current ?t2)
    )
  )
)