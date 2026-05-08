(define (domain depots27)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
      depot distributor - place
    support
      pallet truck crate - support
    hoist
  )

  (:predicates
    ;; location predicates
    (at_support ?s - support ?p - place)    ; support (pallet, truck, or crate) is at a place
    (at_hoist ?h - hoist ?p - place)        ; hoist is at a place

    ;; stacking / occupancy
    (on ?c - crate ?s - support)            ; crate ?c is on support ?s (pallet, truck, or crate)
    (clear ?s - support)                    ; top of this support (pallet, truck, or crate) is clear

    ;; hoist state
    (hoist_available ?h - hoist)            ; hoist is available
    (hoist_holding ?h - hoist ?c - crate)   ; hoist is currently holding crate ?c
  )

  ;; Drive a truck from one place to another (roads fully connected among places).
  (:action drive_truck
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (at_support ?t ?from)
    :effect (and
      (not (at_support ?t ?from))
      (at_support ?t ?to)
    )
  )

  ;; Hoist lifts a crate from a support at a place.
  ;; After lift: crate is no longer at the place nor on the support; hoist holds crate and becomes unavailable;
  ;; the support becomes clear.
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - support ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_support ?s ?p)
      (on ?c ?s)
      (at_support ?c ?p)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (not (at_support ?c ?p))
      (hoist_holding ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
    )
  )

  ;; Hoist drops a held crate onto a support at the same place.
  ;; Prevent dropping a crate onto itself by ensuring the hoist is not holding the target support.
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - support ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_support ?s ?p)
      (hoist_holding ?h ?c)
      (clear ?s)
      (not (hoist_holding ?h ?s))    ;; disallow dropping onto the same crate being held
    )
    :effect (and
      (not (hoist_holding ?h ?c))
      (on ?c ?s)
      (hoist_available ?h)
      (not (clear ?s))
      (clear ?c)
      (at_support ?c ?p)
    )
  )

  ;; Hoist loads a held crate into a truck at the same place.
  ;; After load: crate is on the truck (no longer at the place as independent support), hoist becomes available.
  (:action hoist_load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_support ?t ?p)
      (hoist_holding ?h ?c)
      (clear ?t)
    )
    :effect (and
      (not (hoist_holding ?h ?c))
      (on ?c ?t)
      (hoist_available ?h)
      (not (at_support ?c ?p))
      (not (clear ?t))
      (clear ?c)
    )
  )

  ;; Hoist unloads a crate from a truck into the hoist (hoist becomes busy/holding).
  ;; After unload: crate is not on the truck and the hoist holds the crate and becomes unavailable.
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