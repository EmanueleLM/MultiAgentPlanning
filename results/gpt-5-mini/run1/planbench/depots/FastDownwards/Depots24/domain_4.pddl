(define (domain logistics_stacking)
  (:requirements :typing :strips :negative-preconditions)
  (:types
    crate pallet - surface
    surface truck hoist place - object
  )

  ;; Predicates
  (:predicates
    ;; location of physical entities (trucks, hoists, surfaces)
    (at ?obj - object ?p - place)

    ;; stacking relation: crate is on some supporting surface (pallet or crate)
    (on ?c - crate ?s - surface)

    ;; crate inside a truck
    (in_truck ?c - crate ?tr - truck)

    ;; a surface (pallet or crate) has nothing on it (top is free)
    (clear ?s - surface)

    ;; hoist state
    (hoist_available ?h - hoist)
    (hoist_holding ?h - hoist ?c - crate)

    ;; explicit connectivity for driving (grounded in problem file)
    (adjacent ?p1 - place ?p2 - place)
  )

  ;; Drive a truck from one place to another (requires truck at origin and adjacency)
  (:action driver_drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at ?tr ?from) (adjacent ?from ?to))
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; Hoist lifts a crate from a supporting surface at a place.
  ;; Preconditions:
  ;;  - hoist and supporting surface are at the same place,
  ;;  - crate is on that surface,
  ;;  - hoist is available,
  ;;  - crate top is clear (it can be lifted).
  ;; Effects:
  ;;  - hoist holds the crate and becomes unavailable,
  ;;  - crate is removed from the supporting surface and no longer recorded at the place,
  ;;  - supporting surface becomes clear,
  ;;  - crate is not clear (it is being held; cannot support others).
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
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

  ;; Hoist drops a held crate onto a clear supporting surface at the same place.
  ;; Effects:
  ;;  - hoist becomes available and no longer holds the crate,
  ;;  - crate is at the place and is on the surface,
  ;;  - crate becomes clear (top free), and supporting surface becomes not clear.
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
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
  ;; Preconditions: hoist and truck at place, hoist holding the crate.
  ;; Effects: crate is in the truck, hoist becomes available, hoist no longer holds crate,
  ;; and crate is no longer at the place.
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

  ;; Hoist unloads a crate from a truck at the same place and begins holding it.
  ;; Preconditions: hoist and truck at place, hoist available, crate in the truck.
  ;; Effects: hoist holds the crate, crate removed from truck, hoist becomes unavailable,
  ;; crate not at place while being held, crate is not clear while held.
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
      (not (clear ?c))
    )
  )
)