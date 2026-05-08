(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place hoist truck crate pallet surface - object
  )
  (:constants
    depot0 depot1 depot2 distributor0 - place
  )
  (:predicates
    (at ?object - object ?place - place)
    (on ?crate - crate ?surface - surface)
    (in ?crate - crate ?truck - truck)
    (available ?hoist - hoist)
    (lifting ?hoist - hoist ?crate - crate)
    (clear ?surface - surface)
    (connected ?from - place ?to - place)
  )
  (:action DriveTruck
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and (at ?truck ?from) (connected ?from ?to))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )
  (:action LiftCrate
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (at ?hoist ?place) (at ?crate ?place) (available ?hoist) (clear ?crate) (on ?crate ?surface))
    :effect (and (not (at ?crate ?place)) (lifting ?hoist ?crate) (not (available ?hoist)) (not (on ?crate ?surface)) (clear ?surface))
  )
  (:action DropCrate
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (at ?hoist ?place) (lifting ?hoist ?crate) (clear ?surface))
    :effect (and (available ?hoist) (not (lifting ?hoist ?crate)) (at ?crate ?place) (on ?crate ?surface) (not (clear ?surface)) (clear ?crate))
  )
  (:action LoadCrate
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (at ?truck ?place) (lifting ?hoist ?crate))
    :effect (and (not (lifting ?hoist ?crate)) (in ?crate ?truck) (available ?hoist))
  )
  (:action UnloadCrate
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (at ?truck ?place) (available ?hoist) (in ?crate ?truck))
    :effect (and (lifting ?hoist ?crate) (not (available ?hoist)) (not (in ?crate ?truck)))
  )
)