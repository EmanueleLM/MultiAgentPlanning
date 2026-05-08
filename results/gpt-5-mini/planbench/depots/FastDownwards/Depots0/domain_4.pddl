(define (domain depots)
  (:requirements :strips :typing)
  (:types
    place surface truck hoist
    pallet crate - surface
  )

  (:predicates
    ;; locations
    (at_truck ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_surface ?s - surface ?p - place)

    ;; stacking / occupancy
    (on ?c - crate ?s - surface)    ;; crate c is directly on surface s
    (clear ?s - surface)            ;; nothing on top of surface s

    ;; hoist state
    (hoist_free ?h - hoist)
    (hoist_holding ?h - hoist ?c - crate)

    ;; truck contents
    (in_truck ?c - crate ?tr - truck)
  )

  ;; Driver action: drive a truck between places (requires truck at origin)
  (:action driver_drive_truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at_truck ?tr ?from)
    :effect (and
              (not (at_truck ?tr ?from))
              (at_truck ?tr ?to)
            )
  )

  ;; Move a hoist between places
  (:action move_hoist
    :parameters (?h - hoist ?from - place ?to - place)
    :precondition (at_hoist ?h ?from)
    :effect (and
              (not (at_hoist ?h ?from))
              (at_hoist ?h ?to)
            )
  )

  ;; Hoist picks (lifts) a crate from a surface at a place
  (:action hoist_pick
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at_surface ?s ?p)
                    (on ?c ?s)
                    (clear ?c)
                    (hoist_free ?h)
                  )
    :effect (and
              (not (on ?c ?s))
              (hoist_holding ?h ?c)
              (not (hoist_free ?h))
              (clear ?s)
            )
  )

  ;; Hoist drops a held crate onto a surface at the same place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at_surface ?s ?p)
                    (clear ?s)
                    (hoist_holding ?h ?c)
                  )
    :effect (and
              (on ?c ?s)
              (clear ?c)
              (not (clear ?s))
              (hoist_free ?h)
              (not (hoist_holding ?h ?c))
            )
  )

  ;; Hoist loads a held crate into a truck at the same place
  (:action hoist_load_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at_truck ?tr ?p)
                    (hoist_holding ?h ?c)
                  )
    :effect (and
              (in_truck ?c ?tr)
              (not (hoist_holding ?h ?c))
              (hoist_free ?h)
            )
  )

  ;; Hoist unloads a crate from a truck (hoist becomes busy holding the crate)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at_truck ?tr ?p)
                    (hoist_free ?h)
                    (in_truck ?c ?tr)
                  )
    :effect (and
              (not (in_truck ?c ?tr))
              (hoist_holding ?h ?c)
              (not (hoist_free ?h))
            )
  )
)