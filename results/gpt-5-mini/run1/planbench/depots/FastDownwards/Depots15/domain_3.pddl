(define (domain multiagent_hoist_truck)
  (:requirements :strips :typing)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    hoist
    truck
  )

  (:predicates
    (at_hoist ?h - hoist ?p - place)
    (at_truck ?tr - truck ?p - place)
    (at_surface ?s - surface ?p - place)

    (on ?c - crate ?s - surface)
    (in ?c - crate ?tr - truck)
    (holding ?h - hoist ?c - crate)

    (available ?h - hoist)
    (clear_surface ?s - surface)
    (clear_crate ?c - crate)
    (truck_free ?tr - truck)
  )

  (:action truck_drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at_truck ?tr ?from)
      (truck_free ?tr)
    )
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (on ?c ?s)
      (clear_crate ?c)
      (available ?h)
    )
    :effect (and
      (holding ?h ?c)
      (not (available ?h))
      (not (on ?c ?s))
      (clear_surface ?s)
    )
  )

  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (holding ?h ?c)
      (clear_surface ?s)
    )
    :effect (and
      (not (holding ?h ?c))
      (available ?h)
      (on ?c ?s)
      (clear_crate ?c)
      (not (clear_surface ?s))
    )
  )

  (:action hoist_load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (holding ?h ?c)
      (truck_free ?tr)
    )
    :effect (and
      (not (holding ?h ?c))
      (available ?h)
      (in ?c ?tr)
    )
  )

  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (available ?h)
      (in ?c ?tr)
    )
    :effect (and
      (holding ?h ?c)
      (not (available ?h))
      (not (in ?c ?tr))
    )
  )
)