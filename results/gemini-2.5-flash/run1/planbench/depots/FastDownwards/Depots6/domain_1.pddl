(define (domain depots6)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place - object
    depot distributor - place
    surface - object
    pallet crate - surface
    hoist - object
    truck - object
  )

  (:predicates
    (at ?obj - (or truck hoist crate pallet) ?loc - place)
    (on ?crate - crate ?surface - surface)
    (in ?crate - crate ?truck - truck)
    (available ?hoist - hoist)
    (lifting ?hoist - hoist ?crate - crate)
    (clear ?surface - surface)
  )

  (:action drive)
    (:parameters (?truck - truck ?from - place ?to - place)
    (:precondition (at ?truck ?from))
    (:effect
      (and (not (at ?truck ?from))
           (at ?truck ?to)
      )
    )
  )

  (:action lift)
    (:parameters (?hoist - hoist ?crate - crate ?surface - surface ?p - place)
    (:precondition
      (and (at ?hoist ?p)
           (at ?crate ?p)
           (available ?hoist)
           (clear ?crate)
           (on ?crate ?surface)
      )
    )
    (:effect
      (and (not (at ?crate ?p))
           (lifting ?hoist ?crate)
           (not (available ?hoist))
           (clear ?surface)
           (not (on ?crate ?surface))
      )
    )
  )

  (:action drop)
    (:parameters (?hoist - hoist ?crate - crate ?surface - surface ?p - place)
    (:precondition
      (and (at ?hoist ?p)
           (at ?surface ?p)
           (clear ?surface)
           (lifting ?hoist ?crate)
      )
    )
    (:effect
      (and (available ?hoist)
           (not (lifting ?hoist ?crate))
           (at ?crate ?p)
           (not (clear ?surface))
           (clear ?crate)
           (on ?crate ?surface)
      )
    )
  )

  (:action load)
    (:parameters (?hoist - hoist ?crate - crate ?truck - truck ?p - place)
    (:precondition
      (and (at ?hoist ?p)
           (at ?truck ?p)
           (lifting ?hoist ?crate)
      )
    )
    (:effect
      (and (not (lifting ?hoist ?crate))
           (available ?hoist)
           (in ?crate ?truck)
      )
    )
  )

  (:action unload)
    (:parameters (?hoist - hoist ?crate - crate ?truck - truck ?p - place)
    (:precondition
      (and (at ?hoist ?p)
           (at ?truck ?p)
           (available ?hoist)
           (in ?crate ?truck)
      )
    )
    (:effect
      (and (not (in ?crate ?truck))
           (not (available ?hoist))
           (lifting ?hoist ?crate)
      )
    )
  )
)