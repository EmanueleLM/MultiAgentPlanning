(define (domain depot_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    place surface
    depot distributor - place
    truck hoist - object
    pallet crate - surface
  )

  (:predicates
    (road ?from - place ?to - place)
    (at_truck ?t - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_pallet ?pl - pallet ?p - place)
    (at ?c - crate ?p - place)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in ?c - crate ?t - truck)
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
      (at ?c ?p)
      (on ?c ?pl)
      (at_pallet ?pl ?p)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?pl)
      (not (on ?c ?pl))
    )
  )

  (:action lift_from_crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at ?c ?p)
      (on ?c ?s)
      (at ?s ?p)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  (:action drop_on_pallet
    :parameters (?h - hoist ?c - crate ?pl - pallet ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_pallet ?pl ?p)
      (clear ?pl)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p)
      (not (clear ?pl))
      (clear ?c)
      (on ?c ?pl)
    )
  )

  (:action drop_on_crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
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