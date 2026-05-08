(define (domain multiagent_hoist_driver)
  (:requirements :strips :typing :negative-preconditions)
  (:types place truck hoist pallet crate)

  (:predicates
    ;; locations
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-pallet ?pa - pallet ?p - place)
    (at-crate ?c - crate ?p - place)

    ;; stacking / containment
    (on-pallet ?c - crate ?pa - pallet)    ;; crate on pallet
    (on-crate ?c - crate ?s - crate)       ;; crate on another crate
    (in-truck ?c - crate ?tr - truck)      ;; crate inside truck

    ;; clearness
    (clear-pallet ?pa - pallet)
    (clear-crate ?c - crate)

    ;; hoist state
    (hoist-free ?h - hoist)
    (holding ?h - hoist ?c - crate)
  )

  ;; Driver action: move a truck between places (roads connect any two places).
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at-truck ?tr ?from))
    :effect (and
              (not (at-truck ?tr ?from))
              (at-truck ?tr ?to)
            )
  )

  ;; Hoist: lift a crate from a pallet at a place.
  (:action hoist-lift-from-pallet
    :parameters (?h - hoist ?c - crate ?pa - pallet ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-pallet ?pa ?p)
                    (on-pallet ?c ?pa)
                    (hoist-free ?h)
                    (clear-crate ?c)
                  )
    :effect (and
              (not (on-pallet ?c ?pa))
              (not (at-crate ?c ?p))
              (holding ?h ?c)
              (not (hoist-free ?h))
              (clear-pallet ?pa)
            )
  )

  ;; Hoist: lift a crate from another crate at a place.
  (:action hoist-lift-from-crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-crate ?s ?p)
                    (on-crate ?c ?s)
                    (hoist-free ?h)
                    (clear-crate ?c)
                  )
    :effect (and
              (not (on-crate ?c ?s))
              (not (at-crate ?c ?p))
              (holding ?h ?c)
              (not (hoist-free ?h))
              (clear-crate ?s)
            )
  )

  ;; Hoist: drop a held crate onto a pallet at the same place.
  (:action hoist-drop-to-pallet
    :parameters (?h - hoist ?c - crate ?pa - pallet ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-pallet ?pa ?p)
                    (clear-pallet ?pa)
                    (holding ?h ?c)
                  )
    :effect (and
              (on-pallet ?c ?pa)
              (at-crate ?c ?p)
              (hoist-free ?h)
              (not (holding ?h ?c))
              (not (clear-pallet ?pa))
              (clear-crate ?c)
            )
  )

  ;; Hoist: drop a held crate onto another crate at the same place.
  (:action hoist-drop-to-crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-crate ?s ?p)
                    (clear-crate ?s)
                    (holding ?h ?c)
                  )
    :effect (and
              (on-crate ?c ?s)
              (at-crate ?c ?p)
              (hoist-free ?h)
              (not (holding ?h ?c))
              (not (clear-crate ?s))
              (clear-crate ?c)
            )
  )

  ;; Hoist: load a held crate into a truck at the same place.
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-truck ?tr ?p)
                    (holding ?h ?c)
                  )
    :effect (and
              (in-truck ?c ?tr)
              (hoist-free ?h)
              (not (holding ?h ?c))
              (not (at-crate ?c ?p))
              ;; when inside truck, crate is not on any surface
            )
  )

  ;; Hoist: unload a crate from a truck (hoist picks it up; becomes occupied).
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-truck ?tr ?p)
                    (hoist-free ?h)
                    (in-truck ?c ?tr)
                  )
    :effect (and
              (not (in-truck ?c ?tr))
              (not (hoist-free ?h))
              (holding ?h ?c)
            )
  )
)