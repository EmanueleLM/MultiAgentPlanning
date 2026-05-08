(define (domain depots24)
  (:requirements :typing)
  (:types
    place - object
    depot distributor - place
    locatable - object
    truck hoist surface - locatable
    pallet crate - surface
  )

  (:predicates
    (at ?obj - locatable ?p - place)
    (on ?c - crate ?s - surface)
    (in ?c - crate ?t - truck)
    (lifting ?h - hoist ?c - crate)
    (available ?h - hoist)
    (clear ?s - surface)
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (at ?t ?from)
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (available ?h)
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (at ?s ?p)
    )
    :effect (and
      (not (available ?h))
      (lifting ?h ?c)
      (not (at ?c ?p))
      (not (on ?c ?s))
      (not (clear ?c))
      (clear ?s)
    )
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (lifting ?h ?c)
      (at ?s ?p)
      (clear ?s)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p)
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
      (available ?h)
      (not (lifting ?h ?c))
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
      (not (available ?h))
      (lifting ?h ?c)
      (not (in ?c ?t))
    )
  )
)