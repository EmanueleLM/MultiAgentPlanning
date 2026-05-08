(define (domain logistics)

  (:requirements :strips :typing :negative-preconditions)

  (:types 
    place 
    surface 
    container 
    depot - place 
    distributor - place 
    pallet - surface 
    crate - surface 
    truck - container 
    hoist)

  (:predicates
    (at ?entity ?place) 
    (on ?crate ?surface) 
    (clear ?surface) 
    (available ?hoist) 
    (lifting ?hoist ?crate) 
    (in ?crate ?truck))

  (:action drive_truck
    :parameters (?truck ?from ?to)
    :precondition (and 
      (at ?truck ?from)
      (forall (?container - container) (not (at ?container ?to))))
    :effect (and 
      (not (at ?truck ?from)) 
      (at ?truck ?to)))

  (:action lift_crate
    :parameters (?hoist ?crate ?surface ?place)
    :precondition (and 
      (at ?hoist ?place) 
      (at ?crate ?place) 
      (on ?crate ?surface) 
      (clear ?crate) 
      (available ?hoist))
    :effect (and 
      (lifting ?hoist ?crate) 
      (not (available ?hoist)) 
      (not (on ?crate ?surface)) 
      (clear ?surface)))

  (:action drop_crate
    :parameters (?hoist ?crate ?surface ?place)
    :precondition (and 
      (at ?hoist ?place) 
      (at ?surface ?place) 
      (lifting ?hoist ?crate) 
      (clear ?surface))
    :effect (and 
      (not (lifting ?hoist ?crate)) 
      (on ?crate ?surface) 
      (available ?hoist) 
      (not (clear ?surface))
      (at ?crate ?place)))

  (:action load_crate
    :parameters (?hoist ?crate ?truck ?place)
    :precondition (and 
      (at ?hoist ?place) 
      (at ?truck ?place) 
      (lifting ?hoist ?crate))
    :effect (and 
      (in ?crate ?truck) 
      (not (lifting ?hoist ?crate)) 
      (available ?hoist)))

  (:action unload_crate
    :parameters (?hoist ?crate ?truck ?place)
    :precondition (and 
      (at ?hoist ?place) 
      (at ?truck ?place) 
      (in ?crate ?truck) 
      (available ?hoist))
    :effect (and 
      (lifting ?hoist ?crate) 
      (not (in ?crate ?truck)) 
      (not (available ?hoist)
      (at ?crate ?place))))
)