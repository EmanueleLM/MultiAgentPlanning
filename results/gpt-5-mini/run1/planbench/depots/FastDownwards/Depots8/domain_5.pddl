(define (domain depots_hoist)
  (:requirements :typing :negative-preconditions)
  (:types
    object
    place
    depot distributor - place
    surface
    pallet crate - surface
    truck hoist - object
  )

  (:predicates
    (truck_at ?t - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (surface_at ?s - surface ?p - place)
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?t - truck)
    (hoist_holding ?h - hoist ?c - crate)
    (hoist_free ?h - hoist)
    (clear ?s - surface)
  )

  (:action driver_drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (truck_at ?tr ?from)
    :effect (and
              (not (truck_at ?tr ?from))
              (truck_at ?tr ?to)
            )
  )

  (:action hoist_move
    :parameters (?h - hoist ?from - place ?to - place)
    :precondition (hoist_at ?h ?from)
    :effect (and
              (not (hoist_at ?h ?from))
              (hoist_at ?h ?to)
            )
  )

  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (hoist_at ?h ?p)
                    (surface_at ?s ?p)
                    (on ?c ?s)
                    (hoist_free ?h)
                    (clear ?c)
                  )
    :effect (and
              (not (on ?c ?s))
              (not (surface_at ?c ?p))
              (hoist_holding ?h ?c)
              (not (hoist_free ?h))
              (clear ?s)
            )
  )

  (:action hoist_lower
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (hoist_at ?h ?p)
                    (surface_at ?s ?p)
                    (hoist_holding ?h ?c)
                    (clear ?s)
                  )
    :effect (and
              (on ?c ?s)
              (surface_at ?c ?p)
              (hoist_free ?h)
              (not (hoist_holding ?h ?c))
              (not (clear ?s))
              (clear ?c)
            )
  )

  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (hoist_at ?h ?p)
                    (truck_at ?t ?p)
                    (hoist_holding ?h ?c)
                  )
    :effect (and
              (in_truck ?c ?t)
              (not (surface_at ?c ?p))
              (hoist_free ?h)
              (not (hoist_holding ?h ?c))
            )
  )

  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (hoist_at ?h ?p)
                    (truck_at ?t ?p)
                    (hoist_free ?h)
                    (in_truck ?c ?t)
                  )
    :effect (and
              (not (in_truck ?c ?t))
              (not (surface_at ?c ?p))
              (hoist_holding ?h ?c)
              (not (hoist_free ?h))
            )
  )

)