(define (domain depots_specific)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place surface crate hoist truck
    depot distributor - place
    pallet - surface
  )
  (:predicates
    (at ?truck - truck ?place - place)
    (hoist_at ?hoist - hoist ?place - place)
    (crate_at ?crate - crate ?place - place)
    (clear ?surface - surface)
    (on ?crate - crate ?surface - surface)
    (available ?hoist - hoist)
    (lifting ?hoist - hoist ?crate - crate)
    (in ?crate - crate ?truck - truck)
  )
  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (at ?truck ?from)
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )
  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (hoist_at ?hoist ?place) (crate_at ?crate ?place)
                       (on ?crate ?surface) (clear ?crate) (available ?hoist) (crate_at ?crate ?place))
    :effect (and (not (on ?crate ?surface)) (lifting ?hoist ?crate)
                 (not (available ?hoist)) (clear ?surface) (not (crate_at ?crate ?place)))
  )
  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (hoist_at ?hoist ?place) (lifting ?hoist ?crate)
                       (crate_at ?crate ?place) (clear ?surface))
    :effect (and (not (lifting ?hoist ?crate)) (on ?crate ?surface)
                 (available ?hoist) (not (clear ?surface))
                 (crate_at ?crate ?place))
  )
  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (hoist_at ?hoist ?place) (at ?truck ?place) (lifting ?hoist ?crate))
    :effect (and (not (lifting ?hoist ?crate)) (in ?crate ?truck) (available ?hoist))
  )
  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (hoist_at ?hoist ?place) (at ?truck ?place) (available ?hoist) (in ?crate ?truck))
    :effect (and (not (in ?crate ?truck)) (lifting ?hoist ?crate) (not (available ?hoist)))
  )
)