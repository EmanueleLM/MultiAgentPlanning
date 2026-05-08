(define (domain depots)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    hoist truck
  )
  (:predicates
    (at ?obj - (or crate hoist truck pallet) ?loc - place)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in ?c - crate ?t - truck)
  )

  ;; Drive a truck from one place to another place.
  (:action drive_truck
    :parameters (?truck - truck ?from - place ?to - place)
    :precondition (and
      (at ?truck ?from)
      (not (at ?truck ?to)) ; Truck must not already be at destination
    )
    :effect (and
      (not (at ?truck ?from))
      (at ?truck ?to)
    )
  )

  ;; Use a hoist to lift a crate from a surface at a place.
  (:action lift_crate_from_surface
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (at ?crate ?place)
      (on ?crate ?surface)
      (available ?hoist)
      (clear ?crate) ; The crate itself must be clear to be lifted
    )
    :effect (and
      (not (at ?crate ?place))
      (not (on ?crate ?surface))
      (clear ?surface) ; The surface it was on becomes clear
      (not (available ?hoist))
      (not (clear ?crate)) ; The crate is no longer clear when being lifted
      (lifting ?hoist ?crate)
    )
  )

  ;; Use a hoist to drop a crate to a surface at a place.
  (:action drop_crate_to_surface
    :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (at ?surface ?place)
      (clear ?surface) ; The target surface must be clear
      (lifting ?hoist ?crate) ; Hoist must be lifting the crate
    )
    :effect (and
      (not (lifting ?hoist ?crate))
      (available ?hoist)
      (at ?crate ?place)
      (on ?crate ?surface)
      (not (clear ?surface)) ; The target surface is no longer clear
      (clear ?crate) ; The crate itself becomes clear after being dropped
    )
  )

  ;; Use a hoist to load a crate into a truck at a place.
  (:action load_crate_into_truck
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (at ?truck ?place)
      (lifting ?hoist ?crate) ; Hoist must be lifting the crate
    )
    :effect (and
      (not (lifting ?hoist ?crate))
      (available ?hoist)
      (in ?crate ?truck)
      (not (at ?crate ?place)) ; Crate is no longer 'at' the place (on a surface or being lifted to one)
      (not (clear ?crate)) ; Crate is inside truck, not clear for stacking
    )
  )

  ;; Use a hoist to unload a crate from a truck at a place.
  (:action unload_crate_from_truck
    :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
    :precondition (and
      (at ?hoist ?place)
      (at ?truck ?place)
      (available ?hoist) ; Hoist must be available to perform unload
      (in ?crate ?truck)
    )
    :effect (and
      (not (in ?crate ?truck))
      (not (available ?hoist))
      (lifting ?hoist ?crate) ; Hoist is now lifting the crate
      (not (clear ?crate)) ; Crate is no longer clear when being lifted from truck
      ; (not (at ?crate ?place)) is implicitly true as it was inside the truck
    )
  )
)