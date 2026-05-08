(define (domain depots_instance)
  (:requirements :strips :typing)

  (:types
    place
    depot distributor - place
    truck hoist
    surface
    pallet crate - surface
  )

  (:predicates
    (at_truck ?t - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_pallet ?pl - pallet ?p - place)
    (at_crate ?c - crate ?p - place)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in ?c - crate ?t - truck)
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (at_truck ?t ?from)
    :effect (and
      (not (at_truck ?t ?from))
      (at_truck ?t ?to))
  )

  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_crate ?c ?p)
      (clear ?c)
      (on ?c ?s))
    :effect (and
      (not (at_crate ?c ?p))
      (not (on ?c ?s))
      (not (available ?h))
      (lifting ?h ?c)
      (clear ?s))
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (lifting ?h ?c)
      (clear ?s)
      (at_pallet ?s ?p))
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (at_crate ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (not (clear ?s)))
  )

  (:action drop_on_crate
    :parameters (?h - hoist ?c - crate ?base - crate ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (lifting ?h ?c)
      (at_crate ?base ?p)
      (clear ?base))
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (at_crate ?c ?p)
      (on ?c ?base)
      (clear ?c)
      (not (clear ?base)))
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (lifting ?h ?c))
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (in ?c ?t))
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (available ?h)
      (in ?c ?t))
    :effect (and
      (not (in ?c ?t))
      (not (available ?h))
      (lifting ?h ?c))
  )
)