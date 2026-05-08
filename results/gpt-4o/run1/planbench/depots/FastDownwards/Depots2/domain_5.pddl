(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place - object
    depot distributor - place
    surface - object
    pallet crate - surface
    truck hoist - object
  )
  (:predicates
    (at ?entity - object ?place - place)
    (clear ?surface - surface)
    (on ?crate - crate ?surface - surface)
    (in ?crate - crate ?truck - truck)
    (hoist_available ?hoist - hoist)
    (hoist_lifting ?hoist - hoist ?crate - crate)
    (connected ?from - place ?to - place) ; Ensure connectivity between places
  )

  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and (at ?truck ?from) (connected ?from ?to)) ; Add precondition for connectivity
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )

  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (at ?crate ?place) (at ?hoist ?place) (on ?crate ?surface) 
                       (hoist_available ?hoist) (clear ?crate))
    :effect (and (not (at ?crate ?place)) (hoist_lifting ?hoist ?crate) 
                 (not (hoist_available ?hoist)) (not (on ?crate ?surface)) 
                 (clear ?surface))
  )

  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (hoist_lifting ?hoist ?crate) (at ?hoist ?place) (clear ?surface))
    :effect (and (at ?crate ?place) (not (hoist_lifting ?hoist ?crate)) 
                 (hoist_available ?hoist) (on ?crate ?surface) 
                 (not (clear ?surface)) (clear ?crate))
  )

  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (at ?truck ?place) (hoist_lifting ?hoist ?crate))
    :effect (and (not (hoist_lifting ?hoist ?crate)) (not (at ?crate ?place)) 
                 (in ?crate ?truck) (hoist_available ?hoist))
  )

  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (at ?truck ?place) (hoist_available ?hoist) (in ?crate ?truck))
    :effect (and (not (in ?crate ?truck)) (hoist_lifting ?hoist ?crate) 
                 (not (hoist_available ?hoist)) (at ?crate ?place))
  )
)