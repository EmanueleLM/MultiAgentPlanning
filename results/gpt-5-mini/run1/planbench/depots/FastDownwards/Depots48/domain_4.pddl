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
    (truck_at ?t - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (surface_at ?s - surface ?p - place)
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?t - truck)
    (hoist_available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (clear ?s - surface)
  )

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
      (not (on ?crate ?surface))
      (not (surface_at ?crate ?place))
      (lifting ?hoist ?crate)
      (not (hoist_available ?hoist))
      (clear ?surface)
    )
  )

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
      (not (surface_at ?crate ?place))
    )
  )

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
      (not (surface_at ?crate ?place))
    )
  )
)