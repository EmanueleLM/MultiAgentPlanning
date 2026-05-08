(define (domain logistics_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place - object
    depot distributor - place
    surface - object
    pallet crate - surface
    thing - object
    truck hoist crate pallet - thing
  )
  (:predicates
    (at ?thing - thing ?place - place)
    (clear ?surface - surface)
    (available ?hoist - hoist)
    (lifting ?hoist - hoist ?crate - crate)
    (in ?crate - crate ?truck - truck)
    (on ?crate1 - crate ?surface - surface)
  )
  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (at ?truck ?from)
    :effect (and
      (not (at ?truck ?from))
      (at ?truck ?to)
    )
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
      (lifting ?hoist ?crate)
      (clear ?surface)
      (not (available ?hoist))
      (not (on ?crate ?surface))
      (not (at ?crate ?place))
    )
  )
  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
      (lifting ?hoist ?crate)
      (at ?hoist ?place)
      (at ?surface ?place)
      (clear ?surface)
    )
    :effect (and
      (on ?crate ?surface)
      (at ?crate ?place)
      (clear ?crate)
      (available ?hoist)
      (not (lifting ?hoist ?crate))
      (not (clear ?surface))
    )
  )
  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (lifting ?hoist ?crate)
      (at ?hoist ?place)
      (at ?truck ?place)
    )
    :effect (and
      (in ?crate ?truck)
      (available ?hoist)
      (not (lifting ?hoist ?crate))
    )
  )
  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (in ?crate ?truck)
      (at ?truck ?place)
      (at ?hoist ?place)
      (available ?hoist)
    )
    :effect (and
      (lifting ?hoist ?crate)
      (not (in ?crate ?truck))
      (not (available ?hoist))
    )
  )
)