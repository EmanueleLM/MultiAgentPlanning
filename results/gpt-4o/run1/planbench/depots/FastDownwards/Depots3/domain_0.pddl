(define (domain logistics)

  (:requirements :strips :typing :negative-preconditions)

  (:types
     place
     crate
     pallet
     truck
     hoist
  )

  (:predicates
     (at ?obj - (either truck crate hoist) ?place - place)
     (in_truck ?crate - crate ?truck - truck)
     (hoist_available ?hoist - hoist)
     (lifting ?hoist - hoist ?crate - crate)
     (clear ?surface - (either crate pallet))
     (on ?crate - crate ?surface - (either crate pallet))
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
    :parameters (?hoist - hoist ?crate - crate ?place - place ?surface - (either crate pallet))
    :precondition (and
      (at ?hoist ?place)
      (at ?crate ?place)
      (hoist_available ?hoist)
      (clear ?crate)
      (on ?crate ?surface)
    )
    :effect (and
      (not (on ?crate ?surface))
      (lifting ?hoist ?crate)
      (not (hoist_available ?hoist))
      (clear ?surface)
    )
  )

  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?place - place ?surface - (either crate pallet))
    :precondition (and
      (at ?hoist ?place)
      (lifting ?hoist ?crate)
      (clear ?surface)
    )
    :effect (and
      (on ?crate ?surface)
      (not (lifting ?hoist ?crate))
      (hoist_available ?hoist)
      (clear ?crate)
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
      (in_truck ?crate ?truck)
      (not (lifting ?hoist ?crate))
      (hoist_available ?hoist)
    )
  )

  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (at ?truck ?place)
      (in_truck ?crate ?truck)
      (hoist_available ?hoist)
    )
    :effect (and
      (lifting ?hoist ?crate)
      (not (in_truck ?crate ?truck))
      (not (hoist_available ?hoist))
    )
  )
)