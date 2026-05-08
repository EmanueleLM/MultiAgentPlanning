(define (domain depots_hoist_truck)
  (:requirements :strips :typing)
  (:types location pallet crate hoist truck)

  (:predicates
    ;; locations
    (truck_at ?t - truck ?l - location)
    (hoist_at ?h - hoist ?l - location)
    (pallet_at ?p - pallet ?l - location)
    (crate_at ?c - crate ?l - location)

    ;; support relations
    (on_pallet ?c - crate ?p - pallet)
    (on_crate ?c - crate ?c2 - crate)
    (in_truck ?c - crate ?t - truck)

    ;; hoist bookkeeping
    (hoist_available ?h - hoist)
    (hoist_holding ?h - hoist ?c - crate)

    ;; top-clearness for stacking/surfaces
    (clear_crate ?c - crate)
    (clear_pallet ?p - pallet)
  )

  ;; drive a truck between locations (requires the truck to be at the origin)
  (:action drive_truck
    :parameters (?tr - truck ?from - location ?to - location)
    :precondition (truck_at ?tr ?from)
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
    )
  )

  ;; move a free hoist between locations
  (:action move_hoist
    :parameters (?h - hoist ?from - location ?to - location)
    :precondition (and
      (hoist_at ?h ?from)
      (hoist_available ?h)
    )
    :effect (and
      (not (hoist_at ?h ?from))
      (hoist_at ?h ?to)
    )
  )

  ;; lift a crate that sits on a pallet
  (:action hoist_lift_from_pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?loc - location)
    :precondition (and
      (hoist_at ?h ?loc)
      (pallet_at ?p ?loc)
      (on_pallet ?c ?p)
      (hoist_available ?h)
      (clear_crate ?c)
    )
    :effect (and
      (not (on_pallet ?c ?p))
      (not (crate_at ?c ?loc))
      (hoist_holding ?h ?c)
      (not (hoist_available ?h))
      (clear_pallet ?p)
      (clear_crate ?c)
    )
  )

  ;; lift a crate that sits on another crate
  (:action hoist_lift_from_crate
    :parameters (?h - hoist ?c - crate ?c2 - crate ?loc - location)
    :precondition (and
      (hoist_at ?h ?loc)
      (on_crate ?c ?c2)
      (crate_at ?c2 ?loc)
      (hoist_available ?h)
      (clear_crate ?c)
    )
    :effect (and
      (not (on_crate ?c ?c2))
      (not (crate_at ?c ?loc))
      (hoist_holding ?h ?c)
      (not (hoist_available ?h))
      (clear_crate ?c2)
      (clear_crate ?c)
    )
  )

  ;; generic lift from a location/surface when crate is explicitly at location and not on a tracked surface
  (:action hoist_lift_from_location
    :parameters (?h - hoist ?c - crate ?loc - location)
    :precondition (and
      (hoist_at ?h ?loc)
      (crate_at ?c ?loc)
      (hoist_available ?h)
      (clear_crate ?c)
    )
    :effect (and
      (not (crate_at ?c ?loc))
      (hoist_holding ?h ?c)
      (not (hoist_available ?h))
      (clear_crate ?c)
    )
  )

  ;; drop a held crate to a pallet at the same location
  (:action hoist_drop_to_pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?loc - location)
    :precondition (and
      (hoist_at ?h ?loc)
      (pallet_at ?p ?loc)
      (hoist_holding ?h ?c)
      (clear_pallet ?p)
    )
    :effect (and
      (on_pallet ?c ?p)
      (crate_at ?c ?loc)
      (not (hoist_holding ?h ?c))
      (hoist_available ?h)
      (not (clear_pallet ?p))
      (clear_crate ?c)
    )
  )

  ;; drop a held crate onto another crate at the same location
  (:action hoist_drop_to_crate
    :parameters (?h - hoist ?c - crate ?c2 - crate ?loc - location)
    :precondition (and
      (hoist_at ?h ?loc)
      (crate_at ?c2 ?loc)
      (hoist_holding ?h ?c)
      (clear_crate ?c2)
    )
    :effect (and
      (on_crate ?c ?c2)
      (crate_at ?c ?loc)
      (not (hoist_holding ?h ?c))
      (hoist_available ?h)
      (not (clear_crate ?c2))
      (clear_crate ?c)
    )
  )

  ;; load a held crate into a truck at the same location
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?loc - location)
    :precondition (and
      (hoist_at ?h ?loc)
      (truck_at ?tr ?loc)
      (hoist_holding ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (not (hoist_holding ?h ?c))
      (hoist_available ?h)
      (not (crate_at ?c ?loc))
      (clear_crate ?c)
    )
  )

  ;; unload a crate from a truck: hoist must be available and co-located with the truck
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?loc - location)
    :precondition (and
      (hoist_at ?h ?loc)
      (truck_at ?tr ?loc)
      (in_truck ?c ?tr)
      (hoist_available ?h)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (hoist_holding ?h ?c)
      (not (hoist_available ?h))
    )
  )
)