(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place truck hoist crate pallet surface
    depot - place
    distributor - place
  )
  (:predicates
    (at ?obj - (either truck hoist crate) ?place - place)
    (in ?crate - crate ?truck - truck)
    (on ?crate - crate ?surface - surface)
    (available ?hoist - hoist)
    (clear ?surface - surface)
    (clear ?crate - crate)
    (lifting ?hoist - hoist ?crate - crate)
  )
  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and (at ?truck ?from) (not (= ?from ?to)))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )
  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?place - place ?surface - surface)
    :precondition (and (at ?hoist ?place) (at ?crate ?place) (clear ?crate) 
                       (available ?hoist) (on ?crate ?surface))
    :effect (and (not (at ?crate ?place)) (lifting ?hoist ?crate)
                 (not (available ?hoist)) (not (on ?crate ?surface)) (clear ?surface))
  )
  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?place - place ?surface - surface)
    :precondition (and (lifting ?hoist ?crate) (at ?hoist ?place) (clear ?surface) (at ?surface ?place))
    :effect (and (at ?crate ?place) (not (lifting ?hoist ?crate)) (available ?hoist)
                 (on ?crate ?surface) (not (clear ?surface)) (clear ?crate))
  )
  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (lifting ?hoist ?crate) (at ?hoist ?place) (at ?truck ?place))
    :effect (and (in ?crate ?truck) (not (lifting ?hoist ?crate)) (available ?hoist))
  )
  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (in ?crate ?truck) (at ?hoist ?place) (at ?truck ?place) (available ?hoist))
    :effect (and (lifting ?hoist ?crate) (not (in ?crate ?truck)) (not (available ?hoist)))
  )
)