(define (domain logistics-stacking)
  (:requirements :typing :strips :negative-preconditions)
  (:types place object truck hoist crate pallet - object)

  (:predicates
    (at ?o - object ?p - place)
    (on ?c - crate ?s - object)
    (in_truck ?c - crate ?t - truck)
    (clear ?s - object)
    (hoist_available ?h - hoist)
    (hoist_holding ?h - hoist ?c - crate)
    (adjacent ?p1 - place ?p2 - place)
  )

  ;; Drive a truck along an adjacent road
  (:action driver_drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at ?tr ?from) (adjacent ?from ?to))
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; Hoist picks up a crate from a supporting surface at the same place.
  ;; Preconditions ensure hoist and surface are present, surface supports the crate,
  ;; crate top is clear, and hoist is available.
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - object ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (at ?c ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (hoist_holding ?h ?c)
      (not (hoist_available ?h))
      (not (on ?c ?s))
      (not (at ?c ?p))
      (clear ?s)
      (not (clear ?c))
    )
  )

  ;; Hoist places a held crate onto a clear surface at the same place.
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - object ?p - place)
    :precondition (and
      (at ?h ?p)
      (hoist_holding ?h ?c)
      (at ?s ?p)
      (clear ?s)
    )
    :effect (and
      (not (hoist_holding ?h ?c))
      (hoist_available ?h)
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (not (clear ?s))
    )
  )

  ;; Hoist loads a held crate into a truck at the same place.
  (:action hoist_load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (hoist_holding ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (hoist_available ?h)
      (not (hoist_holding ?h ?c))
      (not (at ?c ?p))
    )
  )

  ;; Hoist unloads a crate from a truck and starts holding it.
  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (hoist_available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (hoist_holding ?h ?c)
      (not (in_truck ?c ?tr))
      (not (hoist_available ?h))
      (not (at ?c ?p))
    )
  )
)