(define (domain depots_instance_fixed)
  (:requirements :strips :typing)
  (:types
    place depot distributor - place
    truck hoist pallet crate
  )

  (:predicates
    ;; location predicates
    (at_truck ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_pallet ?pl - pallet ?p - place)
    (at_crate ?c - crate ?p - place)

    ;; stacking relations
    (on_pallet ?c - crate ?pl - pallet)
    (on_crate ?c - crate ?s - crate)

    ;; crate in truck
    (in_truck ?c - crate ?t - truck)

    ;; clear flags
    (clear_pallet ?pl - pallet)
    (clear_crate ?c - crate)

    ;; hoist status
    (hoist_available ?h - hoist)
    (hoist_holding ?h - hoist ?c - crate)
  )

  ;; drive a truck from one place to another (roads fully connected in this instance)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at_truck ?tr ?from)
    )
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a pallet at a place
  (:action hoist_lift_from_pallet
    :parameters (?h - hoist ?c - crate ?pl - pallet ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_pallet ?pl ?p)
      (on_pallet ?c ?pl)
      (at_crate ?c ?p)
      (hoist_available ?h)
      (clear_crate ?c)
    )
    :effect (and
      (not (on_pallet ?c ?pl))
      (not (at_crate ?c ?p))
      (not (hoist_available ?h))
      (hoist_holding ?h ?c)
      (clear_pallet ?pl)
    )
  )

  ;; hoist lifts a crate from another crate at a place
  (:action hoist_lift_from_crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_crate ?s ?p)
      (on_crate ?c ?s)
      (at_crate ?c ?p)
      (hoist_available ?h)
      (clear_crate ?c)
    )
    :effect (and
      (not (on_crate ?c ?s))
      (not (at_crate ?c ?p))
      (not (hoist_available ?h))
      (hoist_holding ?h ?c)
      (clear_crate ?s)
    )
  )

  ;; hoist drops a held crate onto a pallet at the same place
  (:action hoist_drop_to_pallet
    :parameters (?h - hoist ?c - crate ?pl - pallet ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_pallet ?pl ?p)
      (hoist_holding ?h ?c)
      (clear_pallet ?pl)
    )
    :effect (and
      (not (hoist_holding ?h ?c))
      (hoist_available ?h)
      (at_crate ?c ?p)
      (on_pallet ?c ?pl)
      (clear_crate ?c)
      (not (clear_pallet ?pl))
    )
  )

  ;; hoist drops a held crate onto another crate at the same place
  (:action hoist_drop_to_crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_crate ?s ?p)
      (hoist_holding ?h ?c)
      (clear_crate ?s)
    )
    :effect (and
      (not (hoist_holding ?h ?c))
      (hoist_available ?h)
      (at_crate ?c ?p)
      (on_crate ?c ?s)
      (clear_crate ?c)
      (not (clear_crate ?s))
    )
  )

  ;; hoist loads a held crate into a truck at the same place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (hoist_holding ?h ?c)
    )
    :effect (and
      (not (hoist_holding ?h ?c))
      (in_truck ?c ?t)
      (hoist_available ?h)
      (not (at_crate ?c ?p))
    )
  )

  ;; hoist unloads a crate from a truck: hoist must be available and co-located with truck
  ;; result: crate removed from truck and hoist holds it (hoist becomes not available)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (hoist_available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (not (hoist_available ?h))
      (hoist_holding ?h ?c)
    )
  )
)