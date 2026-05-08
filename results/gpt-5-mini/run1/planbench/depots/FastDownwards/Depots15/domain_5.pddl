(define (domain depots_repaired)
  (:requirements :strips :typing)
  (:types
    place
    surface
    pallet crate - surface
    hoist
    truck
  )

  (:predicates
    ;; locations
    (at_hoist ?h - hoist ?p - place)
    (at_truck ?tr - truck ?p - place)
    (at_surface ?s - surface ?p - place)

    ;; stacking / containment
    (on ?c - crate ?s - surface)      ;; crate is directly on a surface (pallet or another crate)
    (in_truck ?c - crate ?tr - truck) ;; crate is inside a truck
    (holding ?h - hoist ?c - crate)   ;; hoist is holding crate

    ;; resources / clearness
    (available ?h - hoist)
    (clear_surface ?s - surface)  ;; no crate directly on s
    (clear_crate ?c - crate)      ;; no crate directly on c
  )

  ;; Drive a truck from one place to another
  (:action drive_truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at_truck ?tr ?from)
    )
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  ;; Hoist lifts a crate from a surface at a place
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (on ?c ?s)
      (clear_crate ?c)
      (available ?h)
    )
    :effect (and
      (holding ?h ?c)
      (not (available ?h))
      ;; crate is no longer on that surface
      (not (on ?c ?s))
      ;; surface becomes clear
      (clear_surface ?s)
      ;; held crate remains clear (no crate on it)
      (clear_crate ?c)
    )
  )

  ;; Hoist drops a crate to a surface at a place
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (holding ?h ?c)
      (clear_surface ?s)
    )
    :effect (and
      (not (holding ?h ?c))
      (available ?h)
      (on ?c ?s)
      (clear_crate ?c)
      (not (clear_surface ?s))
    )
  )

  ;; Hoist loads a held crate into a truck at the same place
  (:action hoist_load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (holding ?h ?c)
    )
    :effect (and
      (not (holding ?h ?c))
      (available ?h)
      (in_truck ?c ?tr)
    )
  )

  ;; Hoist unloads a crate from a truck (hoist becomes unavailable and holds the crate)
  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (holding ?h ?c)
      (not (available ?h))
      (not (in_truck ?c ?tr))
    )
  )
)