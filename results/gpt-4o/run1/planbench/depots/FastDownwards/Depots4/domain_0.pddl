(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    surface
    crate pallet - surface
    hoist truck)
  (:predicates
    (at ?obj - (either truck crate hoist) ?place - place)
    (hoist_available ?hoist - hoist)
    (lifting ?hoist - hoist ?crate - crate)
    (on ?crate - crate ?surface - surface)
    (clear ?crate_or_pallet - surface)
    (in_truck ?crate - crate ?truck - truck))
  
  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and (at ?truck ?from))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to)))

  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (at ?hoist ?place) (at ?crate ?place) (at ?surface ?place)
                       (on ?crate ?surface) (hoist_available ?hoist) (clear ?crate))
    :effect (and (not (at ?crate ?place)) (lifting ?hoist ?crate)
                 (not (hoist_available ?hoist)) (clear ?surface) (not (on ?crate ?surface))))

  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (at ?hoist ?place) (at ?surface ?place)
                       (clear ?surface) (lifting ?hoist ?crate))
    :effect (and (at ?crate ?place) (on ?crate ?surface) (clear ?crate)
                 (hoist_available ?hoist) (not (lifting ?hoist ?crate))
                 (not (clear ?surface))))

  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (at ?truck ?place) (lifting ?hoist ?crate))
    :effect (and (in_truck ?crate ?truck) (hoist_available ?hoist)
                 (not (lifting ?hoist ?crate))))

  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (at ?hoist ?place) (at ?truck ?place)
                       (hoist_available ?hoist) (in_truck ?crate ?truck))
    :effect (and (lifting ?hoist ?crate) (not (in_truck ?crate ?truck))
                 (not (hoist_available ?hoist)))))