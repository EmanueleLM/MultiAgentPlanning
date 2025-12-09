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
  )

  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?tr ?from)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (holding ?h ?c)
      (not (on ?c ?s))
      (not (available ?h))
      (clear ?s)
    )
  )

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
      (available ?h)
      (clear ?c)
      (not (holding ?h ?c))
      (not (clear ?s))
    )
  )

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
    )
  )

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