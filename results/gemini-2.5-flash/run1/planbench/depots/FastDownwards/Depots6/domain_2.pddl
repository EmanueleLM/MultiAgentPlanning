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
    (at ?obj - (either truck hoist crate pallet) ?loc - place)
    (on ?crate - crate ?surface - surface)
    (in ?crate - crate ?truck - truck)
    (available ?hoist - hoist)
    (lifting ?hoist - hoist ?crate - crate)
    (clear ?surface - surface)
  )

  (:action drive
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (at ?truck ?from)
    :effect
      (and (not (at ?truck ?from))
           (at ?truck ?to)
      )
  )

  (:action lift
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?p - place)
    :precondition
      (and (at ?hoist ?p)
           (at ?crate ?p)
           (available ?hoist)
           (clear ?crate) ; The crate itself is clear, meaning nothing is on it
           (on ?crate ?surface) ; The crate is currently on this surface
      )
    :effect
      (and (not (at ?crate ?p)) ; Crate is no longer at the place
           (lifting ?hoist ?crate)
           (not (available ?hoist))
           (clear ?surface) ; The surface it was on is now clear
           (not (on ?crate ?surface))
           (not (clear ?crate)) ; Crate is being lifted, so it's not "clear" in the stack sense
      )
  )

  (:action drop
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?p - place)
    :precondition
      (and (at ?hoist ?p)
           (at ?surface ?p)
           (clear ?surface) ; The target surface must be clear
           (lifting ?hoist ?crate)
      )
    :effect
      (and (available ?hoist)
           (not (lifting ?hoist ?crate))
           (at ?crate ?p)
           (not (clear ?surface)) ; The surface is no longer clear
           (clear ?crate) ; The crate is now the top item
           (on ?crate ?surface)
      )
  )

  (:action load
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?p - place)
    :precondition
      (and (at ?hoist ?p)
           (at ?truck ?p)
           (lifting ?hoist ?crate)
      )
    :effect
      (and (not (lifting ?hoist ?crate))
           (available ?hoist)
           (in ?crate ?truck)
           (clear ?crate) ; After being loaded, the crate itself is "clear" if it's the only one in the truck or the top one. This is implied by the unload action's clear effect (crate itself becoming clear implies it was not clear before, or it's now accessible). Given the lack of a stacking mechanism within trucks, it's safer to assume a loaded crate is clear.
      )
  )

  (:action unload
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?p - place)
    :precondition
      (and (at ?hoist ?p)
           (at ?truck ?p)
           (available ?hoist)
           (in ?crate ?truck)
      )
    :effect
      (and (not (in ?crate ?truck))
           (not (available ?hoist))
           (lifting ?hoist ?crate)
           (not (clear ?crate)) ; Crate is being lifted, so it's not "clear" in the stack sense
      )
  )
)