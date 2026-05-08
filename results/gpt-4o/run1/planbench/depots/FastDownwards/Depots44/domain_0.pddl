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
  
  (:action Drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (at ?truck ?from)
    :effect (and 
      (not (at ?truck ?from)) 
      (at ?truck ?to)
    )
  )
  
  (:action Lift
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
  
  (:action Drop
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
  
  (:action Load
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
  
  (:action Unload
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