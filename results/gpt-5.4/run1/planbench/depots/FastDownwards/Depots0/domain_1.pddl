(define (domain logistics_stacking_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    object
    place
    depot distributor - place
    truck hoist - object
    surface - object
    pallet crate - surface
  )

  (:predicates
    (at ?x - object ?p - place)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in ?c - crate ?t - truck)
    (road ?from - place ?to - place)
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at ?t ?from)
      (road ?from ?to)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?c ?p)
      (at ?s ?p)
      (available ?h)
      (clear ?c)
      (on ?c ?s)
    )
    :effect (and
      (not (at ?c ?p))
      (not (available ?h))
      (not (on ?c ?s))
      (lifting ?h ?c)
      (clear ?s)
    )
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (not (clear ?s))
      (available ?h)
      (at ?c ?p)
      (clear ?c)
      (on ?c ?s)
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
      (not (in ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
    )
  )
)