(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    pallet
    crate
    truck
    hoist
  )

  (:predicates
    ;; location predicates
    (at_truck ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_pallet ?s - pallet ?p - place)
    (at_crate ?c - crate ?p - place)

    ;; support and containment
    (on_pallet ?c - crate ?s - pallet)
    (in_truck ?c - crate ?tr - truck)

    ;; hoist state and clearance
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (clear_pallet ?s - pallet)
    (clear_crate ?c - crate)
  )

  ;; drive a truck between places (roads exist between any two places)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at_truck ?tr ?from)
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a pallet at a place
  (:action hoist_lift_from_pallet
    :parameters (?h - hoist ?c - crate ?s - pallet ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_pallet ?s ?p)
      (at_crate ?c ?p)
      (on_pallet ?c ?s)
      (available ?h)
      (clear_crate ?c)
    )
    :effect (and
      (not (at_crate ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear_pallet ?s)
      (not (on_pallet ?c ?s))
    )
  )

  ;; hoist drops a lifted crate onto a pallet at the same place
  (:action hoist_drop_to_pallet
    :parameters (?h - hoist ?c - crate ?s - pallet ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_pallet ?s ?p)
      (clear_pallet ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at_crate ?c ?p)
      (not (clear_pallet ?s))
      (clear_crate ?c)
      (on_pallet ?c ?s)
    )
  )

  ;; hoist loads a lifted crate into a truck at the same place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (available ?h)
      (not (lifting ?h ?c))
      (not (at_crate ?c ?p))
    )
  )

  ;; hoist unloads a crate from a truck: hoist begins lifting the crate and becomes unavailable
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (not (available ?h))
      (lifting ?h ?c)
    )
  )
)