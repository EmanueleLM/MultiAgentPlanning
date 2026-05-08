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
    (at ?place ?entity) 
    (on ?crate ?surface) 
    (clear ?surface) 
    (available ?hoist) 
    (lifting ?hoist ?crate) 
    (in ?crate ?truck))

  (:action drive_truck
    :parameters (?truck ?from ?to)
    :precondition (and 
      (at ?from ?truck))
    :effect (and 
      (not (at ?from ?truck)) 
      (at ?to ?truck)))

  (:action lift_crate
    :parameters (?hoist ?crate ?surface ?place)
    :precondition (and 
      (at ?place ?hoist) 
      (at ?place ?crate) 
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
      (at ?place ?hoist) 
      (at ?place ?surface) 
      (lifting ?hoist ?crate) 
      (clear ?surface))
    :effect (and 
      (not (lifting ?hoist ?crate)) 
      (on ?crate ?surface) 
      (available ?hoist) 
      (not (clear ?surface))))

  (:action load_crate
    :parameters (?hoist ?crate ?truck ?place)
    :precondition (and 
      (at ?place ?hoist) 
      (at ?place ?truck) 
      (lifting ?hoist ?crate))
    :effect (and 
      (in ?crate ?truck) 
      (not (lifting ?hoist ?crate)) 
      (available ?hoist)))

  (:action unload_crate
    :parameters (?hoist ?crate ?truck ?place)
    :precondition (and 
      (at ?place ?hoist) 
      (at ?place ?truck) 
      (in ?crate ?truck) 
      (available ?hoist))
    :effect (and 
      (lifting ?hoist ?crate) 
      (not (in ?crate ?truck)) 
      (not (available ?hoist))))
)