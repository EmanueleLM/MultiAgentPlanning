(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types depot distributor - place
          truck
          hoist
          pallet crate - surface)

  (:predicates
    (truck_at ?t - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (surface_at ?s - surface ?p - place)
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?t - truck)
    (hoist_available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (clear ?x - surface)
  )

  ;; Drive a truck from one place to another.
  (:action drive_truck
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and
      (truck_at ?truck ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (truck_at ?truck ?from))
      (truck_at ?truck ?to)
    )
  )

  ;; Use a hoist to lift a crate from a surface at a place.
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
      ;; crate is not at the place
      (not (surface_at ?crate ?place))
      ;; crate is not on the surface
      (not (on ?crate ?surface))
      ;; the hoist is lifting the crate
      (lifting ?hoist ?crate)
      ;; the hoist is not available
      (not (hoist_available ?hoist))
      ;; the surface becomes clear
      (clear ?surface)
    )
  )

  ;; Use a hoist to drop a crate to a surface at a place.
  (:action hoist_drop_to_surface
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
      (hoist_at ?hoist ?place)
      (surface_at ?surface ?place)
      (clear ?surface)
      (lifting ?hoist ?crate)
    )
    :effect (and
      ;; hoist becomes available
      (hoist_available ?hoist)
      ;; hoist no longer lifting that crate
      (not (lifting ?hoist ?crate))
      ;; crate is at the place
      (surface_at ?crate ?place)
      ;; the surface is no longer clear
      (not (clear ?surface))
      ;; the crate (now top object) is clear
      (clear ?crate)
      ;; crate is on the surface
      (on ?crate ?surface)
    )
  )

  ;; Use a hoist to load a crate into a truck at a place.
  ;; NOTE: The problem statement provided preconditions for loading but did not specify the resulting effects.
  ;; To remain faithful to the input (no invented effects), this action preserves only the stated preconditions
  ;; and contains no add/delete effects (it is a no-op in effects).
  (:action hoist_load_onto_truck
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (hoist_at ?hoist ?place)
      (truck_at ?truck ?place)
      (lifting ?hoist ?crate)
    )
    :effect (and)
  )

  ;; Use a hoist to unload a crate from a truck at a place.
  (:action hoist_unload_from_truck
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (hoist_at ?hoist ?place)
      (truck_at ?truck ?place)
      (hoist_available ?hoist)
      (in_truck ?crate ?truck)
    )
    :effect (and
      ;; crate is not in the truck
      (not (in_truck ?crate ?truck))
      ;; the hoist is not available
      (not (hoist_available ?hoist))
      ;; the hoist is lifting the crate
      (lifting ?hoist ?crate)
    )
  )
)