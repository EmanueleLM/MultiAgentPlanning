(define (domain logistics-hoist-truck)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types
    place surface hoist truck
    depot distributor - place
    pallet crate - surface
  )

  (:predicates
    ;; locations of surfaces (pallets and crates) at places
    (surface_at ?s - surface ?p - place)

    ;; stacking relation: crate on top of a surface (pallet or crate)
    (on ?c - crate ?s - surface)

    ;; agent locations
    (at_hoist ?h - hoist ?p - place)
    (at_truck ?t - truck ?p - place)

    ;; hoist and truck state
    (hoist_free ?h - hoist)
    (hoist_holding ?h - hoist ?c - crate)
    (in_truck ?c - crate ?t - truck)

    ;; a surface (pallet or crate) has nothing on top of it
    (clear ?s - surface)
  )

  ;; Hoist lifts a crate from a surface at a place.
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

  ;; Hoist drops a crate onto a surface at a place.
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

  ;; Load a crate (held by a hoist) into a truck at the same place.
  ;; Loading frees the hoist and places the crate inside the truck (crate no longer recorded at the place).
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

  ;; Unload a crate from a truck using a hoist at the truck's place.
  ;; Unloading makes the hoist hold the crate (hoist becomes busy).
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

  ;; Drive a truck from one place to another (complete connectivity).
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