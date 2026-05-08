(define (domain depots13)
  (:requirements :strips :typing)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    truck
    hoist
  )

  ;; Predicates
  (:predicates
    (connected ?from - place ?to - place)

    (at ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (surface_at ?s - surface ?p - place)

    (on_surface ?c - crate ?s - surface)
    (on_crate ?c - crate ?under - crate)

    (in_truck ?c - crate ?t - truck)
    (truck_empty ?t - truck)

    (hoist_free ?h - hoist)
    (holding ?h - hoist ?c - crate)

    (surface_empty ?s - surface)
    (clear_crate ?c - crate)
  )

  ;; Truck driving: explicit connectivity required
  (:action truck_driver_drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and (at ?t ?from) (connected ?from ?to))
    :effect (and (not (at ?t ?from)) (at ?t ?to))
  )

  ;; Hoist lifts a crate from a surface at the same place
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (surface_at ?s ?p)
                    (on_surface ?c ?s)
                    (hoist_free ?h)
                    (clear_crate ?c)
                  )
    :effect (and
              (holding ?h ?c)
              (not (on_surface ?c ?s))
              (not (hoist_free ?h))
              (surface_empty ?s)
              (not (clear_crate ?c))
            )
  )

  ;; Hoist lifts a top crate from a crate that is itself on a surface
  (:action hoist_lift_from_crate
    :parameters (?h - hoist ?c - crate ?under - crate ?s - surface ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (on_crate ?c ?under)
                    (on_surface ?under ?s)
                    (surface_at ?s ?p)
                    (hoist_free ?h)
                    (clear_crate ?c)
                  )
    :effect (and
              (holding ?h ?c)
              (not (on_crate ?c ?under))
              (not (hoist_free ?h))
              (clear_crate ?under)
              (not (clear_crate ?c))
            )
  )

  ;; Hoist drops a held crate onto an empty surface at the same place
  (:action hoist_drop_on_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (surface_at ?s ?p)
                    (holding ?h ?c)
                    (surface_empty ?s)
                  )
    :effect (and
              (on_surface ?c ?s)
              (not (holding ?h ?c))
              (hoist_free ?h)
              (not (surface_empty ?s))
              (clear_crate ?c)
            )
  )

  ;; Hoist drops a held crate onto another crate (single-level stacking)
  (:action hoist_drop_on_crate
    :parameters (?h - hoist ?c - crate ?under - crate ?s - surface ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (holding ?h ?c)
                    (on_surface ?under ?s)
                    (surface_at ?s ?p)
                    (clear_crate ?under)
                  )
    :effect (and
              (on_crate ?c ?under)
              (not (holding ?h ?c))
              (hoist_free ?h)
              (not (clear_crate ?under))
              (clear_crate ?c)
            )
  )

  ;; Hoist loads a held crate into a truck at the same place (truck single-crate capacity)
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at ?t ?p)
                    (holding ?h ?c)
                    (truck_empty ?t)
                  )
    :effect (and
              (in_truck ?c ?t)
              (not (holding ?h ?c))
              (hoist_free ?h)
              (not (truck_empty ?t))
            )
  )

  ;; Hoist unloads a crate from a truck at the truck's place (hoist must be free)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at_hoist ?h ?p)
                    (at ?t ?p)
                    (hoist_free ?h)
                    (in_truck ?c ?t)
                  )
    :effect (and
              (not (in_truck ?c ?t))
              (holding ?h ?c)
              (not (hoist_free ?h))
              (truck_empty ?t)
            )
  )
)