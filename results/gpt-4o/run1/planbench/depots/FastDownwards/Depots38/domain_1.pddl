(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    vehicle
    truck - vehicle
    lifting_device
    hoist - lifting_device
  )
  (:predicates
    (at ?entity - (either crate hoist truck) ?place - place)
    (on ?crate - crate ?surface - surface)
    (clear ?surface - surface)
    (in_truck ?crate - crate ?truck - truck)
    (lifting ?hoist - hoist ?crate - crate)
    (available ?hoist - hoist)
  )
  (:action Drive_truck
    :parameters (?truck - truck ?origin - place ?destination - place)
    :precondition (at ?truck ?origin)
    :effect (and
      (not (at ?truck ?origin))
      (at ?truck ?destination)
    )
  )
  (:action Lift_crate
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (at ?crate ?place)
      (available ?hoist)
      (clear ?crate)
      (on ?crate ?surface)
    )
    :effect (and
      (not (at ?crate ?place))
      (lifting ?hoist ?crate)
      (not (available ?hoist))
      (clear ?surface)
      (not (on ?crate ?surface))
    )
  )
  (:action Drop_crate
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
      (lifting ?hoist ?crate)
      (at ?hoist ?place)
      (clear ?surface)
    )
    :effect (and
      (not (lifting ?hoist ?crate))
      (at ?crate ?place)
      (available ?hoist)
      (on ?crate ?surface)
      (not (clear ?surface))
      (clear ?crate)
    )
  )
  (:action Load_crate
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (lifting ?hoist ?crate)
      (at ?hoist ?place)
      (at ?truck ?place)
    )
    :effect (and
      (not (lifting ?hoist ?crate))
      (available ?hoist)
      (in_truck ?crate ?truck)
      (not (at ?crate ?place))
    )
  )
  (:action Unload_crate
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (in_truck ?crate ?truck)
      (at ?hoist ?place)
      (at ?truck ?place)
      (available ?hoist)
    )
    :effect (and
      (not (in_truck ?crate ?truck))
      (lifting ?hoist ?crate)
      (not (available ?hoist))
      (at ?crate ?place)
    )
  )
)