(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types place depot distributor surface pallet crate truck hoist)
  
  (:predicates
    (at ?obj - object ?loc - place)
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
      (at ?truck ?to)
    )
  )
  
  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?surf - surface ?loc - place)
    :precondition (and
      (at ?hoist ?loc)
      (available ?hoist)
      (clear ?crate)
      (on ?crate ?surf)
    )
    :effect (and
      (not (at ?crate ?loc))
      (lifting ?hoist ?crate)
      (not (available ?hoist))
      (not (on ?crate ?surf))
      (clear ?surf)
    )
  )
  
  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surf - surface ?loc - place)
    :precondition (and
      (lifting ?hoist ?crate)
      (clear ?surf)
      (at ?hoist ?loc)
    )
    :effect (and
      (available ?hoist)
      (not (lifting ?hoist ?crate))
      (on ?crate ?surf)
      (not (clear ?surf))
      (clear ?crate)
      (at ?crate ?loc)
    )
  )
  
  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?loc - place)
    :precondition (and
      (lifting ?hoist ?crate)
      (at ?truck ?loc)
      (at ?hoist ?loc)
    )
    :effect (and
      (not (lifting ?hoist ?crate))
      (available ?hoist)
      (in ?crate ?truck)
    )
  )
  
  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?loc - place)
    :precondition (and
      (at ?hoist ?loc)
      (available ?hoist)
      (in ?crate ?truck)
      (at ?truck ?loc)
    )
    :effect (and
      (lifting ?hoist ?crate)
      (not (available ?hoist))
      (not (in ?crate ?truck))
      (at ?crate ?loc)
    )
  )
)