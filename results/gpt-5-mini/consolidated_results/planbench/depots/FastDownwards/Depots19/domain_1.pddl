(define (domain hoist-truck-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
      depot distributor - place
    surface
      pallet crate - surface
    hoist truck
  )

  (:predicates
    ;; locations
    (at-hoist ?h - hoist ?p - place)
    (at-truck ?t - truck ?p - place)
    (at-surface ?s - surface ?p - place)

    ;; stacking / containment
    (on ?c - crate ?s - surface)
    (in-truck ?c - crate ?t - truck)

    ;; hoist state
    (holding ?h - hoist ?c - crate)
    (available ?h - hoist)

    ;; whether a surface (pallet or crate) has nothing on top
    (clear ?s - surface)

    ;; connectivity between places (symmetric facts are asserted in the problem)
    (connected ?p1 - place ?p2 - place)
  )

  ;; Truck-driving action
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?tr ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; Hoist lifts a crate from a surface at the same place.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (at-surface ?c ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (holding ?h ?c)
      (not (on ?c ?s))
      (not (at-surface ?c ?p))
      (not (available ?h))
      (clear ?s)
    )
  )

  ;; Hoist drops a crate onto a surface at the same place.
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (holding ?h ?c)
      (at-surface ?s ?p)
      (clear ?s)
    )
    :effect (and
      (on ?c ?s)
      (at-surface ?c ?p)
      (available ?h)
      (clear ?c)
      (not (holding ?h ?c))
      (not (clear ?s))
    )
  )

  ;; Hoist loads a held crate into a truck at the same place.
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (holding ?h ?c)
      (at-truck ?t ?p)
    )
    :effect (and
      (in-truck ?c ?t)
      (available ?h)
      (not (holding ?h ?c))
      (not (at-surface ?c ?p))
    )
  )

  ;; Hoist unloads a crate from a truck and holds it.
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (in-truck ?c ?t)
      (available ?h)
    )
    :effect (and
      (holding ?h ?c)
      (not (in-truck ?c ?t))
      (not (available ?h))
    )
  )
)