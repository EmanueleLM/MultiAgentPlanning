(define (domain depots25)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    surface
    crate - surface
    pallet - surface
    truck
    hoist
  )
  (:predicates
    (at_truck ?t - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_surface ?s - surface ?p - place)
    (available ?h - hoist)
    (clear ?s - surface)
    (lifting ?h - hoist ?c - crate)
    (on ?c - crate ?s - surface)
    (in ?c - crate ?t - truck)
  )

  (:action drive_truck
    :parameters (?t - truck ?p1 - place ?p2 - place)
    :precondition (at_truck ?t ?p1)
    :effect (and
      (not (at_truck ?t ?p1))
      (at_truck ?t ?p2)
    )
  )

  (:action lift_crate
    :parameters (?c - crate ?s - surface ?h - hoist ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?c ?p)
      (available ?h)
      (clear ?c)
      (on ?c ?s)
    )
    :effect (and
      (not (at_surface ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  (:action drop_crate
    :parameters (?c - crate ?s - surface ?h - hoist ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at_surface ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  (:action load_crate
    :parameters (?c - crate ?t - truck ?h - hoist ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (lifting ?h ?c)
      (not (in ?c ?t))
    )
    :effect (and
      (in ?c ?t)
      (not (lifting ?h ?c))
      (available ?h)
      (not (at_surface ?c ?p))
    )
  )

  (:action unload_crate
    :parameters (?c - crate ?t - truck ?h - hoist ?p - place)
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
      (not (at_surface ?c ?p))
    )
  )
)