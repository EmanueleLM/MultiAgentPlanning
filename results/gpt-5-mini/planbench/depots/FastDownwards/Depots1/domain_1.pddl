(define (domain depots1)
  (:requirements :strips :typing)
  (:types
    depot distributor - place
    pallet crate - surface
    hoist truck
  )

  (:predicates
    ;; locations
    (at_vehicle ?v - (either hoist truck) ?p - place)
    (at_place ?s - surface ?p - place)

    ;; hoist state
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; crate in truck
    (in ?c - crate ?t - truck)

    ;; stacking/support
    (clear ?s - surface)
    (on ?c - crate ?s - surface)
  )

  ;; Driver actions
  (:action driver_drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at_vehicle ?tr ?from))
    :effect (and (not (at_vehicle ?tr ?from)) (at_vehicle ?tr ?to))
  )

  ;; Loader / hoist actions

  ;; Lift a crate from a surface at a place
  (:action loader_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_vehicle ?h ?p)
      (at_place ?s ?p)
      (at_place ?c ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at_place ?c ?p))
      (not (on ?c ?s))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
      (not (clear ?c))
    )
  )

  ;; Drop a crate from a hoist to a surface at the same place
  (:action loader_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (lifting ?h ?c)
      (at_vehicle ?h ?p)
      (at_place ?s ?p)
      (clear ?s)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (at_place ?c ?p)
      (on ?c ?s)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; Load a crate (the hoist places the crate into a truck)
  (:action loader_load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (lifting ?h ?c)
      (at_vehicle ?h ?p)
      (at_vehicle ?t ?p)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (in ?c ?t)
      (not (at_place ?c ?p))
      (not (clear ?c))
    )
  )

  ;; Unload a crate from a truck: hoist picks crate out of truck (hoist becomes busy)
  (:action loader_unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (available ?h)
      (at_vehicle ?h ?p)
      (at_vehicle ?t ?p)
      (in ?c ?t)
    )
    :effect (and
      (not (in ?c ?t))
      (lifting ?h ?c)
      (not (available ?h))
      (not (clear ?c))
    )
  )
)