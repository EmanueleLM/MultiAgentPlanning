(define (domain depots4)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place - object
    depot distributor - place
    surface - object
    pallet crate - surface
    hoist - object
    truck - object
  )

  (:predicates
    (at ?obj - (either crate hoist truck pallet) ?loc - place)
    (lifting ?h - hoist ?c - crate)
    (available ?h - hoist)
    (clear ?s - surface)
    (on ?c - crate ?s - surface)
    (in ?c - crate ?t - truck)
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (at ?t ?from)
    :effect
      (and
        (not (at ?t ?from))
        (at ?t ?to)
      )
  )

  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition
      (and
        (at ?h ?p)
        (at ?c ?p)
        (available ?h)
        (clear ?c)
        (on ?c ?s)
      )
    :effect
      (and
        (not (at ?c ?p))
        (lifting ?h ?c)
        (not (available ?h))
        (clear ?s)
        (not (on ?c ?s))
      )
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition
      (and
        (at ?h ?p)
        (at ?s ?p)
        (clear ?s)
        (lifting ?h ?c)
      )
    :effect
      (and
        (available ?h)
        (not (lifting ?h ?c))
        (at ?c ?p)
        (not (clear ?s))
        (clear ?c)
        (on ?c ?s)
      )
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition
      (and
        (at ?h ?p)
        (at ?t ?p)
        (lifting ?h ?c)
      )
    :effect
      (and
        (not (lifting ?h ?c))
        (available ?h)
        (in ?c ?t)
      )
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition
      (and
        (at ?h ?p)
        (at ?t ?p)
        (available ?h)
        (in ?c ?t)
      )
    :effect
      (and
        (not (in ?c ?t))
        (not (available ?h))
        (lifting ?h ?c)
      )
  )
)