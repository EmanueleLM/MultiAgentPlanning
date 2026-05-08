(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place - object
    depot distributor - place
    surface - object
    pallet crate - surface
    hoist truck - object
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
    :precondition (at ?truck ?from)
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )

  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (at ?hoist ?place) (at ?crate ?place) (clear ?crate) (available ?hoist) (on ?crate ?surface))
    :effect (and (lifting ?hoist ?crate) (not (available ?hoist)) (not (at ?crate ?place)) (clear ?surface) (not (on ?crate ?surface)))
  )

  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (lifting ?hoist ?crate) (at ?hoist ?place) (clear ?surface) (at ?surface ?place))
    :effect (and (on ?crate ?surface) (clear ?crate) (available ?hoist) (not (lifting ?hoist ?crate)) (at ?crate ?place) (not (clear ?surface)))
  )

  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (at ?truck ?place) (lifting ?hoist ?crate))
    :effect (and (in ?crate ?truck) (available ?hoist) (not (lifting ?hoist ?crate)) (not (at ?crate ?place)))
  )

  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (at ?truck ?place) (in ?crate ?truck) (available ?hoist))
    :effect (and (lifting ?hoist ?crate) (not (in ?crate ?truck)) (not (available ?hoist)))
  )
)