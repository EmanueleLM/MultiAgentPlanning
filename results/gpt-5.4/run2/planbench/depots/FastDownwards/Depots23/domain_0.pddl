(define (domain depots_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    place
    depot distributor - place
    truck
    hoist
    surface
    pallet crate - surface
  )

  (:predicates
    (at_truck ?t - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_crate ?c - crate ?p - place)
    (at_pallet ?pl - pallet ?p - place)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
    (in ?c - crate ?t - truck)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (road ?from - place ?to - place)
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at_truck ?t ?from)
      (road ?from ?to)
    )
    :effect (and
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
    )
  )

  (:action lift_from_pallet
    :parameters (?h - hoist ?c - crate ?pallet - pallet ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (available ?h)
      (at_crate ?c ?p)
      (at_pallet ?pallet ?p)
      (on ?c ?pallet)
      (clear ?c)
    )
    :effect (and
      (not (at_crate ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?pallet)
      (not (on ?c ?pallet))
      (not (clear ?c))
    )
  )

  (:action lift_from_crate
    :parameters (?h - hoist ?c - crate ?support - crate ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (available ?h)
      (at_crate ?c ?p)
      (at_crate ?support ?p)
      (on ?c ?support)
      (clear ?c)
    )
    :effect (and
      (not (at_crate ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?support)
      (not (on ?c ?support))
      (not (clear ?c))
    )
  )

  (:action drop_on_pallet
    :parameters (?h - hoist ?c - crate ?pallet - pallet ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_pallet ?pallet ?p)
      (clear ?pallet)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at_crate ?c ?p)
      (not (clear ?pallet))
      (clear ?c)
      (on ?c ?pallet)
    )
  )

  (:action drop_on_crate
    :parameters (?h - hoist ?c - crate ?support - crate ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_crate ?support ?p)
      (clear ?support)
      (lifting ?h ?c)
      (not (lifting ?h ?support))
      (not (in ?support truck0))
      (not (in ?support truck1))
      (not (in ?support truck2))
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at_crate ?c ?p)
      (not (clear ?support))
      (clear ?c)
      (on ?c ?support)
    )
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in ?c ?t)
      (available ?h)
      (not (lifting ?h ?c))
    )
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
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