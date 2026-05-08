(define (domain depots10)
  (:requirements :strips :typing)

  (:types
    place
    depot distributor - place
    locatable
    surface truck - locatable
    pallet crate - surface
    hoist
  )

  (:predicates
    (road ?from - place ?to - place)

    (at ?x - locatable ?p - place)
    (at_hoist ?h - hoist ?p - place)

    (on ?c - crate ?s - surface)
    (in ?c - crate ?t - truck)

    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (clear ?s - surface)
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at ?t ?from)
      (road ?from ?to)
    )
    :effect (and
      (at ?t ?to)
      (not (at ?t ?from))
    )
  )

  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at ?c ?p)
      (at ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
      (not (on ?c ?s))
      (not (at ?c ?p))
    )
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (not (lifting ?h ?c))
      (not (clear ?s))
    )
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (in ?c ?t)
      (not (lifting ?h ?c))
    )
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
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