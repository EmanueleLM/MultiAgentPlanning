(define (domain depots20)
  (:requirements :strips :typing :negative-preconditions)
  (:types place hoist truck pallet crate)

  (:predicates
    ;; locations
    (hoist_at ?h - hoist ?p - place)
    (truck_at ?t - truck ?p - place)
    (pallet_at ?s - pallet ?p - place)
    (crate_at ?c - crate ?p - place)

    ;; stacking and containment
    (on ?c - crate ?s - pallet)        ;; crate on pallet
    (in_truck ?c - crate ?t - truck)  ;; crate inside truck

    ;; clearance and resources
    (clear_pallet ?s - pallet)        ;; pallet has no crate on it
    (clear_crate ?c - crate)          ;; no crate stacked on top of this crate (used by lift)
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)
  )

  ;; drive a truck from one place to another (roads fully connected)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (truck_at ?tr ?from))
    :effect (and (not (truck_at ?tr ?from)) (truck_at ?tr ?to))
  )

  ;; lift a crate from a pallet at a place using a hoist
  (:action hoist_lift_from_pallet
    :parameters (?h - hoist ?c - crate ?s - pallet ?p - place)
    :precondition
      (and
        (hoist_at ?h ?p)
        (hoist_available ?h)
        (crate_at ?c ?p)
        (on ?c ?s)
        (pallet_at ?s ?p)
        (clear_crate ?c)
      )
    :effect
      (and
        (not (on ?c ?s))
        (not (crate_at ?c ?p))
        (hoist_lifting ?h ?c)
        (not (hoist_available ?h))
        (clear_pallet ?s)
      )
  )

  ;; drop a hoisted crate onto a pallet at the same place
  (:action hoist_drop_to_pallet
    :parameters (?h - hoist ?c - crate ?s - pallet ?p - place)
    :precondition
      (and
        (hoist_at ?h ?p)
        (pallet_at ?s ?p)
        (clear_pallet ?s)
        (hoist_lifting ?h ?c)
      )
    :effect
      (and
        (hoist_available ?h)
        (not (hoist_lifting ?h ?c))
        (crate_at ?c ?p)
        (not (clear_pallet ?s))
        (clear_crate ?c)
        (on ?c ?s)
      )
  )

  ;; load a hoisted crate into a truck at the same place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition
      (and
        (hoist_at ?h ?p)
        (truck_at ?tr ?p)
        (hoist_lifting ?h ?c)
      )
    :effect
      (and
        (in_truck ?c ?tr)
        (hoist_available ?h)
        (not (hoist_lifting ?h ?c))
      )
  )

  ;; unload a crate from a truck using a hoist at the truck's place
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition
      (and
        (hoist_at ?h ?p)
        (truck_at ?tr ?p)
        (hoist_available ?h)
        (in_truck ?c ?tr)
      )
    :effect
      (and
        (not (in_truck ?c ?tr))
        (not (hoist_available ?h))
        (hoist_lifting ?h ?c)
      )
  )
)