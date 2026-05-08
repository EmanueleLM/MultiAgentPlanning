(define (domain depots7)
  (:requirements :strips :typing)
  (:types
    place
    support
    crate - support
    pallet - support
    hoist
    truck
  )

  (:predicates
    (truck_at ?tr - truck ?pl - place)
    (hoist_at ?h - hoist ?pl - place)
    (support_at ?s - support ?pl - place)
    (on ?c - crate ?s - support)
    (clear ?s - support)
    (in_truck ?c - crate ?tr - truck)
    (hoist_available ?h - hoist)
    (hoist_holding ?h - hoist ?c - crate)
  )

  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (truck_at ?tr ?from)
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
    )
  )

  (:action hoist_lift_from_support
    :parameters (?h - hoist ?c - crate ?s - support ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (support_at ?s ?pl)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (hoist_holding ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
    )
  )

  (:action hoist_drop_to_support
    :parameters (?h - hoist ?c - crate ?s - support ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (hoist_holding ?h ?c)
      (support_at ?s ?pl)
      (clear ?s)
    )
    :effect (and
      (not (hoist_holding ?h ?c))
      (hoist_available ?h)
      (on ?c ?s)
      (clear ?c)
      (not (clear ?s))
    )
  )

  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (truck_at ?tr ?pl)
      (hoist_holding ?h ?c)
    )
    :effect (and
      (not (hoist_holding ?h ?c))
      (hoist_available ?h)
      (in_truck ?c ?tr)
    )
  )

  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (truck_at ?tr ?pl)
      (hoist_available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (not (hoist_available ?h))
      (hoist_holding ?h ?c)
    )
  )
)