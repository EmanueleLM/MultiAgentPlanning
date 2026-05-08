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
    (at ?entity - object ?place - place)
    (clear ?surface - surface)
    (on ?crate - crate ?surface - surface)
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
  
  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and 
      (at ?hoist ?place) 
      (clear ?surface) 
      (lifting ?hoist ?crate)
    )
    :effect (and 
      (available ?hoist) 
      (not (lifting ?hoist ?crate)) 
      (at ?crate ?place) 
      (not (clear ?surface)) 
      (clear ?crate) 
      (on ?crate ?surface)
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
      (not (at ?crate ?place))
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