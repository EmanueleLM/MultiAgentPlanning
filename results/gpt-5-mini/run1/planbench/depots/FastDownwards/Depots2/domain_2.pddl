(define (domain depots)
  (:requirements :strips :typing :negative-preconditions)
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
    (at_truck ?t - truck ?p - place)        ; truck location
    (at_surface ?s - surface ?p - place)    ; surface or crate recorded at place
    (hoist_at ?h - hoist ?p - place)        ; hoist location

    ;; Stacking and occupancy
    (on ?c - crate ?s - surface)            ; crate c is directly on surface s
    (clear ?s - surface)                    ; nothing on top of surface s

    ;; Hoist state
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)   ; hoist h is currently lifting crate c

    ;; Truck contents
    (in_truck ?c - crate ?t - truck)
  )

  ;; Driving a truck between places (driver actions namespace)
  (:action driver_drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and (at_truck ?t ?from))
    :effect (and
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
    )
  )

  ;; Hoist operations (hoist_operator namespace)

  ;; Lift a crate from a surface at the same place.
  ;; Requires hoist and surface at same place, crate on that surface, hoist available, crate clear.
  ;; Effects: hoist holds the crate, hoist becomes unavailable, crate no longer recorded at place or on the surface,
  ;; previous surface becomes clear.
  (:action hoist_op_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at_surface ?s ?p)
      (on ?c ?s)
      (at_surface ?c ?p)          ;; explicit recorded crate location
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
  ;; Requires hoist and target surface at same place, surface clear, hoist lifting that crate.
  ;; Effects: crate placed on surface, crate recorded at place, surface becomes not clear, crate becomes clear, hoist freed.
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
  ;; Requires hoist at place, truck at place, hoist lifting crate.
  ;; Effects: crate becomes in truck, hoist freed and stops lifting.
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
  ;; Requires hoist and truck at same place, hoist available, crate in truck.
  ;; Effects: crate removed from truck, hoist holds crate, hoist becomes unavailable.
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

  ;; Move a hoist between places (explicit movement for hoists).
  (:action hoist_op_move
    :parameters (?h - hoist ?from - place ?to - place)
    :precondition (and (hoist_at ?h ?from))
    :effect (and
      (not (hoist_at ?h ?from))
      (hoist_at ?h ?to)
    )
  )
)