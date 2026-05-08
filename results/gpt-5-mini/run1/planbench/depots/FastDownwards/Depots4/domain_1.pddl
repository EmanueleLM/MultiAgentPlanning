(define (domain logistics-hoist-truck)
  (:requirements :strips :typing :negative-preconditions)
  (:types crate pallet - surface hoist truck place)

  (:predicates
    ;; surfaces and locations
    (surface_at ?s - surface ?p - place)    ;; surface s is at place p
    (on ?c - crate ?s - surface)            ;; crate c is on surface s

    ;; agents locations
    (at_hoist ?h - hoist ?p - place)
    (at_truck ?t - truck ?p - place)

    ;; hoist and truck state
    (hoist_free ?h - hoist)                 ;; hoist is available
    (hoist_holding ?h - hoist ?c - crate)   ;; hoist is holding crate
    (in_truck ?c - crate ?t - truck)        ;; crate is inside truck

    ;; support/clearness
    (clear ?s - surface)                    ;; nothing is on top of surface s
  )

  ;; Hoist actions
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
              (clear ?s)            ;; surface becomes clear after lifting the crate
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
              (not (clear ?s))     ;; surface no longer clear
              (clear ?c)           ;; crate is clear when placed (nothing on top)
            )
  )

  ;; Load a crate from hoist into truck
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
            )
  )

  ;; Unload a crate from a truck using a hoist (hoist will be holding the crate)
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

  ;; Truck driving between places (connectivity is complete among places)
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