(define (domain depots-hoist-truck)
  (:requirements :typing :strips :negative-preconditions)
  (:types
    place
    surface
    depot distributor - place
    pallet crate - surface
    hoist truck
  )

  (:predicates
    (hoist-at ?h - hoist ?p - place)
    (truck-at ?t - truck ?p - place)
    (surface-at ?s - surface ?p - place)
    (on ?c - crate ?s - surface)
    (in-truck ?c - crate ?t - truck)
    (hoist-lifting ?h - hoist ?c - crate)
    (hoist-available ?h - hoist)
    (clear ?s - surface)
    (road ?p - place ?q - place)
  )

  (:action truck-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (truck-at ?tr ?from)
      (road ?from ?to)
    )
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
    )
  )

  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?s ?p)
      (surface-at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist-available ?h)
    )
    :effect (and
      (hoist-lifting ?h ?c)
      (clear ?s)
      (not (hoist-available ?h))
      (not (on ?c ?s))
      (not (surface-at ?c ?p))
    )
  )

  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-lifting ?h ?c)
      (surface-at ?s ?p)
      (clear ?s)
    )
    :effect (and
      (on ?c ?s)
      (surface-at ?c ?p)
      (hoist-available ?h)
      (clear ?c)
      (not (hoist-lifting ?h ?c))
      (not (clear ?s))
    )
  )

  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?t ?p)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (in-truck ?c ?t)
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
      (not (surface-at ?c ?p))
    )
  )

  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?t ?p)
      (in-truck ?c ?t)
      (hoist-available ?h)
    )
    :effect (and
      (hoist-lifting ?h ?c)
      (surface-at ?c ?p)
      (not (in-truck ?c ?t))
      (not (hoist-available ?h))
    )
  )
)