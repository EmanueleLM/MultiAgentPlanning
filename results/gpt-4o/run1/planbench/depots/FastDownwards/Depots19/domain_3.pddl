(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    surface
    crate pallet - surface
    hoist
    truck
  )

  (:predicates
    (at ?truck - truck ?place - place)
    (at ?crate - crate ?place - place)
    (at ?hoist - hoist ?place - place)
    (available ?hoist - hoist)
    (clear ?surface - surface)
    (lifting ?hoist - hoist ?crate - crate)
    (on ?crate - crate ?surface - surface)
    (in ?crate - crate ?truck - truck)
  )

  (:action drive
    :parameters (?truck - truck ?origin - place ?destination - place)
    :precondition (at ?truck ?origin)
    :effect (and 
      (not (at ?truck ?origin))
      (at ?truck ?destination))
  )

  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and 
      (at ?hoist ?place) 
      (at ?crate ?place) 
      (on ?crate ?surface)
      (available ?hoist) 
      (clear ?crate))
    :effect (and
      (lifting ?hoist ?crate)
      (not (available ?hoist))
      (not (on ?crate ?surface))
      (clear ?surface)
      (not (at ?crate ?place)))
  )
  
  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and 
      (lifting ?hoist ?crate)
      (at ?hoist ?place)
      (clear ?surface))
    :effect (and
      (not (lifting ?hoist ?crate))
      (available ?hoist)
      (on ?crate ?surface)
      (not (clear ?surface))
      (at ?crate ?place)
      (clear ?crate))
  )

  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (lifting ?hoist ?crate)
      (at ?hoist ?place)
      (at ?truck ?place))
    :effect (and
      (not (lifting ?hoist ?crate))
      (in ?crate ?truck)
      (available ?hoist))
  )

  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and 
      (in ?crate ?truck) 
      (available ?hoist)
      (at ?hoist ?place) 
      (at ?truck ?place))
    :effect (and
      (not (in ?crate ?truck))
      (lifting ?hoist ?crate)
      (not (available ?hoist)))
  )
)