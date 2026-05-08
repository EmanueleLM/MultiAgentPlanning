(define (domain depots)
  (:requirements :typing :negative-preconditions)
  (:types
    place
    surface
    pallet - surface
    crate - surface
    hoist
    truck
  )

  (:predicates
    ;; Locations
    (at_truck ?t - truck ?p - place)
    (at_surface ?s - surface ?p - place)
    (hoist_at ?h - hoist ?p - place)

    ;; Stacking and occupancy
    (on ?c - crate ?s - surface)
    (clear ?s - surface)

    ;; Hoist state
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)

    ;; Truck contents
    (in_truck ?c - crate ?t - truck)
  )

  ;; Driving a truck between places
  (:action driver_drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and (at_truck ?t ?from))
    :effect (and
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
    )
  )

  ;; Lift a crate from a surface at the same place.
  (:action hoist_op_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at_surface ?s ?p)
      (on ?c ?s)
      (at_surface ?c ?p)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
      (not (on ?c ?s))
      (not (at_surface ?c ?p))
      (clear ?s)
    )
  )

  ;; Drop a lifted crate onto a surface at the same place.
  (:action hoist_op_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at_surface ?s ?p)
      (hoist_lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      (on ?c ?s)
      (at_surface ?c ?p)
      (clear ?c)
      (not (clear ?s))
      (not (hoist_lifting ?h ?c))
      (hoist_available ?h)
    )
  )

  ;; Load a lifted crate into a truck at the same place.
  (:action hoist_op_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at_truck ?t ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?t)
      (not (hoist_lifting ?h ?c))
      (hoist_available ?h)
    )
  )

  ;; Unload a crate from a truck: hoist takes crate out of truck and holds it.
  (:action hoist_op_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at_truck ?t ?p)
      (hoist_available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
    )
  )

  ;; Move a hoist between places. If the hoist is lifting a crate the crate remains associated
  ;; with the hoist through the hoist_lifting predicate (no additional bookkeeping needed here).
  (:action hoist_op_move
    :parameters (?h - hoist ?from - place ?to - place)
    :precondition (and (hoist_at ?h ?from))
    :effect (and
      (not (hoist_at ?h ?from))
      (hoist_at ?h ?to)
    )
  )
)