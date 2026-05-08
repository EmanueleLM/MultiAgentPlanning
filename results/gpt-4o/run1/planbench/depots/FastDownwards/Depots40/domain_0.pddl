(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place truck hoist crate pallet - object
    depot distributor - place
  )
  (:predicates
    (at ?e - object ?p - place)
    (clear ?x - object)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (on ?c - crate ?s - object)
    (in ?c - crate ?t - truck)
  )
  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at ?t ?from)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )
  (:action lift
    :parameters (?h - hoist ?c - crate ?s - object ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (available ?h)
    )
    :effect (and
      (lifting ?h ?c)
      (not (available ?h))
      (not (on ?c ?s))
      (clear ?s)
    )
  )
  (:action drop
    :parameters (?h - hoist ?c - crate ?s - object ?p - place)
    :precondition (and
      (at ?h ?p)
      (lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (on ?c ?s)
      (clear ?c)
      (not (clear ?s))
    )
  )
  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (in ?c ?t)
    )
  )
  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h)
      (in ?c ?t)
    )
    :effect (and
      (lifting ?h ?c)
      (not (available ?h))
      (not (in ?c ?t))
    )
  )
)