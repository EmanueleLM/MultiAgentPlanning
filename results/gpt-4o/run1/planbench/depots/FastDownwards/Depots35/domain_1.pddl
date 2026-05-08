(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types place depot distributor surface crate hoist truck)
  
  (:predicates
    (at ?object - (truck hoist crate) ?place - place)
    (clear ?surface - surface)
    (available ?hoist - hoist)
    (on ?crate - crate ?surface - surface)
    (in ?crate - crate ?truck - truck)
    (lifting ?hoist - hoist ?crate - crate)
    (connected ?place1 - place ?place2 - place)
  )

  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and
                    (at ?truck ?from)
                    (connected ?from ?to))
    :effect (and
              (not (at ?truck ?from))
              (at ?truck ?to))
  )

  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?place - place ?surface - surface)
    :precondition (and
                    (at ?hoist ?place)
                    (at ?crate ?place)
                    (available ?hoist)
                    (clear ?surface)
                    (on ?crate ?surface))
    :effect (and
              (not (at ?crate ?place))
              (lifting ?hoist ?crate)
              (not (available ?hoist))
              (clear ?surface)
              (not (on ?crate ?surface)))
  )

  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?place - place ?surface - surface)
    :precondition (and
                    (lifting ?hoist ?crate)
                    (clear ?surface)
                    (at ?hoist ?place))
    :effect (and
              (available ?hoist)
              (not (lifting ?hoist ?crate))
              (at ?crate ?place)
              (on ?crate ?surface)
              (not (clear ?surface))
              (clear ?crate))
  )

  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
                    (lifting ?hoist ?crate)
                    (at ?truck ?place)
                    (at ?hoist ?place))
    :effect (and
              (in ?crate ?truck)
              (available ?hoist)
              (not (lifting ?hoist ?crate)))
  )

  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
                    (in ?crate ?truck)
                    (available ?hoist)
                    (at ?truck ?place)
                    (at ?hoist ?place))
    :effect (and
              (not (in ?crate ?truck))
              (lifting ?hoist ?crate)
              (not (available ?hoist)))
  )
)