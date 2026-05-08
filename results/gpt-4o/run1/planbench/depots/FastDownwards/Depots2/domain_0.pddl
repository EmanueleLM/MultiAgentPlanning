(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place - object
    depot distributor - place
    surface - object
    pallet crate - surface
    movable_entity - object
    truck - movable_entity
    equipment - object
    hoist - equipment
  )
  (:predicates
    (at ?entity - movable_entity ?place - place)
    (clear ?surface - surface)
    (on ?crate - crate ?surface - surface)
    (in ?crate - crate ?truck - truck)
    (hoist_available ?hoist - hoist)
    (hoist_lifting ?hoist - hoist ?crate - crate)
  )
  
  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and (at ?truck ?from))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )
  
  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?place - place)
    :precondition (and (at ?crate ?place) (at ?hoist ?place) (hoist_available ?hoist) (clear ?crate))
    :effect (and (not (at ?crate ?place)) (hoist_lifting ?hoist ?crate) (not (hoist_available ?hoist)))
  )
  
  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (hoist_lifting ?hoist ?crate) (at ?hoist ?place) (clear ?surface))
    :effect (and (at ?crate ?place) (not (hoist_lifting ?hoist ?crate)) (hoist_available ?hoist) (on ?crate ?surface) (not (clear ?surface)) (clear ?crate))
  )
  
  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (at ?truck ?place) (hoist_lifting ?hoist ?crate))
    :effect (and (not (hoist_lifting ?hoist ?crate)) (not (at ?crate ?place)) (in ?crate ?truck) (hoist_available ?hoist))
  )
  
  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (at ?truck ?place) (hoist_available ?hoist) (in ?crate ?truck))
    :effect (and (not (in ?crate ?truck)) (hoist_lifting ?hoist ?crate) (not (hoist_available ?hoist)))
  )
)