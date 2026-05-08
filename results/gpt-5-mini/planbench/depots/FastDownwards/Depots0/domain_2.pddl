(define (domain depots)
  (:requirements :strips :typing)
  (:types
    place surface truck hoist
    pallet crate - surface
  )

  (:predicates
    ;; locations
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-surface ?s - surface ?p - place)

    ;; stacking / occupancy
    (on ?c - crate ?s - surface)    ;; crate c is directly on surface s
    (clear ?s - surface)            ;; nothing on top of surface s

    ;; hoist state
    (hoist-free ?h - hoist)
    (hoist-holding ?h - hoist ?c - crate)

    ;; truck contents
    (in-truck ?c - crate ?tr - truck)
  )

  ;; Truck driving between any two places (requires truck at origin)
  (:action drive_truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at-truck ?tr ?from)
    :effect (and
              (not (at-truck ?tr ?from))
              (at-truck ?tr ?to)
            )
  )

  ;; Move a hoist between places
  (:action move_hoist
    :parameters (?h - hoist ?from - place ?to - place)
    :precondition (at-hoist ?h ?from)
    :effect (and
              (not (at-hoist ?h ?from))
              (at-hoist ?h ?to)
            )
  )

  ;; Hoist picks (lifts) a crate from a surface at a place
  (:action hoist_pick
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-surface ?s ?p)
                    (at-surface ?c ?p)
                    (on ?c ?s)
                    (clear ?c)
                    (hoist-free ?h)
                  )
    :effect (and
              (not (on ?c ?s))
              (not (at-surface ?c ?p))
              (hoist-holding ?h ?c)
              (not (hoist-free ?h))
              (clear ?s)
            )
  )

  ;; Hoist drops a held crate onto a surface at the same place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-surface ?s ?p)
                    (clear ?s)
                    (hoist-holding ?h ?c)
                  )
    :effect (and
              (on ?c ?s)
              (at-surface ?c ?p)
              (clear ?c)
              (not (clear ?s))
              (hoist-free ?h)
              (not (hoist-holding ?h ?c))
            )
  )

  ;; Hoist loads a held crate into a truck at the same place
  (:action hoist_load_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-truck ?tr ?p)
                    (hoist-holding ?h ?c)
                  )
    :effect (and
              (in-truck ?c ?tr)
              (not (hoist-holding ?h ?c))
              (hoist-free ?h)
            )
  )

  ;; Hoist starts unloading a crate from a truck (hoist becomes busy holding the crate)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-truck ?tr ?p)
                    (hoist-free ?h)
                    (in-truck ?c ?tr)
                  )
    :effect (and
              (not (in-truck ?c ?tr))
              (hoist-holding ?h ?c)
              (not (hoist-free ?h))
            )
  )
)