(define (domain logistics-stacking)
  (:requirements :typing :strips :negative-preconditions)
  (:types
    place truck hoist crate pallet - object
  )

  ;; Predicates
  (:predicates
    ;; location of any physical object (trucks, hoists, pallets, crates)
    (at ?obj - object ?p - place)

    ;; stacking relation: crate is on some supporting object (pallet or crate)
    (on ?c - crate ?s - object)

    ;; crate inside a truck
    (in_truck ?c - crate ?tr - truck)

    ;; a surface/object has nothing on it (no crate on top)
    (clear ?o - object)

    ;; hoist state
    (hoist_available ?h - hoist)
    (hoist_holding ?h - hoist ?c - crate)

    ;; explicit connectivity for driving (fully grounded in problem)
    (adjacent ?p1 - place ?p2 - place)
  )

  ;; Drive a truck from one place to another (requires truck at origin and a road)
  (:action driver_drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at ?tr ?from) (adjacent ?from ?to))
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; Hoist lifts a crate from a supporting surface at a place.
  ;; Preconditions: hoist and surface at the same place, crate supported by the surface,
  ;; hoist available, and crate top clear.
  ;; Effects: hoist holds the crate, hoist becomes unavailable,
  ;; crate is no longer on the surface, crate is not at the place, and supporting surface becomes clear.
  ;; While being lifted the crate is not considered clear (it cannot support others).
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - object ?p - place)
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

  ;; Hoist drops a held crate onto a clear supporting object at the same place.
  ;; Effects: hoist becomes available, hoist no longer holds the crate, crate at place,
  ;; crate on the surface, crate becomes clear (top free), and surface becomes not clear.
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
  ;; Preconditions: hoist and truck at place, hoist holding the crate.
  ;; Effects: crate is in the truck, hoist becomes available, hoist no longer holds the crate,
  ;; crate not at place (it is in-truck).
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
  ;; crate not at place while being held.
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
      (not (clear ?c)) ; being held is not considered clear for stacking
    )
  )
)