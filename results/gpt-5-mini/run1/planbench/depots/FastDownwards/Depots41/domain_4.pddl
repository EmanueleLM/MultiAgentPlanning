(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    truck
    hoist
    surface
    pallet crate - surface
  )

  (:predicates
    (at_truck ?t - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_surface ?s - surface ?p - place)

    (on ?c - crate ?s - surface)
    (clear ?s - surface)

    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)

    (in_truck ?c - crate ?t - truck)
  )

  (:action drive_truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
                    (at_truck ?tr ?from)
                  )
    :effect (and
              (not (at_truck ?tr ?from))
              (at_truck ?tr ?to)
            )
  )

  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at_surface ?s ?p)
                    (on ?c ?s)
                    (hoist_available ?h)
                    (clear ?c)
                  )
    :effect (and
              (not (on ?c ?s))
              (not (at_surface ?c ?p))
              (hoist_lifting ?h ?c)
              (not (hoist_available ?h))
              (clear ?s)
            )
  )

  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at_surface ?s ?p)
                    (clear ?s)
                    (hoist_lifting ?h ?c)
                  )
    :effect (and
              (hoist_available ?h)
              (not (hoist_lifting ?h ?c))
              (at_surface ?c ?p)
              (not (clear ?s))
              (clear ?c)
              (on ?c ?s)
            )
  )

  (:action hoist_load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at_truck ?t ?p)
                    (hoist_lifting ?h ?c)
                  )
    :effect (and
              (in_truck ?c ?t)
              (hoist_available ?h)
              (not (hoist_lifting ?h ?c))
            )
  )

  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at_truck ?t ?p)
                    (hoist_available ?h)
                    (in_truck ?c ?t)
                  )
    :effect (and
              (not (in_truck ?c ?t))
              (not (hoist_available ?h))
              (hoist_lifting ?h ?c)
            )
  )
)