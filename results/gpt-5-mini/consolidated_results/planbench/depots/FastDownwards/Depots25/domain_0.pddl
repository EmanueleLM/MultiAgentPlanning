(define (domain multiagent_logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor
    surface pallet crate
    truck hoist
  )
  ;; place subtypes
  ;; depot and distributor are subtypes of place
  ;; pallet and crate are subtypes of surface
  ;; (PDDL typing notation used in objects and action parameters)

  (:predicates
    ;; topology
    (road-connects ?p1 - place ?p2 - place)

    ;; location predicates
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-surface ?s - surface ?p - place)       ;; a surface (pallet or crate used as a base) located at place

    ;; stacking / containment / holding
    (on ?c - crate ?s - surface)               ;; crate c is directly on surface s
    (in-truck ?c - crate ?t - truck)           ;; crate c is inside truck t
    (holding ?h - hoist ?c - crate)            ;; hoist h holds crate c

    ;; housekeeping tokens (explicit)
    (clear ?s - surface)                       ;; surface s has nothing on top
    (free-hoist ?h - hoist)                    ;; hoist h is free / available
  )

  ;; Actions namespaced by responsible agent/entity
  ;; Truck coordinator action: driving trucks between places
  (:action truck_coordinator-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?tr ?from)
      (road-connects ?from ?to)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; Hoist manager actions: lift, drop, load, unload
  (:action hoist_manager-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (free-hoist ?h)
    )
    :effect (and
      (holding ?h ?c)
      (not (on ?c ?s))
      (not (free-hoist ?h))
      (clear ?s)
      ;; leaving clear(?c) unchanged (a crate that is held remains conceptually clear)
    )
  )

  (:action hoist_manager-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (holding ?h ?c)
      (clear ?s)
    )
    :effect (and
      (not (holding ?h ?c))
      (on ?c ?s)
      (free-hoist ?h)
      (not (clear ?s))
      (clear ?c)
    )
  )

  (:action hoist_manager-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (holding ?h ?c)
    )
    :effect (and
      (not (holding ?h ?c))
      (in-truck ?c ?t)
      (free-hoist ?h)
    )
  )

  (:action hoist_manager-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (in-truck ?c ?t)
      (free-hoist ?h)
    )
    :effect (and
      (holding ?h ?c)
      (not (in-truck ?c ?t))
      (not (free-hoist ?h))
    )
  )
)