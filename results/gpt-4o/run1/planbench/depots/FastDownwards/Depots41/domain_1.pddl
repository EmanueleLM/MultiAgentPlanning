(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place crate truck hoist surface
    depot distributor - place
    pallet - surface
  )

  (:predicates
    ; Object location
    (at ?obj - (either crate truck hoist pallet) ?place - place)
    ; Surface clearance
    (clear ?surface - surface)
    ; Crate on a surface
    (on ?crate - crate ?surface - surface)
    ; Hoist availability
    (available ?hoist - hoist)
    ; Hoist lifting a crate
    (lifting ?hoist - hoist ?crate - crate)
    ; Crate inside a truck
    (in ?crate - crate ?truck - truck)
  )

  ;; Driving a truck between places
  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and
      (at ?truck ?from)
    )
    :effect (and
      (not (at ?truck ?from))
      (at ?truck ?to)
    )
  )

  ;; Lifting a crate with a hoist
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
      (not (at ?crate ?place))
      (lifting ?hoist ?crate)
      (not (available ?hoist))
      (clear ?surface)
      (not (on ?crate ?surface))
    )
  )

  ;; Dropping a crate onto a pallet with a hoist
  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
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

  ;; Loading a crate into a truck with a hoist
  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (at ?truck ?place)
      (lifting ?hoist ?crate)
    )
    :effect (and
      (not (lifting ?hoist ?crate))
      (in ?crate ?truck)
      (available ?hoist)
    )
  )

  ;; Unloading a crate from a truck with a hoist
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