(define (domain depots18)
  :requirements :strips :typing :negative-preconditions
  :types place truck hoist surface crate pallet - surface

  :predicates
    (truck_at ?tr - truck ?pl - place)
    (hoist_at ?h - hoist ?pl - place)
    (surface_at ?s - surface ?pl - place)

    (on ?c - crate ?s - surface)
    (clear ?s - surface)
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

  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (surface_at ?s ?pl)
      (surface_at ?c ?pl)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (not (surface_at ?c ?pl))
      (hoist_holding ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (surface_at ?s ?pl)
      (hoist_holding ?h ?c)
      (clear ?s)
    )
    :effect (and
      (hoist_available ?h)
      (not (hoist_holding ?h ?c))
      (surface_at ?c ?pl)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
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
      (in_truck ?c ?tr)
      (not (surface_at ?c ?pl))
      (not (hoist_holding ?h ?c))
      (hoist_available ?h)
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
      (hoist_holding ?h ?c)
      (not (hoist_available ?h))
      (not (surface_at ?c ?pl))
    )
  )
)