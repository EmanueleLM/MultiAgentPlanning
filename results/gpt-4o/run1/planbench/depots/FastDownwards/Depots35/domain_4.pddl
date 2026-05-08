(define (domain logistics)
  (:requirements :strips :typing)
  (:types place depot distributor pallet crate surface hoist truck)

  (:predicates
    (at ?obj - (truck hoist crate pallet) ?place - place)
    (clear ?surf - surface)
    (available ?hoist - hoist)
    (on ?crate - crate ?surf - surface)
    (in ?crate - crate ?truck - truck)
    (lifting ?hoist - hoist ?crate - crate)
    (connected ?place1 ?place2 - place)
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
    :parameters (?hoist - hoist ?crate - crate ?place - place ?surf - surface)
    :precondition (and
                    (at ?hoist ?place)
                    (at ?crate ?place)
                    (available ?hoist)
                    (clear ?crate)
                    (on ?crate ?surf)
                    (at ?surf ?place))
    :effect (and
              (not (at ?crate ?place))
              (lifting ?hoist ?crate)
              (not (available ?hoist))
              (clear ?surf)
              (not (on ?crate ?surf)))
  )

  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?place - place ?surf - surface)
    :precondition (and
                    (lifting ?hoist ?crate)
                    (clear ?surf)
                    (at ?hoist ?place)
                    (at ?surf ?place))
    :effect (and
              (available ?hoist)
              (not (lifting ?hoist ?crate))
              (at ?crate ?place)
              (on ?crate ?surf)
              (not (clear ?surf))
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
                    (at ?truck ?place)
                    (at ?hoist ?place)
                    (available ?hoist))
    :effect (and
              (lifting ?hoist ?crate)
              (not (in ?crate ?truck))
              (not (available ?hoist)))
  )
)