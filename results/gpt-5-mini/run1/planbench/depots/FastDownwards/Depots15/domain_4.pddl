(define (domain depots_revised)
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

    ;; containment / stacking
    (on ?c - crate ?s - surface)    ;; crate c is directly on surface s
    (in ?c - crate ?tr - truck)     ;; crate c is inside truck tr
    (holding ?h - hoist ?c - crate) ;; hoist h is holding crate c

    ;; resources / clearness
    (available ?h - hoist)
    (clear_surface ?s - surface)  ;; no crate currently directly on s
    (clear_crate ?c - crate)      ;; no crate directly on c

    (truck_free ?tr - truck)      ;; optional mutex token for truck use
  )

  ;; Drive a truck from one place to another
  (:action truck_drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at_truck ?tr ?from)
      (truck_free ?tr)
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

      ;; surface becomes clear (nothing directly on it)
      (clear_surface ?s)

      ;; a held crate has no crate on it (it is clear)
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
      (truck_free ?tr)
    )
    :effect (and
      (not (holding ?h ?c))
      (available ?h)
      (in ?c ?tr)
    )
  )

  ;; Hoist unloads a crate from a truck (hoist becomes unavailable and holds the crate)
  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (available ?h)
      (in ?c ?tr)
    )
    :effect (and
      (holding ?h ?c)
      (not (available ?h))
      (not (in ?c ?tr))
    )
  )
)