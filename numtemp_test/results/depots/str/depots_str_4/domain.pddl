(define (domain hoist-truck-multiagent)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types
    truck hoist - object
    surface - object
    crate pallet - surface
    place - object
  )

  (:predicates
    (at ?x - object ?p - place)
    (on ?top - crate ?bottom - surface)
    (in ?c - crate ?t - truck)
    (clear ?s - surface)
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)
  )

  (:action hoist-lift-from-surface
    :parameters (?h - hoist ?c - crate ?b - surface ?p - place)
    :precondition (and
      (hoist-available ?h)
      (at ?h ?p)
      (on ?c ?b)
      (at ?b ?p)
      (at ?c ?p)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?b))
      (not (hoist-available ?h))
      (hoist-lifting ?h ?c)
      (clear ?b)
      (not (at ?c ?p))
      (clear ?c)
    )
  )

  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?b - surface ?p - place)
    :precondition (and
      (hoist-lifting ?h ?c)
      (at ?h ?p)
      (at ?b ?p)
      (clear ?b)
    )
    :effect (and
      (on ?c ?b)
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)
      (at ?c ?p)
      (not (clear ?b))
      (clear ?c)
    )
  )

  (:action hoist-lift-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist-available ?h)
      (at ?h ?p)
      (at ?t ?p)
      (in ?c ?t)
    )
    :effect (and
      (not (in ?c ?t))
      (not (hoist-available ?h))
      (hoist-lifting ?h ?c)
      (clear ?c)
    )
  )

  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist-lifting ?h ?c)
      (at ?h ?p)
      (at ?t ?p)
    )
    :effect (and
      (in ?c ?t)
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)
      (not (at ?c ?p))
    )
  )

  (:action truck-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )
)