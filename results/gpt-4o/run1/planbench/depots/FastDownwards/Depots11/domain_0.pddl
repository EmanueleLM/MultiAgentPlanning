(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types 
    place
    depot - place
    distributor - place
    surface
    pallet - surface
    crate - surface
    truck
    hoist)

  (:predicates
    (at ?truck - truck ?place - place)
    (at ?hoist - hoist ?place - place)
    (at ?crate - crate ?place - place)
    (clear ?surface - surface)
    (on ?crate - crate ?surface - surface)
    (hoist_available ?hoist - hoist)
    (lifting ?hoist - hoist ?crate - crate)
    (in_truck ?crate - crate ?truck - truck))

  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (at ?truck ?from)
    :effect (and (not (at ?truck ?from)) (at ?truck ?to)))

  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (at ?hoist ?place) (at ?crate ?place) (clear ?crate) (on ?crate ?surface) (hoist_available ?hoist))
    :effect (and (not (at ?crate ?place)) (lifting ?hoist ?crate) (not (hoist_available ?hoist)) (clear ?surface) (not (on ?crate ?surface))))

  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (lifting ?hoist ?crate) (clear ?surface) (at ?hoist ?place))
    :effect (and (hoist_available ?hoist) (not (lifting ?hoist ?crate)) (at ?crate ?place) (not (clear ?surface)) (on ?crate ?surface) (clear ?crate)))

  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (at ?truck ?place) (lifting ?hoist ?crate))
    :effect (and (in_truck ?crate ?truck) (hoist_available ?hoist) (not (lifting ?hoist ?crate))))

  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (at ?truck ?place) (in_truck ?crate ?truck) (hoist_available ?hoist))
    :effect (and (not (in_truck ?crate ?truck)) (not (hoist_available ?hoist)) (lifting ?hoist ?crate)))
)