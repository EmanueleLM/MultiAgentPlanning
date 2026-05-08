(define (domain depots17)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
      depot distributor - place
    surface
      pallet crate - surface
    hoist
    truck
    stage
  )

  (:predicates
    (at-truck ?tr - truck ?pl - place)
    (at-hoist ?h - hoist ?pl - place)
    (at-surface ?s - surface ?pl - place)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
    (in-truck ?c - crate ?tr - truck)

    (next ?t1 - stage ?t2 - stage)
    (free-hoist ?h - hoist ?t - stage)
    (hoist-holding ?h - hoist ?c - crate ?t - stage)
    (free-truck ?tr - truck ?t - stage)
  )

  (:action drive
    :parameters (?tr - truck ?from - place ?to - place ?t - stage ?t2 - stage)
    :precondition (and
      (at-truck ?tr ?from)
      (free-truck ?tr ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (free-truck ?tr ?t))
      (free-truck ?tr ?t2)
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  (:action hoist-lift-from-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?pl - place ?t - stage ?t2 - stage)
    :precondition (and
      (at-hoist ?h ?pl)
      (at-surface ?s ?pl)
      (on ?c ?s)
      (free-hoist ?h ?t)
      (clear ?c)
      (next ?t ?t2)
    )
    :effect (and
      (not (free-hoist ?h ?t))
      (hoist-holding ?h ?c ?t2)
      (not (on ?c ?s))
      (not (at-surface ?c ?pl))
      (clear ?s)
    )
  )

  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?pl - place ?t - stage ?t2 - stage)
    :precondition (and
      (at-hoist ?h ?pl)
      (at-surface ?s ?pl)
      (clear ?s)
      (hoist-holding ?h ?c ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (hoist-holding ?h ?c ?t))
      (free-hoist ?h ?t2)
      (on ?c ?s)
      (at-surface ?c ?pl)
      (not (clear ?s))
      (clear ?c)
    )
  )

  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place ?t - stage ?t2 - stage)
    :precondition (and
      (at-hoist ?h ?pl)
      (at-truck ?tr ?pl)
      (hoist-holding ?h ?c ?t)
      (free-truck ?tr ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (hoist-holding ?h ?c ?t))
      (free-hoist ?h ?t2)
      (in-truck ?c ?tr)
      (not (free-truck ?tr ?t))
      (free-truck ?tr ?t2)
      (not (at-surface ?c ?pl))
    )
  )

  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place ?t - stage ?t2 - stage)
    :precondition (and
      (at-hoist ?h ?pl)
      (at-truck ?tr ?pl)
      (free-hoist ?h ?t)
      (in-truck ?c ?tr)
      (next ?t ?t2)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (not (free-hoist ?h ?t))
      (hoist-holding ?h ?c ?t2)
    )
  )
)