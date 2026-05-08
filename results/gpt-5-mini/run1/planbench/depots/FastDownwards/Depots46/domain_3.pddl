(define (domain depots46)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    truck
    hoist
    pallet
    crate
  )

  (:predicates
    ;; locations
    (at-truck ?t - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-pallet ?s - pallet ?p - place)
    (at-crate ?c - crate ?p - place)

    ;; support / stacking
    (on ?c - crate ?s - pallet)

    ;; clearance
    (clear-pallet ?s - pallet)
    (clear-crate ?c - crate)

    ;; hoist state
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; truck contents
    (in-truck ?c - crate ?t - truck)
  )

  ;; drive a truck from one place to another
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?tr ?from)
    )
    :effect (and
      (at-truck ?tr ?to)
      (not (at-truck ?tr ?from))
    )
  )

  ;; hoist lifts a crate off a pallet at a place
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - pallet ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-pallet ?s ?p)
      (on ?c ?s)
      (clear-crate ?c)
      (available ?h)
    )
    :effect (and
      (lifting ?h ?c)
      (not (available ?h))
      (not (at-crate ?c ?p))
      (not (on ?c ?s))
      (clear-pallet ?s)
    )
  )

  ;; hoist drops a lifted crate to a pallet at a place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - pallet ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-pallet ?s ?p)
      (clear-pallet ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at-crate ?c ?p)
      (not (clear-pallet ?s))
      (clear-crate ?c)
      (on ?c ?s)
    )
  )

  ;; hoist loads a lifted crate into a truck at a place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in-truck ?c ?t)
      (available ?h)
      (not (lifting ?h ?c))
      (not (at-crate ?c ?p))
    )
  )

  ;; hoist unloads a crate from a truck at a place (hoist begins lifting it)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (available ?h)
      (in-truck ?c ?t)
    )
    :effect (and
      (lifting ?h ?c)
      (not (available ?h))
      (not (in-truck ?c ?t))
      (not (at-crate ?c ?p))
    )
  )
)