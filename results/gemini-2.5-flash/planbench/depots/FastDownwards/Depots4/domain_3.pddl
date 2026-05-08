(define (domain depots)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    hoist truck
  )
  (:predicates
    (at_hoist ?h - hoist ?loc - place)
    (at_truck ?t - truck ?loc - place)
    (at_pallet ?p - pallet ?loc - place)
    (at_crate ?c - crate ?loc - place)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in ?c - crate ?t - truck)
  )

  ;; Drive a truck from one place to another place.
  (:action drive_truck
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and
      (at_truck ?truck ?from)
    )
    :effect (and
      (not (at_truck ?truck ?from))
      (at_truck ?truck ?to)
    )
  )

  ;; Use a hoist to lift a crate from a pallet at a place.
  (:action lift_crate_from_pallet
    :parameters (?hoist - hoist ?crate - crate ?pallet - pallet ?place - place)
    :precondition (and
      (at_hoist ?hoist ?place)
      (at_crate ?crate ?place)
      (at_pallet ?pallet ?place)
      (on ?crate ?pallet)
      (available ?hoist)
      (clear ?crate)
    )
    :effect (and
      (not (at_crate ?crate ?place))
      (not (on ?crate ?pallet))
      (clear ?pallet)
      (not (available ?hoist))
      (not (clear ?crate))
      (lifting ?hoist ?crate)
    )
  )

  ;; Use a hoist to lift a crate from another crate (stacking) at a place.
  (:action lift_crate_from_crate_surface
    :parameters (?hoist - hoist ?crate - crate ?surface_crate - crate ?place - place)
    :precondition (and
      (at_hoist ?hoist ?place)
      (at_crate ?crate ?place)
      (at_crate ?surface_crate ?place)
      (on ?crate ?surface_crate)
      (available ?hoist)
      (clear ?crate)
    )
    :effect (and
      (not (at_crate ?crate ?place))
      (not (on ?crate ?surface_crate))
      (clear ?surface_crate)
      (not (available ?hoist))
      (not (clear ?crate))
      (lifting ?hoist ?crate)
    )
  )

  ;; Use a hoist to drop a crate to a pallet at a place.
  (:action drop_crate_to_pallet
    :parameters (?hoist - hoist ?crate - crate ?pallet - pallet ?place - place)
    :precondition (and
      (at_hoist ?hoist ?place)
      (at_pallet ?pallet ?place)
      (clear ?pallet)
      (lifting ?hoist ?crate)
    )
    :effect (and
      (not (lifting ?hoist ?crate))
      (available ?hoist)
      (at_crate ?crate ?place)
      (on ?crate ?pallet)
      (not (clear ?pallet))
      (clear ?crate)
    )
  )

  ;; Use a hoist to drop a crate to another crate (stacking) at a place.
  (:action drop_crate_to_crate_surface
    :parameters (?hoist - hoist ?crate - crate ?surface_crate - crate ?place - place)
    :precondition (and
      (at_hoist ?hoist ?place)
      (at_crate ?surface_crate ?place)
      (clear ?surface_crate)
      (lifting ?hoist ?crate)
    )
    :effect (and
      (not (lifting ?hoist ?crate))
      (available ?hoist)
      (at_crate ?crate ?place)
      (on ?crate ?surface_crate)
      (not (clear ?surface_crate))
      (clear ?crate)
    )
  )

  ;; Use a hoist to load a crate into a truck at a place.
  (:action load_crate_into_truck
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (at_hoist ?hoist ?place)
      (at_truck ?truck ?place)
      (lifting ?hoist ?crate)
    )
    :effect (and
      (not (lifting ?hoist ?crate))
      (available ?hoist)
      (in ?crate ?truck)
      (not (at_crate ?crate ?place))
      (not (clear ?crate))
    )
  )

  ;; Use a hoist to unload a crate from a truck at a place.
  (:action unload_crate_from_truck
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (at_hoist ?hoist ?place)
      (at_truck ?truck ?place)
      (available ?hoist)
      (in ?crate ?truck)
    )
    :effect (and
      (not (in ?crate ?truck))
      (not (available ?hoist))
      (lifting ?hoist ?crate)
      (not (clear ?crate))
      (not (at_crate ?crate ?place)) ; Explicitly ensure crate is not 'at' a place when being lifted
    )
  )
)