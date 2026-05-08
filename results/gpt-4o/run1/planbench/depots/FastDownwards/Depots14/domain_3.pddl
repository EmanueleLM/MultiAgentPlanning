(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types place truck hoist crate surface)
  (:predicates
    (at ?obj - (either truck hoist crate surface) ?place - place)
    (available ?hoist - hoist)
    (clear ?surface - surface)
    (on ?crate - crate ?surface - surface)
    (in ?crate - crate ?truck - truck)
    (lifting ?hoist - hoist ?crate - crate)
  )

  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and (at ?truck ?from))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )

  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?place - place ?supports - surface)
    :precondition (and (at ?hoist ?place) (at ?crate ?place) 
                       (available ?hoist) (clear ?crate) (on ?crate ?supports))
    :effect (and (not (at ?crate ?place)) (lifting ?hoist ?crate) 
                 (not (available ?hoist)) (clear ?supports) 
                 (not (on ?crate ?supports)))
  )

  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?place - place ?surface - surface)
    :precondition (and (at ?hoist ?place) (lifting ?hoist ?crate) 
                       (at ?surface ?place) (clear ?surface))
    :effect (and (at ?crate ?place) (not (lifting ?hoist ?crate)) 
                 (available ?hoist) (not (clear ?surface)) 
                 (on ?crate ?surface) (clear ?crate))
  )

  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (lifting ?hoist ?crate) 
                       (at ?truck ?place))
    :effect (and (not (lifting ?hoist ?crate)) (in ?crate ?truck) 
                 (available ?hoist))
  )

  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (available ?hoist) 
                       (in ?crate ?truck))
    :effect (and (not (in ?crate ?truck)) (lifting ?hoist ?crate) 
                 (not (available ?hoist)))
  )
)