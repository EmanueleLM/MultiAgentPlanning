(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place hoist truck crate pallet surface - object
  )
  (:constants
    depot0 depot1 depot2 distributor0 - place
  )
  (:predicates
    (at ?place - place ?object - object)
    (on ?crate - crate ?surface - surface)
    (in ?crate - crate ?truck - truck)
    (available ?hoist - hoist)
    (lifting ?hoist - hoist ?crate - crate)
    (clear ?surface - surface)
    (connected ?from - place ?to - place)
  )
  (:action DriveTruck
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and (at ?from ?truck) (connected ?from ?to))
    :effect (and (not (at ?from ?truck)) (at ?to ?truck))
  )
  (:action LiftCrate
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (at ?place ?hoist) (at ?place ?crate) (available ?hoist) (clear ?crate) (on ?crate ?surface))
    :effect (and (not (at ?place ?crate)) (lifting ?hoist ?crate) (not (available ?hoist)) (not (on ?crate ?surface)) (clear ?surface))
  )
  (:action DropCrate
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (at ?place ?hoist) (lifting ?hoist ?crate) (clear ?surface))
    :effect (and (available ?hoist) (not (lifting ?hoist ?crate)) (at ?place ?crate) (on ?crate ?surface) (not (clear ?surface)) (clear ?crate))
  )
  (:action LoadCrate
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?place ?hoist) (at ?place ?truck) (lifting ?hoist ?crate))
    :effect (and (not (lifting ?hoist ?crate)) (in ?crate ?truck) (available ?hoist))
  )
  (:action UnloadCrate
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?place ?hoist) (at ?place ?truck) (available ?hoist) (in ?crate ?truck))
    :effect (and (lifting ?hoist ?crate) (not (available ?hoist)) (not (in ?crate ?truck)))
  )
)