(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
      depot distributor - place
    surface
      pallet crate - surface
    hoist
    truck
  )

  (:predicates
    ;; explicit location predicates per object type to avoid "either" types
    (at_truck ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_surface ?s - surface ?p - place)

    ;; stacking and surface properties
    (on ?c - crate ?s - surface)
    (clear ?s - surface)

    ;; hoist state
    (hoist_available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; crate in truck
    (in_truck ?c - crate ?tr - truck)
  )

  ;; drive a truck from one place to another
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at_truck ?tr ?from)
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (at_surface ?c ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (lifting ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
      (not (at_surface ?c ?p))
      (not (on ?c ?s))
    )
  )

  ;; hoist drops a lifted crate to a surface at a place
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (at_surface ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)
      (not (lifting ?h ?c))
      (not (clear ?s))
    )
  )

  ;; hoist loads a lifted crate into a truck at a place
  (:action hoist_load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (hoist_available ?h)
      (not (lifting ?h ?c))
      (not (at_surface ?c ?p))
    )
  )

  ;; hoist unloads a crate from a truck at a place (hoist begins lifting the crate)
  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (hoist_available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (lifting ?h ?c)
      (not (hoist_available ?h))
    )
  )
)