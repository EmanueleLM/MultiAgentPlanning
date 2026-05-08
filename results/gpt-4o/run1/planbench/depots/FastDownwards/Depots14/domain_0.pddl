(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types place truck hoist crate surface)
  (:constants
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 crate0 crate1 crate2 - surface
  )
  (:predicates
    (at ?obj - (truck hoist crate) ?place - place)
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
    :effect (and (available ?hoist) (not (lifting ?hoist ?crate)) 
                 (at ?crate ?place) (not (clear ?surface)) 
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
    :effect (and (not (in ?crate ?truck)) (not (available ?hoist))
                 (lifting ?hoist ?crate))
  )
)