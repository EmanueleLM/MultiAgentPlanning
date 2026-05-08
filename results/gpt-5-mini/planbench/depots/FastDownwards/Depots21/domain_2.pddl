(define (domain multiagent_hoist_truck)
  (:requirements :strips :typing :negative-preconditions)
  (:types place truck hoist pallet crate)

  (:predicates
    ;; Locations
    (truck_at ?t - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (pallet_at ?pl - pallet ?p - place)
    (crate_at ?c - crate ?p - place)

    ;; stacking / containment
    (on_pallet ?c - crate ?pl - pallet)
    (on_crate ?c - crate ?under - crate)
    (in_truck ?c - crate ?t - truck)
    (holding ?h - hoist ?c - crate)

    ;; resource / state flags
    (hoist_available ?h - hoist)
    (clear_pallet ?pl - pallet)
    (clear_crate ?c - crate)
  )

  ;; Drive a truck from one place to another (must be at origin)
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (truck_at ?tr ?from)
      (not (truck_at ?tr ?to))
    )
    :effect (and
      (truck_at ?tr ?to)
      (not (truck_at ?tr ?from))
    )
  )

  ;; Lift a crate from a pallet with a hoist at the same place
  (:action hoist_operator-lift_pallet
    :parameters (?h - hoist ?c - crate ?pl - pallet ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (pallet_at ?pl ?p)
      (crate_at ?c ?p)
      (on_pallet ?c ?pl)
      (hoist_available ?h)
      (clear_crate ?c)
    )
    :effect (and
      (holding ?h ?c)
      (not (hoist_available ?h))
      (not (on_pallet ?c ?pl))
      (not (crate_at ?c ?p))
      (clear_pallet ?pl)
      (clear_crate ?c)
    )
  )

  ;; Lift a crate from another crate with a hoist at the same place
  (:action hoist_operator-lift_crate
    :parameters (?h - hoist ?c - crate ?under - crate ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (crate_at ?under ?p)
      (crate_at ?c ?p)
      (on_crate ?c ?under)
      (hoist_available ?h)
      (clear_crate ?c)
    )
    :effect (and
      (holding ?h ?c)
      (not (hoist_available ?h))
      (not (on_crate ?c ?under))
      (not (crate_at ?c ?p))
      (clear_crate ?under)
      (clear_crate ?c)
    )
  )

  ;; Drop a held crate from a hoist onto a pallet at the same place
  (:action hoist_operator-drop_pallet
    :parameters (?h - hoist ?c - crate ?pl - pallet ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (pallet_at ?pl ?p)
      (holding ?h ?c)
      (clear_pallet ?pl)
    )
    :effect (and
      (hoist_available ?h)
      (not (holding ?h ?c))
      (crate_at ?c ?p)
      (on_pallet ?c ?pl)
      (clear_crate ?c)
      (not (clear_pallet ?pl))
    )
  )

  ;; Drop a held crate from a hoist onto another crate at the same place
  (:action hoist_operator-drop_crate
    :parameters (?h - hoist ?c - crate ?under - crate ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (crate_at ?under ?p)
      (holding ?h ?c)
      (clear_crate ?under)
    )
    :effect (and
      (hoist_available ?h)
      (not (holding ?h ?c))
      (crate_at ?c ?p)
      (on_crate ?c ?under)
      (clear_crate ?c)
      (not (clear_crate ?under))
    )
  )

  ;; Load a held crate into a truck at the same place
  (:action hoist_operator-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?tr ?p)
      (holding ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (hoist_available ?h)
      (not (holding ?h ?c))
      (not (crate_at ?c ?p))
      (clear_crate ?c)
    )
  )

  ;; Unload a crate from a truck: hoist becomes busy and holds the crate
  (:action hoist_operator-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?tr ?p)
      (hoist_available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (holding ?h ?c)
      (not (in_truck ?c ?tr))
      (not (hoist_available ?h))
      (clear_crate ?c)
    )
  )
)