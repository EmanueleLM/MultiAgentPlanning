(define (domain logistics-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types 
    place depot distributor - place
    surface crate pallet - surface
    hoist truck
  )
  (:predicates
    (at ?obj - ?type ?place - place)
    (clear ?surface - surface)
    (available ?hoist - hoist)
    (lifting ?hoist - hoist ?crate - crate)
    (on ?crate - crate ?surface - surface)
    (in ?crate - crate ?truck - truck)
  )
  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and (at ?truck ?from))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )
  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?place - place ?surface - surface)
    :precondition (and (at ?hoist ?place) (at ?crate ?place) (available ?hoist) (clear ?crate) (on ?crate ?surface))
    :effect (and (lifting ?hoist ?crate) (not (available ?hoist)) (not (at ?crate ?place)) (clear ?surface) (not (on ?crate ?surface)))
  )
  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?place - place ?surface - surface)
    :precondition (and (at ?hoist ?place) (clear ?surface) (lifting ?hoist ?crate))
    :effect (and (available ?hoist) (not (lifting ?hoist ?crate)) (at ?crate ?place) (on ?crate ?surface) (not (clear ?surface)) (clear ?crate))
  )
  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (at ?truck ?place) (lifting ?hoist ?crate))
    :effect (and (in ?crate ?truck) (available ?hoist) (not (lifting ?hoist ?crate)) (not (at ?crate ?place)))
  )
  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (at ?truck ?place) (available ?hoist) (in ?crate ?truck))
    :effect (and (lifting ?hoist ?crate) (not (in ?crate ?truck)) (not (available ?hoist)))
  )
)