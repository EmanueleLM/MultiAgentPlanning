(define (domain depots27)
  (:requirements :strips :typing)
  (:types
    place
      depot distributor - place
    support
      pallet truck crate - support
    hoist
  )

  (:predicates
    ;; locations
    (at_support ?s - support ?p - place)    ; support (pallet, truck, or crate) is at a place
    (at_hoist ?h - hoist ?p - place)        ; hoist is at a place

    ;; stacking / occupancy
    (on ?c - crate ?s - support)            ; crate ?c is on support ?s (pallet, truck, or crate)
    (clear ?s - support)                    ; top of this support (pallet, truck, or crate) is clear

    ;; hoist state
    (hoist_available ?h - hoist)            ; hoist is available
    (hoist_holding ?h - hoist ?c - crate)   ; hoist is currently holding crate ?c
  )

  ;; Drive a truck from one place to another.
  (:action drive_truck
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (at_support ?t ?from)
    :effect (and
      (not (at_support ?t ?from))
      (at_support ?t ?to)
    )
  )

  ;; Hoist lifts a crate from a support (pallet or crate) at a place.
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - support ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_support ?s ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (hoist_holding ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
    )
  )

  ;; Hoist drops a held crate onto a support (pallet or crate) at the same place.
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - support ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_support ?s ?p)
      (hoist_holding ?h ?c)
      (clear ?s)
    )
    :effect (and
      (not (hoist_holding ?h ?c))
      (on ?c ?s)
      (hoist_available ?h)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; Hoist loads a held crate into a truck at the same place (crate becomes on the truck support).
  (:action hoist_load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_support ?t ?p)
      (hoist_holding ?h ?c)
    )
    :effect (and
      (not (hoist_holding ?h ?c))
      (on ?c ?t)
      (hoist_available ?h)
    )
  )

  ;; Hoist unloads a crate from a truck into the hoist (hoist becomes busy/holding).
  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_support ?t ?p)
      (on ?c ?t)
      (hoist_available ?h)
    )
    :effect (and
      (not (on ?c ?t))
      (hoist_holding ?h ?c)
      (not (hoist_available ?h))
    )
  )
)