(define (domain depots_hoist)
  (:requirements :strips :typing :negative-preconditions)
  (:types place depot distributor - place
           surface pallet crate - surface
           truck hoist - object)

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

  ;; Driving action for trucks (driver)
  (:action driver_drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (truck_at ?t ?from)
    :effect (and
              (not (truck_at ?t ?from))
              (truck_at ?t ?to)
            )
  )

  ;; Move hoist between places (hoist operator)
  ;; If the hoist is holding a crate, that relation remains unchanged by the move.
  (:action hoist_move
    :parameters (?h - hoist ?from - place ?to - place)
    :precondition (hoist_at ?h ?from)
    :effect (and
              (not (hoist_at ?h ?from))
              (hoist_at ?h ?to)
            )
  )

  ;; Hoist lifts a crate from a surface at the same place.
  ;; Preconditions require hoist free and the crate to be clear (nothing on top).
  ;; Effects: crate is removed from the surface and from the place, hoist holds crate and becomes unavailable,
  ;; the underlying surface becomes clear, and the lifted crate is clear.
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
              (clear ?c)
            )
  )

  ;; Hoist lowers a held crate onto a surface at the same place.
  ;; Preconditions require the hoist to be holding the crate and the target surface to be clear.
  ;; Effects: crate is on the surface at the place, hoist becomes free and no longer holds the crate,
  ;; target surface becomes not clear, and the crate is clear.
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

  ;; Hoist loads a held crate into a co-located truck.
  ;; Preconditions: hoist holds the crate and hoist and truck are co-located.
  ;; Effects: crate is placed in the truck, hoist becomes free and no longer holds the crate.
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (hoist_at ?h ?p)
                    (truck_at ?t ?p)
                    (hoist_holding ?h ?c)
                  )
    :effect (and
              (in_truck ?c ?t)
              (hoist_free ?h)
              (not (hoist_holding ?h ?c))
            )
  )

  ;; Hoist unloads a crate from a co-located truck (hoist takes the crate out of the truck).
  ;; Preconditions: hoist is free, truck and hoist are co-located, and crate is in the truck.
  ;; Effects: crate is removed from the truck, hoist becomes unavailable and holds the crate.
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
              (hoist_holding ?h ?c)
              (not (hoist_free ?h))
            )
  )

)