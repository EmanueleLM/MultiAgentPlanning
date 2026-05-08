(define (domain depots11-hoist)
  (:requirements :strips :typing)
  (:types
    locatable place
    surface - locatable
    crate pallet - surface
    hoist truck - locatable
    depot distributor - place
  )

  (:predicates
    ;; a locatable object (crate, pallet, hoist, truck) is at a place (depot or distributor)
    (at ?obj - locatable ?p - place)

    ;; crate stacked on a surface (pallet or crate)
    (on ?c - crate ?s - surface)

    ;; crate is inside a truck
    (in ?c - crate ?t - truck)

    ;; surface is free to receive a crate (no crate on top)
    (clear ?s - surface)

    ;; hoist available or hoist is currently lifting a crate
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
  )

  ;; Lift a top crate from a support (pallet or crate) at the same place.
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?support - surface ?p - place)
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

  ;; Drop a crate being lifted by a hoist onto a support at the same place.
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?support - surface ?p - place)
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

  ;; Load a crate that the hoist is currently holding into a co-located truck.
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in ?c ?t)
      (not (lifting ?h ?c))
      (available ?h)
      (not (at ?c ?p))
    )
  )

  ;; Unload a crate from a truck: hoist begins lifting the crate (crate removed from truck).
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
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
      (not (at ?c ?p))
    )
  )

  ;; Drive a truck between places (depots or distributors). Truck must be at origin.
  (:action drive_truck
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at ?t ?from)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )
)