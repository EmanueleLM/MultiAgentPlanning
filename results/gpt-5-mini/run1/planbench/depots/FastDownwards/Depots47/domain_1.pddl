(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place surface
    depot distributor - place
    pallet crate - surface
    hoist truck
  )

  (:predicates
    ;; location: trucks, hoists, pallets and crates can be at places
    (at ?o - (either truck hoist pallet crate) ?p - place)

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
    :precondition (at ?tr ?from)
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (at ?c ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (lifting ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
      (not (at ?c ?p))
      (not (on ?c ?s))
    )
  )

  ;; hoist drops a lifted crate to a surface at a place
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (at ?c ?p)
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
      (at ?h ?p)
      (at ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (hoist_available ?h)
      (not (lifting ?h ?c))
      (not (at ?c ?p))
    )
  )

  ;; hoist unloads a crate from a truck at a place (hoist begins lifting the crate)
  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
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