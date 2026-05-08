(define (domain depots_hoist_truck)
  (:requirements :typing :strips)
  (:types
    place
    depot distributor - place
    hoist truck
    surface
    pallet crate - surface
  )

  (:predicates
    ;; locations
    (at_hoist ?h - hoist ?p - place)
    (at_truck ?t - truck ?p - place)
    (at_pallet ?pa - pallet ?p - place)
    (at_crate ?c - crate ?p - place)

    ;; stacking / containment
    (on_pallet ?c - crate ?pa - pallet)
    (on_crate ?c - crate ?s - crate)

    ;; occupancy / clearance (one crate/pallet top slot)
    (clear_pallet ?pa - pallet)
    (clear_crate ?c - crate)

    ;; hoist and truck container state
    (hoist_available ?h - hoist)
    (hoist_holding ?h - hoist ?c - crate)
    (in_truck ?c - crate ?t - truck)
  )

  ;; Drive a truck from one place to another (requires truck at origin)
  (:action truck_drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (at_truck ?t ?from)
    :effect (and
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
    )
  )

  ;; Hoist lifts a crate from a pallet at a place.
  ;; Preconditions: hoist and pallet at same place, crate is on that pallet, crate clear, hoist available.
  ;; Effects: hoist holds crate, crate no longer on pallet, hoist becomes unavailable, pallet becomes clear,
  ;;          crate is no longer recorded as at the place (it is being held).
  (:action hoist_lift_from_pallet
    :parameters (?h - hoist ?c - crate ?pa - pallet ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_pallet ?pa ?p)
      (on_pallet ?c ?pa)
      (clear_crate ?c)
      (hoist_available ?h)
    )
    :effect (and
      (hoist_holding ?h ?c)
      (not (on_pallet ?c ?pa))
      (not (hoist_available ?h))
      (clear_pallet ?pa)
      (not (at_crate ?c ?p))
    )
  )

  ;; Hoist lifts a crate from another crate at a place.
  (:action hoist_lift_from_crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_crate ?s ?p)
      (on_crate ?c ?s)
      (clear_crate ?c)
      (hoist_available ?h)
    )
    :effect (and
      (hoist_holding ?h ?c)
      (not (on_crate ?c ?s))
      (not (hoist_available ?h))
      (clear_crate ?s)
      (not (at_crate ?c ?p))
    )
  )

  ;; Hoist drops a held crate onto a pallet at a place.
  (:action hoist_drop_to_pallet
    :parameters (?h - hoist ?c - crate ?pa - pallet ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (hoist_holding ?h ?c)
      (at_pallet ?pa ?p)
      (clear_pallet ?pa)
    )
    :effect (and
      (on_pallet ?c ?pa)
      (not (hoist_holding ?h ?c))
      (hoist_available ?h)
      (not (clear_pallet ?pa))
      (at_crate ?c ?p)
      (clear_crate ?c)
    )
  )

  ;; Hoist drops a held crate onto another crate at a place.
  (:action hoist_drop_to_crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (hoist_holding ?h ?c)
      (at_crate ?s ?p)
      (clear_crate ?s)
    )
    :effect (and
      (on_crate ?c ?s)
      (not (hoist_holding ?h ?c))
      (hoist_available ?h)
      (not (clear_crate ?s))
      (at_crate ?c ?p)
      (clear_crate ?c)
    )
  )

  ;; Hoist loads a held crate into a truck at a place.
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (hoist_holding ?h ?c)
    )
    :effect (and
      (in_truck ?c ?t)
      (not (hoist_holding ?h ?c))
      (hoist_available ?h)
      (not (at_crate ?c ?p))
      ;; crate inside truck is not considered clear while inside
      (not (clear_crate ?c))
    )
  )

  ;; Hoist unloads a crate from a truck and holds it at a place.
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (in_truck ?c ?t)
      (hoist_available ?h)
    )
    :effect (and
      (hoist_holding ?h ?c)
      (not (in_truck ?c ?t))
      (not (hoist_available ?h))
      (at_crate ?c ?p)
    )
  )
)