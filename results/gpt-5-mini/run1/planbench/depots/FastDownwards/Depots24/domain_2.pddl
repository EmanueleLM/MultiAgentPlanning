(define (domain logistics-stacking)
  (:requirements :typing :strips :negative-preconditions)
  (:types place entity truck hoist crate pallet - entity)

  ;; Predicates
  (:predicates
    ;; location of any movable entity (trucks, hoists, pallets, crates)
    (at ?e - entity ?p - place)

    ;; stacking relation: crate is on some supporting entity (pallet or crate)
    (on ?c - crate ?s - entity)

    ;; crate inside a truck
    (in_truck ?c - crate ?tr - truck)

    ;; a surface/entity has nothing on it
    (clear ?e - entity)

    ;; hoist state
    (hoist_available ?h - hoist)
    (hoist_holding ?h - hoist ?c - crate)

    ;; explicit connectivity for driving (problem instance will fully ground this)
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
  ;; Preconditions require hoist and surface at the same place, the crate supported by the surface,
  ;; hoist available, and crate top clear. Effects: hoist holds the crate, hoist becomes unavailable,
  ;; crate is no longer on the surface, crate is no longer at the place, and supporting surface becomes clear.
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - entity ?p - place)
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
      ;; while being lifted the crate is not "clear" (it cannot be used as a support until dropped)
      (not (clear ?c))
    )
  )

  ;; Hoist drops a held crate onto a clear supporting entity at the same place.
  ;; Effects: hoist becomes available, hoist no longer holds the crate, crate at place,
  ;; crate on the surface, crate becomes clear (top free), and surface becomes not clear.
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - entity ?p - place)
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
      ;; when loaded, crate is not on any surface (ensured by precondition that it was lifted)
    )
  )

  ;; Hoist unloads a crate from a truck at the same place and begins holding it.
  ;; Preconditions: hoist and truck at place, hoist available, crate in the truck.
  ;; Effects: hoist holds the crate, crate removed from truck, hoist becomes unavailable.
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
      ;; crate is being held (not at place, not on surface)
      (not (at ?c ?p))
    )
  )
)