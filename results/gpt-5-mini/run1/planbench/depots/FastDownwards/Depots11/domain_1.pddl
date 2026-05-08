(define (domain depots11-hoist)
  (:requirements :strips :typing)
  (:types
    crate pallet hoist truck depot distributor
  )

  (:predicates
    ;; location of movable objects (crates, pallets, hoists, trucks) at places (depots or distributors)
    (at ?obj - (either crate pallet hoist truck) ?place - (either depot distributor))

    ;; crate stacking on pallets or other crates (support is either a pallet or a crate)
    (on ?crate - crate ?support - (either pallet crate))

    ;; crate carried inside a truck
    (in ?crate - crate ?truck - truck)

    ;; surface clearance (only meaningful for pallets and crates)
    (clear ?surf - (either pallet crate))

    ;; hoist availability and active lifting relation
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
  )

  ;; Lift a top crate from a pallet or another crate at the same place.
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?support - (either pallet crate) ?p - (either depot distributor))
    :precondition (and
      (at ?h ?p)
      (at ?support ?p)
      (on ?c ?support)
      (clear ?c)
      (available ?h)
    )
    :effect (and
      (not (on ?c ?support))
      (not (at ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?support)
    )
  )

  ;; Place a crate being lifted onto a pallet or another crate at the same place.
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?support - (either pallet crate) ?p - (either depot distributor))
    :precondition (and
      (at ?h ?p)
      (at ?support ?p)
      (lifting ?h ?c)
      (clear ?support)
    )
    :effect (and
      (on ?c ?support)
      (at ?c ?p)
      (clear ?c)
      (not (lifting ?h ?c))
      (available ?h)
      (not (clear ?support))
    )
  )

  ;; Load a crate (that the hoist is currently holding) into a co-located truck.
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - (either depot distributor))
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in ?c ?t)
      (not (lifting ?h ?c))
      (available ?h)
    )
  )

  ;; Unload a crate from a truck: hoist begins lifting the crate (crate is removed from truck).
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - (either depot distributor))
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h)
      (in ?c ?t)
    )
    :effect (and
      (not (in ?c ?t))
      (lifting ?h ?c)
      (not (available ?h))
    )
  )

  ;; Drive a truck between places (depots or distributors). Crates that are in the truck
  ;; remain 'in' and need no explicit update; only the truck location changes.
  (:action drive_truck
    :parameters (?t - truck ?from - (either depot distributor) ?to - (either depot distributor))
    :precondition (and
      (at ?t ?from)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )
)