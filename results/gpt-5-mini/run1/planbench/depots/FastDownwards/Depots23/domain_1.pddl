(define (domain depots-hoist)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor
    truck
    hoist
    surface pallet crate
  )
  (:predicates
    ;; positions
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-surface ?s - surface ?p - place)

    ;; stacking / carriage
    (on ?c - crate ?s - surface)   ; crate c is on surface s (s can be pallet or crate)
    (in-truck ?c - crate ?t - truck)

    ;; hoist state and resources
    (available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; "clear" means nothing is on top of this surface (applies to pallets and crates)
    (clear ?s - surface)
  )

  ;; DRIVE: trucks can move between any two places (depots and distributors are places).
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?tr ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; HOIST LIFT FROM SURFACE: hoist picks a crate from a surface at the same place.
  (:action hoist-lift-from
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (hoist-lifting ?h ?c)
      (not (available ?h))
      (not (on ?c ?s))
      (not (at-surface ?c ?p))
      (clear ?s)
    )
  )

  ;; HOIST DROP TO SURFACE: hoist places lifted crate onto a surface at same place.
  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (clear ?s)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (hoist-lifting ?h ?c))
      (at-surface ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (not (clear ?s))
    )
  )

  ;; HOIST LOAD INTO TRUCK: hoist places lifted crate into a truck at same place.
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (in-truck ?c ?t)
      (available ?h)
      (not (hoist-lifting ?h ?c))
      (not (at-surface ?c ?p))
    )
  )

  ;; HOIST UNLOAD FROM TRUCK: hoist takes crate out of truck (hoist becomes busy and lifts crate).
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (available ?h)
      (in-truck ?c ?t)
    )
    :effect (and
      (not (in-truck ?c ?t))
      (not (available ?h))
      (hoist-lifting ?h ?c)
    )
  )
)