(define (domain hoist-truck-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    obj place
    truck hoist crate pallet - obj
  )

  (:predicates
    (at ?o - obj ?p - place)
    (road ?p - place ?q - place)
    (available ?h - hoist)
    (holding ?h - hoist ?c - crate)
    (in ?c - crate ?t - truck)
    (on ?c - crate ?s - obj)
    (clear ?x - obj)
    (reserved ?c - crate)
    (hoist-holding-at ?p - place)
    (place-allowed ?p - place)
  )

  (:action truck-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (place-allowed ?from)
      (place-allowed ?to)
      (road ?from ?to)
      (not (hoist-holding-at ?from))
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  (:action hoist-lift-from-surface
    :parameters (?h - hoist ?c - crate ?s - obj ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?c ?p)
      (on ?c ?s)
      (at ?s ?p)
      (available ?h)
      (clear ?c)
      (not (reserved ?c))
    )
    :effect (and
      (not (available ?h))
      (holding ?h ?c)
      (reserved ?c)
      (not (on ?c ?s))
      (clear ?s)
      (not (at ?c ?p))
      (hoist-holding-at ?p)
    )
  )

  (:action hoist-lift-from-place
    :parameters (?h - hoist ?c - crate ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?c ?p)
      (available ?h)
      (clear ?c)
      (not (reserved ?c))
    )
    :effect (and
      (not (available ?h))
      (holding ?h ?c)
      (reserved ?c)
      (not (at ?c ?p))
      (hoist-holding-at ?p)
    )
  )

  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (holding ?h ?c)
    )
    :effect (and
      (in ?c ?t)
      (not (holding ?h ?c))
      (available ?h)
      (not (hoist-holding-at ?p))
      (not (reserved ?c))
    )
  )

  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h)
      (in ?c ?t)
    )
    :effect (and
      (not (in ?c ?t))
      (holding ?h ?c)
      (not (available ?h))
      (reserved ?c)
      (hoist-holding-at ?p)
    )
  )

  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - obj ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (holding ?h ?c)
      (clear ?s)
    )
    :effect (and
      (not (holding ?h ?c))
      (available ?h)
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (not (clear ?s))
      (not (hoist-holding-at ?p))
      (not (reserved ?c))
    )
  )
)