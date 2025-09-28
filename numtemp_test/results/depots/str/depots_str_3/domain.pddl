(define (domain multiagent-hoist-truck)
  (:requirements :strips :typing :equality :negative-preconditions :conditional-effects :quantified-preconditions :disjunctive-preconditions)
  (:types
    place
    truck
    hoist
    surface
    pallet crate - surface
  )

  (:predicates
    (truck-at ?tr - truck ?pl - place)
    (hoist-at ?h - hoist ?pl - place)
    (surface-at ?s - surface ?pl - place)
    (on ?c - crate ?s - surface)
    (in ?c - crate ?tr - truck)
    (hoist-available ?h - hoist)
    (hoist-holding ?h - hoist ?c - crate)
    (clear ?s - surface)
  )

  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (truck-at ?tr ?from)
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
    )
  )

  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?pl - place)
    :precondition (and
      (hoist-at ?h ?pl)
      (hoist-available ?h)
      (surface-at ?s ?pl)
      (on ?c ?s)
      (clear ?c)
    )
    :effect (and
      (not (hoist-available ?h))
      (hoist-holding ?h ?c)
      (not (on ?c ?s))
      (clear ?s)
      (not (clear ?c))
      (not (surface-at ?c ?pl))
    )
  )

  (:action hoist-place
    :parameters (?h - hoist ?c - crate ?s - surface ?pl - place)
    :precondition (and
      (hoist-at ?h ?pl)
      (hoist-holding ?h ?c)
      (surface-at ?s ?pl)
      (clear ?s)
    )
    :effect (and
      (hoist-available ?h)
      (not (hoist-holding ?h ?c))
      (on ?c ?s)
      (not (clear ?s))
      (clear ?c)
      (surface-at ?c ?pl)
    )
  )

  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :precondition (and
      (hoist-at ?h ?pl)
      (hoist-holding ?h ?c)
      (truck-at ?tr ?pl)
    )
    :effect (and
      (hoist-available ?h)
      (not (hoist-holding ?h ?c))
      (in ?c ?tr)
      (clear ?c)
      (not (surface-at ?c ?pl))
    )
  )

  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?s - surface ?pl - place)
    :precondition (and
      (hoist-at ?h ?pl)
      (hoist-available ?h)
      (truck-at ?tr ?pl)
      (in ?c ?tr)
      (surface-at ?s ?pl)
      (clear ?s)
    )
    :effect (and
      (not (in ?c ?tr))
      (not (hoist-available ?h))
      (hoist-holding ?h ?c)
      (not (clear ?s))
      (not (clear ?c))
      (on ?c ?s)
      (surface-at ?c ?pl)
    )
  )
)