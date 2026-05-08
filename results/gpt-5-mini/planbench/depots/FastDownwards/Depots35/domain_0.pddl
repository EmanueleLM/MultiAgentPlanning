(define (domain jack_of_all_trades)
  (:requirements :typing :negative-preconditions :strips)
  (:types
    place truck hoist surface
    depot distributor - place
    pallet crate - surface
  )

  (:predicates
    ;; locations
    (truck_at ?tr - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (surface_at ?s - surface ?p - place)    ;; pallets (and surfaces, crates as surfaces if used)
    (crate_at ?c - crate ?p - place)

    ;; stacking/support
    (on ?c - crate ?s - surface)
    (clear ?x - surface)

    ;; hoist state
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)

    ;; truck contents
    (in_truck ?c - crate ?tr - truck)
  )

  ;; drive a truck between any two places (depots and distributors are directly connected)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (truck_at ?tr ?from)
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
    )
  )

  ;; lift a crate from a surface at a place with a hoist
  (:action lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (surface_at ?s ?p)
      (crate_at ?c ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (not (crate_at ?c ?p))
      (not (on ?c ?s))
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
    )
  )

  ;; drop a crate from a hoist to a surface at a place
  (:action drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (surface_at ?s ?p)
      (hoist_lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (crate_at ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  ;; load a crate being lifted into a truck at the same place
  ;; (effects inferred: crate goes into truck, hoist becomes available, hoist stops lifting)
  (:action load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?tr ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (not (hoist_lifting ?h ?c))
      (hoist_available ?h)
    )
  )

  ;; unload a crate from a truck by a hoist at the truck's place
  (:action unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?tr ?p)
      (hoist_available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (not (hoist_available ?h))
      (hoist_lifting ?h ?c)
    )
  )
)