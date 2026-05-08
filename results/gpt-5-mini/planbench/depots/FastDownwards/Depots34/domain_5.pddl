(define (domain depots_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
      depot distributor - place
    surface
      pallet crate - surface
    truck
    hoist
  )

  (:predicates
    ;; location predicates separated by object kind for clarity and stronger typing
    (at_truck ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_surface ?s - surface ?p - place)

    ;; stacking and containment
    (on ?c - crate ?s - surface)
    (in ?c - crate ?t - truck)

    ;; hoist state
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; whether a surface (which may be a pallet or crate) has nothing on top
    (clear ?s - surface)
  )

  ;; drive a truck between places (roads exist between any two places in this instance)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at_truck ?tr ?from)
      (not (at_truck ?tr ?to))
    )
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  ;; lift a crate from a surface using a hoist
  (:action lift_by_hoist
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (at_surface ?c ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at_surface ?c ?p))
      (not (on ?c ?s))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
    )
  )

  ;; drop a crate from a hoist to a surface at a place
  (:action drop_by_hoist
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at_surface ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  ;; load a lifted crate into a truck (hoist must be lifting the crate and truck at same place)
  (:action load_by_hoist
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in ?c ?t)
      (not (lifting ?h ?c))
      (available ?h)
      (not (at_surface ?c ?p))
      (clear ?c)
    )
  )

  ;; unload a crate from a truck using a hoist (hoist becomes busy lifting the crate)
  (:action unload_by_hoist
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (available ?h)
      (in ?c ?t)
    )
    :effect (and
      (not (in ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
      ;; ensure the crate is not simultaneously recorded at the place while being lifted
      (not (at_surface ?c ?p))
    )
  )
)