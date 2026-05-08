(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot - place
    distributor - place
    surface
    pallet - surface
    crate - surface
    hoist
    truck
  )
  (:predicates
    (at ?truck - truck ?place - place)
    (at ?hoist - hoist ?place - place)
    (at ?crate - crate ?place - place)
    (lifting ?hoist - hoist ?crate - crate)
    (clear ?surface - surface)
    (on ?crate - crate ?surface - surface)
    (available ?hoist - hoist)
    (in ?crate - crate ?truck - truck)
  )
  (:action drive
    :parameters (?truck - truck ?origin - place ?destination - place)
    :precondition (and (at ?truck ?origin))
    :effect (and (not (at ?truck ?origin)) (at ?truck ?destination))
  )
  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and 
      (at ?hoist ?place)
      (at ?crate ?place)
      (on ?crate ?surface)
      (available ?hoist)
      (clear ?crate)
    )
    :effect (and 
      (not (on ?crate ?surface))
      (lifting ?hoist ?crate)
      (not (available ?hoist))
      (clear ?surface)
    )
  )
  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (lifting ?hoist ?crate)
      (clear ?surface)
    )
    :effect (and
      (available ?hoist)
      (not (lifting ?hoist ?crate))
      (on ?crate ?surface)
      (not (clear ?surface))
    )
  )
  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (at ?truck ?place)
      (lifting ?hoist ?crate)
    )
    :effect (and
      (not (on ?crate ?place))
      (in ?crate ?truck)
      (available ?hoist)
      (not (lifting ?hoist ?crate))
    )
  )
  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (at ?truck ?place)
      (available ?hoist)
      (in ?crate ?truck)
    )
    :effect (and
      (on ?crate ?place)
      (not (in ?crate ?truck))
      (lifting ?hoist ?crate)
      (not (available ?hoist))
    )
  )
)