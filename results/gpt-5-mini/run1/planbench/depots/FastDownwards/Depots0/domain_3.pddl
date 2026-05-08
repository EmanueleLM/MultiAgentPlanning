(define (domain multiagent_hoist_driver)
  (:requirements :strips :typing :negative-preconditions)
  (:types place truck hoist pallet crate)

  (:predicates
    ;; locations
    (at_truck ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_pallet ?pa - pallet ?p - place)
    (at_crate ?c - crate ?p - place)

    ;; stacking / containment
    (on_pallet ?c - crate ?pa - pallet)
    (on_crate ?c - crate ?s - crate)
    (in_truck ?c - crate ?tr - truck)

    ;; clearness
    (clear_pallet ?pa - pallet)
    (clear_crate ?c - crate)

    ;; hoist state
    (hoist_free ?h - hoist)
    (holding ?h - hoist ?c - crate)
  )

  ;; Driver action: move a truck between places (roads connect any two places).
  (:action driver_drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at_truck ?tr ?from))
    :effect (and
              (not (at_truck ?tr ?from))
              (at_truck ?tr ?to)
            )
  )

  ;; Hoist: lift a crate from a pallet at a place.
  (:action hoist_lift_from_pallet
    :parameters (?h - hoist ?c - crate ?pa - pallet ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at_pallet ?pa ?p)
                    (on_pallet ?c ?pa)
                    (hoist_free ?h)
                    (clear_crate ?c)
                  )
    :effect (and
              (not (on_pallet ?c ?pa))
              (not (at_crate ?c ?p))
              (holding ?h ?c)
              (not (hoist_free ?h))
              (clear_pallet ?pa)
            )
  )

  ;; Hoist: lift a crate from another crate at a place.
  (:action hoist_lift_from_crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at_crate ?s ?p)
                    (on_crate ?c ?s)
                    (hoist_free ?h)
                    (clear_crate ?c)
                  )
    :effect (and
              (not (on_crate ?c ?s))
              (not (at_crate ?c ?p))
              (holding ?h ?c)
              (not (hoist_free ?h))
              (clear_crate ?s)
            )
  )

  ;; Hoist: drop a held crate onto a pallet at the same place.
  (:action hoist_drop_to_pallet
    :parameters (?h - hoist ?c - crate ?pa - pallet ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at_pallet ?pa ?p)
                    (clear_pallet ?pa)
                    (holding ?h ?c)
                  )
    :effect (and
              (on_pallet ?c ?pa)
              (at_crate ?c ?p)
              (hoist_free ?h)
              (not (holding ?h ?c))
              (not (clear_pallet ?pa))
              (clear_crate ?c)
            )
  )

  ;; Hoist: drop a held crate onto another crate at the same place.
  (:action hoist_drop_to_crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at_crate ?s ?p)
                    (clear_crate ?s)
                    (holding ?h ?c)
                  )
    :effect (and
              (on_crate ?c ?s)
              (at_crate ?c ?p)
              (hoist_free ?h)
              (not (holding ?h ?c))
              (not (clear_crate ?s))
              (clear_crate ?c)
            )
  )

  ;; Hoist: load a held crate into a truck at the same place.
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at_truck ?tr ?p)
                    (holding ?h ?c)
                  )
    :effect (and
              (in_truck ?c ?tr)
              (hoist_free ?h)
              (not (holding ?h ?c))
              (not (at_crate ?c ?p))
            )
  )

  ;; Hoist: unload a crate from a truck (hoist picks it up; becomes occupied).
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
              (not (hoist_free ?h))
              (holding ?h ?c)
            )
  )
)