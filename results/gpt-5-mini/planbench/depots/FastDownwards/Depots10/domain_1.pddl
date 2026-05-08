(define (domain depots10)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    obj
    place depot distributor - place
    surface - obj
    pallet - surface
    crate - surface
    truck hoist - obj
  )

  (:predicates
    ;; generic location for movable objects and surfaces (pallets, crates, trucks, hoists)
    (at ?x - obj ?p - place)

    ;; stacking / supporting: crate on a surface (surface can be pallet OR crate)
    (on ?c - crate ?s - surface)

    ;; crate inside a truck
    (in ?c - crate ?t - truck)

    ;; crate-specific clear flag (no crate on top of it)
    (clear ?c - crate)

    ;; surface free to receive a crate
    (surface-clear ?s - surface)

    ;; hoist state
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
  )

  ;; Drive action for trucks (logistics agent)
  (:action logistics-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at ?tr ?from)
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; Hoist actions (hoist operator)
  ;; Lift a crate from a surface at a place, making the hoist hold it.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at ?c ?p))
      (not (on ?c ?s))
      (lifting ?h ?c)
      (not (available ?h))
      (surface-clear ?s)
    )
  )

  ;; Drop a crate held by a hoist onto a surface at the same place.
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (surface-clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (available ?h)
      (not (lifting ?h ?c))
      (not (surface-clear ?s))
    )
  )

  ;; Load a crate held by the hoist into a truck at the same place.
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in ?c ?tr)
      (available ?h)
      (not (lifting ?h ?c))
      (not (at ?c ?p))
    )
  )

  ;; Unload a crate from a truck into the hoist (hoist must be available).
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (available ?h)
      (in ?c ?tr)
    )
    :effect (and
      (not (in ?c ?tr))
      (lifting ?h ?c)
      (not (available ?h))
    )
  )
)