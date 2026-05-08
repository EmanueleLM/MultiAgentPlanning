(define (domain hoist-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    truck
    hoist
    surface
    crate pallet - surface
  )
  (:predicates
    (at-truck ?t - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-surface ?s - surface ?p - place)
    (on ?c - crate ?s - surface)
    (in-truck ?c - crate ?t - truck)
    (held ?c - crate ?h - hoist)
    (clear ?s - surface)
    (hoist-free ?h - hoist)
    (connected ?p1 - place ?p2 - place)
  )

  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?tr ?from)
      (connected ?from ?to)
      (not (= ?from ?to))
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
      (clear ?c)
      (hoist-free ?h)
    )
    :effect (and
      (held ?c ?h)
      (not (on ?c ?s))
      (not (hoist-free ?h))
      (clear ?s)
    )
  )

  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (held ?c ?h)
      (clear ?s)
    )
    :effect (and
      (not (held ?c ?h))
      (on ?c ?s)
      (hoist-free ?h)
      (clear ?c)
      (not (clear ?s))
    )
  )

  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (held ?c ?h)
    )
    :effect (and
      (not (held ?c ?h))
      (in-truck ?c ?t)
      (hoist-free ?h)
      (clear ?c)
    )
  )

  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (hoist-free ?h)
      (in-truck ?c ?t)
    )
    :effect (and
      (held ?c ?h)
      (not (in-truck ?c ?t))
      (not (hoist-free ?h))
    )
  )
)