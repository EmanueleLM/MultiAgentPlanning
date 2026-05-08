(define (domain depots6)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place surface truck hoist
    depot distributor - place
    pallet crate - surface
  )

  (:predicates
    (at-truck ?v - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-surface ?s - surface ?p - place)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)
    (in-truck ?c - crate ?v - truck)
  )

  (:action drive
    :parameters (?v - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?v ?from)
    )
    :effect (and
      (not (at-truck ?v ?from))
      (at-truck ?v ?to)
    )
  )

  (:action hoist-lift-from-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (on ?c ?s)
      (hoist-available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at-surface ?c ?p))
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (clear ?s)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
      (at-surface ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?v - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?v ?p)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (in-truck ?c ?v)
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
      (not (at-surface ?c ?p))
    )
  )

  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?v - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?v ?p)
      (hoist-available ?h)
      (in-truck ?c ?v)
    )
    :effect (and
      (not (in-truck ?c ?v))
      (not (hoist-available ?h))
      (hoist-lifting ?h ?c)
    )
  )
)