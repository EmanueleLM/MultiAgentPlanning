(define (domain multiagent_logistics)
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
    (road-connects ?p1 - place ?p2 - place)

    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-surface ?s - surface ?p - place)

    (on ?c - crate ?s - surface)
    (in-truck ?c - crate ?t - truck)
    (holding ?h - hoist ?c - crate)

    (clear ?s - surface)
    (free-hoist ?h - hoist)
  )

  (:action truck_coordinator-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?tr ?from)
      (road-connects ?from ?to)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  (:action hoist_manager-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (free-hoist ?h)
    )
    :effect (and
      (holding ?h ?c)
      (not (on ?c ?s))
      (not (free-hoist ?h))
      (clear ?s)
      (not (at-surface ?c ?p))
    )
  )

  (:action hoist_manager-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (holding ?h ?c)
      (clear ?s)
    )
    :effect (and
      (not (holding ?h ?c))
      (on ?c ?s)
      (free-hoist ?h)
      (not (clear ?s))
      (clear ?c)
      (at-surface ?c ?p)
    )
  )

  (:action hoist_manager-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (holding ?h ?c)
    )
    :effect (and
      (not (holding ?h ?c))
      (in-truck ?c ?t)
      (free-hoist ?h)
    )
  )

  (:action hoist_manager-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (in-truck ?c ?t)
      (free-hoist ?h)
    )
    :effect (and
      (holding ?h ?c)
      (not (in-truck ?c ?t))
      (not (free-hoist ?h))
    )
  )
)