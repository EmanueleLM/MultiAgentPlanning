(define (domain depots_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    place
    depot distributor - place
    truck
    hoist
    support
    pallet crate - support
  )

  (:predicates
    (at_truck ?t - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_crate ?c - crate ?p - place)
    (at_pallet ?pl - pallet ?p - place)
    (on ?c - crate ?s - support)
    (in_truck ?c - crate ?t - truck)
    (clear ?s - support)
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
    :parameters (?h - hoist ?c - crate ?pl - pallet ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (available ?h)
      (at_crate ?c ?p)
      (at_pallet ?pl ?p)
      (on ?c ?pl)
      (clear ?c)
    )
    :effect (and
      (not (at_crate ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?pl)
      (not (on ?c ?pl))
    )
  )

  (:action lift_from_crate
    :parameters (?h - hoist ?c - crate ?under - crate ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (available ?h)
      (at_crate ?c ?p)
      (at_crate ?under ?p)
      (on ?c ?under)
      (clear ?c)
    )
    :effect (and
      (not (at_crate ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?under)
      (not (on ?c ?under))
    )
  )

  (:action drop_onto_pallet
    :parameters (?h - hoist ?c - crate ?pl - pallet ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (lifting ?h ?c)
      (at_pallet ?pl ?p)
      (clear ?pl)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at_crate ?c ?p)
      (not (clear ?pl))
      (clear ?c)
      (on ?c ?pl)
    )
  )

  (:action drop_onto_crate
    :parameters (?h - hoist ?c - crate ?under - crate ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (lifting ?h ?c)
      (at_crate ?under ?p)
      (clear ?under)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at_crate ?c ?p)
      (not (clear ?under))
      (clear ?c)
      (on ?c ?under)
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
      (in_truck ?c ?t)
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
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
    )
  )
)