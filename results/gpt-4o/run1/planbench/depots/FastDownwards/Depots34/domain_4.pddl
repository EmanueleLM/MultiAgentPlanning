(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types
    place hoist truck crate pallet surface - object
  )
  
  (:predicates
    (at ?obj - object ?place - place)
    (on ?crate - crate ?surface - surface)
    (in ?crate - crate ?truck - truck)
    (available ?hoist - hoist)
    (lifting ?hoist - hoist)
    (lifting-clear ?hoist - hoist ?crate - crate)
    (clear ?surface - surface)
    (clear-crate ?crate - crate)
    (connected ?from - place ?to - place)
  )
  
  (:action drive-truck
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and (at ?truck ?from) (connected ?from ?to))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )
  
  (:action lift-crate
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (at ?hoist ?place) (at ?crate ?place) (available ?hoist) (clear-crate ?crate) (on ?crate ?surface) (at ?surface ?place))
    :effect (and (lifting-clear ?hoist ?crate) (not (available ?hoist)) (not (on ?crate ?surface)) (clear ?surface))
  )

  (:action drop-crate
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (at ?hoist ?place) (lifting-clear ?hoist ?crate) (at ?surface ?place) (clear ?surface))
    :effect (and (available ?hoist) (not (lifting-clear ?hoist ?crate)) (on ?crate ?surface) (not (clear ?surface)) (clear-crate ?crate))
  )

  (:action load-crate
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (at ?truck ?place) (lifting-clear ?hoist ?crate))
    :effect (and (not (lifting-clear ?hoist ?crate)) (in ?crate ?truck) (available ?hoist))
  )
  
  (:action unload-crate
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (at ?truck ?place) (available ?hoist) (in ?crate ?truck))
    :effect (and (lifting-clear ?hoist ?crate) (not (available ?hoist)) (not (in ?crate ?truck)))
  )
)