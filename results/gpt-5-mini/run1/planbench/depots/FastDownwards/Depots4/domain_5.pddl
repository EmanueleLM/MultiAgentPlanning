(define (domain logistics-hoist-truck)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place surface hoist truck
    depot distributor - place
    pallet crate - surface
  )

  (:predicates
    ;; surface_at ?s - surface ?p - place : surface s is located at place p
    (surface_at ?s - surface ?p - place)
    ;; on ?c - crate ?s - surface : crate c is directly on surface s
    (on ?c - crate ?s - surface)
    ;; at_hoist ?h - hoist ?p - place : hoist h is at place p
    (at_hoist ?h - hoist ?p - place)
    ;; at_truck ?t - truck ?p - place : truck t is at place p
    (at_truck ?t - truck ?p - place)
    ;; hoist_free ?h - hoist : hoist h is available
    (hoist_free ?h - hoist)
    ;; hoist_holding ?h - hoist ?c - crate : hoist h is currently holding crate c
    (hoist_holding ?h - hoist ?c - crate)
    ;; in_truck ?c - crate ?t - truck : crate c is inside truck t
    (in_truck ?c - crate ?t - truck)
    ;; clear ?s - surface : surface or crate s has nothing on top of it
    (clear ?s - surface)
  )

  ;; Lift a crate from a surface at a place using a hoist.
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (surface_at ?s ?p)
                    (on ?c ?s)
                    (hoist_free ?h)
                    (clear ?c)
                    (surface_at ?c ?p)
                  )
    :effect (and
              (not (hoist_free ?h))
              (hoist_holding ?h ?c)
              (not (on ?c ?s))
              (clear ?s)
              (not (surface_at ?c ?p))
            )
  )

  ;; Drop a crate held by a hoist onto a surface at a place.
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

  ;; Load a crate held by a hoist into a co-located truck.
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

  ;; Unload a crate from a truck into a hoist at the same place (hoist then holds the crate).
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
              (surface_at ?c ?p)
            )
  )

  ;; Drive a truck from one place to another.
  ;; The negative precondition prevents no-op drives to the same place.
  (:action truck_drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
                    (at_truck ?t ?from)
                    (not (at_truck ?t ?to))
                  )
    :effect (and
              (not (at_truck ?t ?from))
              (at_truck ?t ?to)
            )
  )
)