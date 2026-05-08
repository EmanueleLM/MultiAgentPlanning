(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    hoist truck
  )

  (:predicates
    (at ?truck - truck ?place - place)
    (available ?hoist - hoist)
    (lifting ?hoist - hoist ?crate - crate)
    (clear ?surface - surface)
    (in ?crate - crate ?truck - truck)
    (on ?crate - crate ?surface - surface)
    (at ?crate - crate ?place - place)
    (at ?hoist - hoist ?place - place)
  )

  (:action drive
    :parameters (?truck - truck ?origin - place ?destination - place)
    :precondition (at ?truck ?origin)
    :effect (and
      (not (at ?truck ?origin))
      (at ?truck ?destination)
    )
  )

  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?place - place ?surface - surface)
    :precondition (and
      (at ?hoist ?place)
      (at ?crate ?place)
      (available ?hoist)
      (clear ?crate)
      (on ?crate ?surface)
    )
    :effect (and
      (lifting ?hoist ?crate)
      (not (available ?hoist))
      (not (at ?crate ?place))
      (clear ?surface)
      (not (on ?crate ?surface))
    )
  )

  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?place - place ?surface - surface)
    :precondition (and
      (at ?hoist ?place)
      (lifting ?hoist ?crate)
      (clear ?surface)
    )
    :effect (and
      (not (lifting ?hoist ?crate))
      (available ?hoist)
      (at ?crate ?place)
      (not (clear ?surface))
      (clear ?crate)
      (on ?crate ?surface)
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
      (not (lifting ?hoist ?crate))
      (not (available ?hoist))
      (not (at ?crate ?place))
      (in ?crate ?truck)
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
      (lifting ?hoist ?crate)
      (not (in ?crate ?truck))
      (not (available ?hoist))
    )
  )
)