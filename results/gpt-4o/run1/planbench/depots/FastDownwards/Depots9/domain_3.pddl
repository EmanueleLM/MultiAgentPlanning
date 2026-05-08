(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types place depot distributor surface pallet crate truck hoist)

  (:predicates
    (at ?obj - (either truck hoist crate) ?loc - place)
    (clear ?surf - surface)
    (on ?crate - crate ?surf - surface)
    (available ?hoist - hoist)
    (lifting ?hoist - hoist ?crate - crate)
    (in ?crate - crate ?truck - truck)
  )

  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (at ?truck ?from)
    :effect (and
      (not (at ?truck ?from))
      (at ?truck ?to))
  )

  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?surf - surface ?loc - place)
    :precondition (and
      (at ?hoist ?loc)
      (available ?hoist)
      (clear ?crate)
      (on ?crate ?surf)
      (at ?crate ?loc))
    :effect (and
      (lifting ?hoist ?crate)
      (not (available ?hoist))
      (not (on ?crate ?surf))
      (clear ?surf))
  )

  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surf - surface ?loc - place)
    :precondition (and
      (lifting ?hoist ?crate)
      (clear ?surf)
      (at ?hoist ?loc))
    :effect (and
      (available ?hoist)
      (not (lifting ?hoist ?crate))
      (on ?crate ?surf)
      (not (clear ?surf))
      (clear ?crate))
  )

  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?loc - place)
    :precondition (and
      (lifting ?hoist ?crate)
      (at ?truck ?loc)
      (at ?hoist ?loc))
    :effect (and
      (in ?crate ?truck)
      (available ?hoist)
      (not (lifting ?hoist ?crate)))
  )

  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?loc - place)
    :precondition (and
      (at ?hoist ?loc)
      (available ?hoist)
      (in ?crate ?truck)
      (at ?truck ?loc))
    :effect (and
      (lifting ?hoist ?crate)
      (not (available ?hoist))
      (not (in ?crate ?truck)))
  )
)