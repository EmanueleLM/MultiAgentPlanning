(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    mobile_entity
    equipment - mobile_entity
    truck hoist - equipment
  )
  
  (:predicates
    (at ?entity - mobile_entity ?location - place)
    (on ?crate - crate ?surface - surface)
    (in ?crate - crate ?truck - truck)
    (clear ?surface - surface)
    (available ?hoist - hoist)
    (lifting ?hoist - hoist ?crate - crate)
    (holding ?hoist - hoist ?crate - crate)
    (connected ?from - place ?to - place)
  )
  
  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and
      (at ?truck ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (at ?truck ?from))
      (at ?truck ?to)
    )
  )
  
  (:action lift
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
      (holding ?hoist ?crate)
      (not (available ?hoist))
      (not (on ?crate ?surface))
      (clear ?surface)
    )
  )
  
  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (holding ?hoist ?crate)
      (clear ?surface)
    )
    :effect (and
      (on ?crate ?surface)
      (available ?hoist)
      (not (holding ?hoist ?crate))
      (not (clear ?surface))
      (clear ?crate)
      (at ?crate ?place)
    )
  )
  
  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (holding ?hoist ?crate)
      (at ?truck ?place)
    )
    :effect (and
      (in ?crate ?truck)
      (not (holding ?hoist ?crate))
      (available ?hoist)
    )
  )
  
  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (at ?truck ?place)
      (available ?hoist)
      (in ?crate ?truck)
    )
    :effect (and
      (holding ?hoist ?crate)
      (not (in ?crate ?truck))
      (not (available ?hoist))
    )
  )
)