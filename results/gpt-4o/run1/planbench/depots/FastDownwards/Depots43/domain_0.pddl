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
    :parameters (?hoist - hoist ?crate - crate ?place - place ?surface - surface)
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
      (not (on ?crate ?surface))
      (clear ?surface)
    )
  )

  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?place - place ?surface - surface)
    :precondition (and
      (at ?hoist ?place)
      (lifting ?hoist ?crate)
      (clear ?surface)
      (at ?surface ?place)
    )
    :effect (and
      (at ?crate ?place)
      (on ?crate ?surface)
      (available ?hoist)
      (not (lifting ?hoist ?crate))
      (not (clear ?surface))
      (clear ?crate)
    )
  )

  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (lifting ?hoist ?crate)
      (at ?truck ?place)
    )
    :effect (and
      (in ?crate ?truck)
      (not (lifting ?hoist ?crate))
      (available ?hoist)
    )
  )

  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (available ?hoist)
      (at ?truck ?place)
      (in ?crate ?truck)
    )
    :effect (and
      (not (in ?crate ?truck))
      (lifting ?hoist ?crate)
      (not (available ?hoist))
    )
  )
)