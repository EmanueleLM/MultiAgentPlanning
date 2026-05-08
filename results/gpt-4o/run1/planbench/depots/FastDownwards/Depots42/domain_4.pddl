(define (domain depots_logistics)

  (:requirements :strips :typing :negative-preconditions)

  (:types
    place
    depot distributor - place
    truck hoist surface crate)

  (:predicates
    (at ?obj - (either truck hoist crate surface) ?place - place)
    (in_truck ?crate - crate ?truck - truck)
    (available ?hoist - hoist)
    (lifting ?hoist - hoist ?crate - crate)
    (on ?crate - crate ?surface - surface)
    (clear ?surface - surface))

  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and
      (at ?truck ?from))
    :effect (and
      (not (at ?truck ?from))
      (at ?truck ?to)))

  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
      (at ?crate ?place)
      (at ?surface ?place)
      (at ?hoist ?place)
      (available ?hoist)
      (clear ?crate)
      (on ?crate ?surface))
    :effect (and
      (lifting ?hoist ?crate)
      (not (available ?hoist))
      (not (on ?crate ?surface))
      (clear ?surface)))

  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
      (at ?surface ?place)
      (lifting ?hoist ?crate)
      (clear ?surface))
    :effect (and
      (available ?hoist)
      (not (lifting ?hoist ?crate))
      (on ?crate ?surface)
      (not (clear ?surface))
      (clear ?crate)))

  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (at ?crate ?place)
      (at ?hoist ?place)
      (at ?truck ?place)
      (lifting ?hoist ?crate))
    :effect (and
      (in_truck ?crate ?truck)
      (available ?hoist)
      (not (lifting ?hoist ?crate))
      (not (at ?crate ?place))))

  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (in_truck ?crate ?truck)
      (at ?hoist ?place)
      (at ?truck ?place)
      (available ?hoist))
    :effect (and
      (at ?crate ?place)
      (lifting ?hoist ?crate)
      (not (in_truck ?crate ?truck))
      (not (available ?hoist))))
)