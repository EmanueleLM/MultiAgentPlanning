(define (domain logistics)

(:requirements :strips :typing :negative-preconditions)

(:types
  place
  truck
  hoist
  surface
  crate - surface
  depot distributor - place
  pallet - surface
)

(:predicates
  (at ?entity - (either truck hoist pallet) ?place - place)
  (clear ?surface - surface)
  (on ?crate - crate ?surface - surface)
  (available ?hoist - hoist)
  (in ?crate - crate ?truck - truck)
  (lifting ?hoist - hoist ?crate - crate)
)

(:action drive_truck
  :parameters (?truck - truck ?from - place ?to - place)
  :precondition (at ?truck ?from)
  :effect (and 
    (not (at ?truck ?from))
    (at ?truck ?to)
  )
)

(:action lift_crate
  :parameters (?crate - crate ?surface - surface ?hoist - hoist ?place - place)
  :precondition (and 
    (at ?crate ?place)
    (at ?hoist ?place)
    (clear ?crate)
    (available ?hoist)
    (on ?crate ?surface)
  )
  :effect (and
    (not (at ?crate ?place))
    (lifting ?hoist ?crate)
    (not (available ?hoist))
    (clear ?surface)
    (not (on ?crate ?surface))
  )
)

(:action drop_crate
  :parameters (?crate - crate ?surface - surface ?hoist - hoist ?place - place)
  :precondition (and 
    (at ?hoist ?place)
    (clear ?surface)
    (lifting ?hoist ?crate)
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

(:action load_crate
  :parameters (?crate - crate ?hoist - hoist ?truck - truck ?place - place)
  :precondition (and 
    (at ?hoist ?place)
    (at ?truck ?place)
    (lifting ?hoist ?crate)
  )
  :effect (and 
    (not (lifting ?hoist ?crate))
    (available ?hoist)
    (in ?crate ?truck)
  )
)

(:action unload_crate
  :parameters (?crate - crate ?hoist - hoist ?truck - truck ?place - place)
  :precondition (and 
    (at ?hoist ?place)
    (at ?truck ?place)
    (available ?hoist)
    (in ?crate ?truck)
  )
  :effect (and
    (not (in ?crate ?truck))
    (lifting ?hoist ?crate)
    (not (available ?hoist))
  )
)

)