(define (domain depots-hoist)
  (:requirements :strips :typing)
  (:types
    place
    depot distributor - place
    obj
    support hoist truck - obj
    pallet crate - support
  )

  (:predicates
    (at ?o - obj ?p - place)            ; object o is at place p
    (on ?c - crate ?s - support)       ; crate c is on support s (pallet or crate)
    (clear ?s - support)               ; top of support s is clear (nothing on it)
    (available ?h - hoist)             ; hoist h is free to use
    (holding ?h - hoist ?c - crate)    ; hoist h is holding crate c
    (in ?c - crate ?t - truck)         ; crate c is inside truck t
  )

  ;; Hoist lifts a top-most crate from a support at the same place.
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - support ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (available ?h)
    )
    :effect (and
      (holding ?h ?c)
      (not (on ?c ?s))
      (not (at ?c ?p))
      (clear ?s)
      (not (available ?h))
    )
  )

  ;; Hoist places a held crate onto a support (crate or pallet) at the same place.
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - support ?p - place)
    :precondition (and
      (holding ?h ?c)
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
    )
    :effect (and
      (on ?c ?s)
      (at ?c ?p)
      (clear ?c)
      (not (clear ?s))
      (not (holding ?h ?c))
      (available ?h)
    )
  )

  ;; Hoist loads a held crate into a truck at the same place.
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (holding ?h ?c)
      (at ?h ?p)
      (at ?t ?p)
    )
    :effect (and
      (in ?c ?t)
      (not (holding ?h ?c))
      (available ?h)
      (not (at ?c ?p))
    )
  )

  ;; Hoist unloads a crate from a truck: hoist becomes busy and holds the crate.
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (available ?h)
      (at ?h ?p)
      (at ?t ?p)
      (in ?c ?t)
    )
    :effect (and
      (holding ?h ?c)
      (not (in ?c ?t))
      (not (available ?h))
    )
  )

  ;; Drive a truck between places. Crates inside remain in the truck.
  (:action drive_truck
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at ?t ?from)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )
)