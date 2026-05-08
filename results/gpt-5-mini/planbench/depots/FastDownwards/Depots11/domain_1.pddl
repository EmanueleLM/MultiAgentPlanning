(define (domain depots-hoist)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    support - object
    crate - support
    pallet - support
    hoist - object
    truck - object
    location
  )

  (:predicates
    (at ?o - object ?l - location)         ; object (crate/pallet/hoist/truck) is at location
    (on ?c - crate ?s - support)          ; crate is on a support (crate or pallet)
    (clear ?s - support)                  ; a support (crate or pallet) has nothing on top
    (available ?h - hoist)                ; hoist is free to use (not holding)
    (holding ?h - hoist ?c - crate)       ; hoist is holding a crate
    (in ?c - crate ?t - truck)            ; crate is inside a truck
  )

  ;; Hoist lifts a top-most crate from a support at the same location.
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - support ?loc - location)
    :precondition (and
      (at ?h ?loc)
      (at ?s ?loc)
      (at ?c ?loc)
      (on ?c ?s)
      (clear ?c)
      (available ?h)
    )
    :effect (and
      (holding ?h ?c)
      (not (on ?c ?s))
      (not (at ?c ?loc))
      (clear ?s)
      (not (available ?h))
    )
  )

  ;; Hoist places a held crate onto a support (crate or pallet) at the same location.
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - support ?loc - location)
    :precondition (and
      (holding ?h ?c)
      (at ?h ?loc)
      (at ?s ?loc)
      (clear ?s)
    )
    :effect (and
      (on ?c ?s)
      (at ?c ?loc)
      (clear ?c)
      (not (clear ?s))
      (not (holding ?h ?c))
      (available ?h)
    )
  )

  ;; Hoist loads a held crate into a truck at the same location.
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?loc - location)
    :precondition (and
      (holding ?h ?c)
      (at ?h ?loc)
      (at ?t ?loc)
    )
    :effect (and
      (in ?c ?t)
      (not (holding ?h ?c))
      (available ?h)
      ;; crate is inside truck and thus not at a location or on a support
      (not (at ?c ?loc))
    )
  )

  ;; Hoist unloads a crate from a truck: hoist starts holding the crate (becomes busy).
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?loc - location)
    :precondition (and
      (available ?h)
      (at ?h ?loc)
      (at ?t ?loc)
      (in ?c ?t)
    )
    :effect (and
      (holding ?h ?c)
      (not (in ?c ?t))
      (not (available ?h))
    )
  )

  ;; Drive a truck between locations. Crates 'in' the truck remain in the truck.
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
      (at ?t ?from)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )
)