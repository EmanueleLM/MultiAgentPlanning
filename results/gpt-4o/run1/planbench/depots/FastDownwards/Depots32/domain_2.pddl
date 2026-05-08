(define (domain logistics)

  (:requirements :strips :typing :negative-preconditions)

  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    item
    vehicle
    truck - vehicle
    equipment
    hoist - equipment
  )

  (:predicates
    (at ?entity - item ?place - place)
    (clear ?surface - surface)
    (on ?crate - crate ?surface - surface)
    (in-truck ?crate - crate ?truck - truck)
    (hoist-available ?hoist - hoist)
    (lifted ?crate - crate ?hoist - hoist)
    (hoist-loc ?hoist - hoist ?place - place)
    (truck-loc ?truck - truck ?place - place)
  )

  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and
      (truck-loc ?truck ?from)
    )
    :effect (and
      (not (truck-loc ?truck ?from))
      (truck-loc ?truck ?to)
    )
  )

  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
      (hoist-loc ?hoist ?place)
      (at ?crate ?place)
      (on ?crate ?surface)
      (clear ?crate)
      (hoist-available ?hoist)
    )
    :effect (and
      (not (on ?crate ?surface))
      (not (clear ?crate))
      (lifted ?crate ?hoist)
      (clear ?surface)
      (not (hoist-available ?hoist))
    )
  )

  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
      (hoist-loc ?hoist ?place)
      (lifted ?crate ?hoist)
      (clear ?surface)
    )
    :effect (and
      (on ?crate ?surface)
      (clear ?crate)
      (not (lifted ?crate ?hoist))
      (hoist-available ?hoist)
      (not (clear ?surface))
    )
  )

  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (hoist-loc ?hoist ?place)
      (truck-loc ?truck ?place)
      (lifted ?crate ?hoist)
    )
    :effect (and
      (in-truck ?crate ?truck)
      (not (lifted ?crate ?hoist))
      (hoist-available ?hoist)
    )
  )

  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (hoist-loc ?hoist ?place)
      (truck-loc ?truck ?place)
      (in-truck ?crate ?truck)
      (hoist-available ?hoist)
    )
    :effect (and
      (not (in-truck ?crate ?truck))
      (lifted ?crate ?hoist)
      (not (hoist-available ?hoist))
    )
  )

)