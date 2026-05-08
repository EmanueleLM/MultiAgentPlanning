(define (domain logistics-hoist-truck)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types crate pallet - surface hoist truck place)

  (:predicates
    ;; surfaces and their location
    (surface_at ?s - surface ?p - place)    ;; surface s (pallet or crate) is at place p
    (on ?c - crate ?s - surface)            ;; crate c is directly on surface s

    ;; agent locations
    (at_hoist ?h - hoist ?p - place)
    (at_truck ?t - truck ?p - place)

    ;; hoist and truck state
    (hoist_free ?h - hoist)                 ;; hoist is available
    (hoist_holding ?h - hoist ?c - crate)   ;; hoist is holding crate
    (in_truck ?c - crate ?t - truck)        ;; crate is inside truck

    ;; support/clearness
    (clear ?s - surface)                    ;; nothing is on top of surface s
  )

  ;; Hoist lifts a crate from a surface at a place.
  ;; Preconditions: hoist co-located with the surface, crate is on that surface,
  ;; hoist is free, crate is clear.
  ;; Effects: hoist becomes not free, hoist holds the crate, crate no longer on surface,
  ;; surface becomes clear, crate is no longer recorded as at the place (it is lifted).
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
  ;; Preconditions: hoist is holding the crate, hoist is co-located with the surface,
  ;; the surface is clear.
  ;; Effects: hoist becomes free, hoist no longer holds the crate, crate is on the surface,
  ;; surface is not clear, crate is recorded at the place and is clear (nothing on top).
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
  ;; Preconditions: truck and hoist co-located, hoist is holding the crate.
  ;; Effects: hoist becomes free, hoist no longer holds the crate, crate becomes inside the truck,
  ;; crate is no longer at the place.
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
  ;; Preconditions: truck and hoist co-located, hoist is free, crate is in the truck.
  ;; Effects: crate no longer in truck, hoist becomes not free and holds the crate.
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
  ;; Preconditions: truck is at the origin and origin != destination.
  ;; Effects: truck is at destination and no longer at origin. Items inside truck (in_truck) remain.
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