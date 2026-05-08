(define (domain logistics-hoist-truck)
  (:requirements :strips :typing :equality)
  (:types
    place surface hoist truck
    depot distributor - place
    pallet crate - surface
  )

  (:predicates
    (surface_at ?s - surface ?p - place)
    (on ?c - crate ?s - surface)
    (at_hoist ?h - hoist ?p - place)
    (at_truck ?t - truck ?p - place)
    (hoist_free ?h - hoist)
    (hoist_holding ?h - hoist ?c - crate)
    (in_truck ?c - crate ?t - truck)
    (clear ?s - surface)
  )

  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (surface_at ?s ?p)
                    (on ?c ?s)
                    (hoist_free ?h)
                    (clear ?c)
                  )
    :effect (and
              (not (hoist_free ?h))
              (hoist_holding ?h ?c)
              (not (on ?c ?s))
              (clear ?s)
              (not (surface_at ?c ?p))
            )
  )

  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (hoist_holding ?h ?c)
                    (at_hoist ?h ?p)
                    (surface_at ?s ?p)
                    (clear ?s)
                  )
    :effect (and
              (hoist_free ?h)
              (not (hoist_holding ?h ?c))
              (on ?c ?s)
              (not (clear ?s))
              (clear ?c)
              (surface_at ?c ?p)
            )
  )

  (:action truck_load_into_truck
    :parameters (?t - truck ?h - hoist ?c - crate ?p - place)
    :precondition (and
                    (at_truck ?t ?p)
                    (at_hoist ?h ?p)
                    (hoist_holding ?h ?c)
                  )
    :effect (and
              (hoist_free ?h)
              (not (hoist_holding ?h ?c))
              (in_truck ?c ?t)
              (not (surface_at ?c ?p))
            )
  )

  (:action truck_unload_from_truck
    :parameters (?t - truck ?h - hoist ?c - crate ?p - place)
    :precondition (and
                    (at_truck ?t ?p)
                    (at_hoist ?h ?p)
                    (hoist_free ?h)
                    (in_truck ?c ?t)
                  )
    :effect (and
              (not (in_truck ?c ?t))
              (not (hoist_free ?h))
              (hoist_holding ?h ?c)
            )
  )

  (:action truck_drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
                    (at_truck ?t ?from)
                    (not (= ?from ?to))
                  )
    :effect (and
              (not (at_truck ?t ?from))
              (at_truck ?t ?to)
            )
  )
)