(define (domain logistics)

  (:requirements :strips :typing :negative-preconditions)
  
  (:types 
    place 
    surface 
    crate 
    hoist 
    truck
  )
  
  (:predicates 
    (at ?entity - (either truck hoist surface) ?place - place)
    (clear ?surface - surface)
    (on ?crate - (either crate surface) ?surface - surface)
    (available ?hoist - hoist)
    (lifting ?hoist - hoist ?crate - crate)
    (in ?crate - crate ?truck - truck)
  )
  
  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and (at ?truck ?from))
    :effect (and 
      (not (at ?truck ?from)) 
      (at ?truck ?to)
    )
  )
  
  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?surface - (either crate surface) ?place - place)
    :precondition (and 
      (at ?hoist ?place) 
      (at ?surface ?place)
      (available ?hoist)
      (clear ?crate) 
      (on ?crate ?surface)
    )
    :effect (and 
      (lifting ?hoist ?crate)
      (not (available ?hoist))
      (not (clear ?crate))
      (not (on ?crate ?surface))
      (clear ?surface)
    )
  )
  
  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and 
      (at ?hoist ?place)
      (at ?surface ?place)
      (clear ?surface)
      (lifting ?hoist ?crate)
    )
    :effect (and 
      (available ?hoist)
      (not (lifting ?hoist ?crate))
      (on ?crate ?surface)
      (clear ?crate)
      (not (clear ?surface))
    )
  )
  
  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and 
      (at ?hoist ?place)
      (at ?truck ?place)
      (lifting ?hoist ?crate)
    )
    :effect (and 
      (not (lifting ?hoist ?crate))
      (in ?crate ?truck) 
      (available ?hoist)
    )
  )
  
  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and 
      (at ?hoist ?place) 
      (at ?truck ?place) 
      (in ?crate ?truck)
      (available ?hoist)
    )
    :effect (and 
      (not (in ?crate ?truck)) 
      (lifting ?hoist ?crate)
      (not (available ?hoist))
    )
  )
)