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
    (clear ?crate - crate)
    (available ?hoist - hoist)
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
      (on ?crate ?surface)
      (at ?crate ?place)
      (clear ?crate)
      (available ?hoist)
    )
    :effect (and
      (not (on ?crate ?surface))
      (holding ?hoist ?crate)
      (not (available ?hoist))
      (clear ?surface)
    )
  )
  
  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (holding ?hoist ?crate)
      (clear ?surface)
      (at ?surface ?place)
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