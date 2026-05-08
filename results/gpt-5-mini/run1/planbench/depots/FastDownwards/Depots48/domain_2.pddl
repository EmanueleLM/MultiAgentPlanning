(define (domain depots48)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    truck
    hoist
  )

  (:predicates
    ;; locations
    (truck_at ?t - truck ?p - place)
    (hoist_at  ?h - hoist  ?p - place)
    (surface_at ?s - surface ?p - place)

    ;; stacking and carriage
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?t - truck)

    ;; hoist state
    (hoist_available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; top-clear (applies to surfaces and crates since crates are surfaces)
    (clear ?s - surface)
  )

  ;; drive a truck between places (roads fully connected per problem statement)
  (:action drive_truck
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and
      (truck_at ?truck ?from)
    )
    :effect (and
      (not (truck_at ?truck ?from))
      (truck_at ?truck ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist_lift_from_surface
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
      (hoist_at ?hoist ?place)
      (surface_at ?surface ?place)
      (on ?crate ?surface)
      (hoist_available ?hoist)
      (clear ?crate)
    )
    :effect (and
      ;; crate removed from the surface and from the place
      (not (on ?crate ?surface))
      (not (surface_at ?crate ?place))
      ;; hoist takes it and becomes unavailable
      (lifting ?hoist ?crate)
      (not (hoist_available ?hoist))
      ;; the surface becomes clear after removing the crate
      (clear ?surface)
    )
  )

  ;; hoist drops a crate onto a surface at a place
  (:action hoist_drop_to_surface
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
      (hoist_at ?hoist ?place)
      (surface_at ?surface ?place)
      (clear ?surface)
      (lifting ?hoist ?crate)
    )
    :effect (and
      (hoist_available ?hoist)
      (not (lifting ?hoist ?crate))
      (surface_at ?crate ?place)
      (not (clear ?surface))
      (clear ?crate)
      (on ?crate ?surface)
    )
  )

  ;; hoist loads a lifted crate into a truck at the same place
  (:action hoist_load_onto_truck
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (hoist_at ?hoist ?place)
      (truck_at ?truck ?place)
      (lifting ?hoist ?crate)
    )
    :effect (and
      (in_truck ?crate ?truck)
      (not (lifting ?hoist ?crate))
      (hoist_available ?hoist)
    )
  )

  ;; hoist unloads a crate from a truck (hoist begins lifting the crate)
  (:action hoist_unload_from_truck
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (hoist_at ?hoist ?place)
      (truck_at ?truck ?place)
      (hoist_available ?hoist)
      (in_truck ?crate ?truck)
    )
    :effect (and
      (not (in_truck ?crate ?truck))
      (not (hoist_available ?hoist))
      (lifting ?hoist ?crate)
    )
  )
)