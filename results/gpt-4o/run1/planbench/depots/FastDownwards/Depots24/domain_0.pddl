(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types
    place hoist truck crate surface - object
    depot distributor - place
    pallet - surface)
  
  (:predicates
    (at ?obj - object ?place - place)
    (hoist_available ?hoist - hoist)
    (hoist_lifting ?hoist - hoist ?crate - crate)
    (on ?crate - crate ?surface - surface)
    (in_truck ?crate - crate ?truck - truck)
    (clear ?surface - surface)
  )
  
  (:action drive_truck
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (at ?truck ?from)
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )
  
  (:action lift_crate
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (at ?hoist ?place) (at ?crate ?place) 
                       (at ?surface ?place) (hoist_available ?hoist)
                       (clear ?crate) (on ?crate ?surface))
    :effect (and (not (at ?crate ?place))
                 (not (on ?crate ?surface))
                 (clear ?surface)
                 (not (hoist_available ?hoist))
                 (hoist_lifting ?hoist ?crate))
  )
  
  (:action drop_crate
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (at ?hoist ?place) (at ?surface ?place) 
                       (hoist_lifting ?hoist ?crate) (clear ?surface))
    :effect (and (hoist_available ?hoist)
                 (not (hoist_lifting ?hoist ?crate))
                 (at ?crate ?place)
                 (on ?crate ?surface)
                 (not (clear ?surface))
                 (clear ?crate))
  )
  
  (:action load_crate_to_truck
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (at ?truck ?place) 
                       (hoist_lifting ?hoist ?crate))
    :effect (and (not (hoist_lifting ?hoist ?crate))
                 (not (hoist_available ?hoist))
                 (in_truck ?crate ?truck))
  )
  
  (:action unload_crate_from_truck
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (at ?truck ?place) 
                       (in_truck ?crate ?truck) (hoist_available ?hoist))
    :effect (and (not (in_truck ?crate ?truck))
                 (not (hoist_available ?hoist))
                 (hoist_lifting ?hoist ?crate))
  )
)