(define (domain depots)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place - object
    depot distributor - place
    surface - object
    pallet crate - surface
    hoist truck - object
  )
  (:predicates
    (at ?entity - object ?place - place)
    (clear ?surface - surface)
    (on ?crate - crate ?surface - surface)
    (available ?hoist - hoist)
    (lifting ?hoist - hoist ?crate - crate)
    (in ?crate - crate ?truck - truck)
    (truck_at ?truck - truck ?place - place)
    (hoist_at ?hoist - hoist ?place - place)
  )

  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and (truck_at ?truck ?from))
    :effect (and (not (truck_at ?truck ?from)) (truck_at ?truck ?to))
  )

  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (at ?crate ?place) (hoist_at ?hoist ?place) (clear ?crate) (available ?hoist) (on ?crate ?surface))
    :effect (and (lifting ?hoist ?crate) (not (available ?hoist)) (clear ?surface) (not (on ?crate ?surface)))
  )

  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and (lifting ?hoist ?crate) (hoist_at ?hoist ?place) (clear ?surface) (at ?surface ?place))
    :effect (and (on ?crate ?surface) (clear ?crate) (available ?hoist) (not (lifting ?hoist ?crate)))
  )

  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (hoist_at ?hoist ?place) (truck_at ?truck ?place) (lifting ?hoist ?crate))
    :effect (and (in ?crate ?truck) (available ?hoist) (not (lifting ?hoist ?crate)))
  )

  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and (hoist_at ?hoist ?place) (truck_at ?truck ?place) (in ?crate ?truck) (available ?hoist))
    :effect (and (lifting ?hoist ?crate) (not (in ?crate ?truck)) (not (available ?hoist)))
  )
)