(define (domain depots21)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    surface
    truck
    hoist
    depot distributor - place
    crate pallet - surface
  )

  (:predicates
    (at ?obj - (either truck hoist crate pallet) ?loc - place)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (clear ?s - surface) ; ?s can be a crate or a pallet
    (on ?c - crate ?s - surface) ; ?c is on ?s
    (in ?c - crate ?t - truck)
  )

  (:action drive_truck
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at ?t ?from)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action lift_crate_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?c ?p)
      (at ?s ?p) ; Ensures the surface is also at the location, for physical consistency
      (available ?h)
      (clear ?c)   ; Crate must be clear to be lifted
      (on ?c ?s)
    )
    :effect (and
      (not (at ?c ?p))    ; Crate is no longer "at" the place, but being lifted
      (lifting ?h ?c)     ; Hoist is now lifting the crate
      (not (available ?h)) ; Hoist is busy
      (clear ?s)          ; The surface it was on is now clear
      (not (on ?c ?s))    ; Crate is no longer on the surface
      (not (clear ?c))    ; ADDED: Crate is no longer clear as it's being lifted (cannot be stacked upon)
    )
  )

  (:action drop_crate_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)           ; Target surface must be clear
      (lifting ?h ?c)      ; Hoist must be lifting the crate
    )
    :effect (and
      (available ?h)       ; Hoist becomes available
      (not (lifting ?h ?c)); Hoist stops lifting
      (at ?c ?p)           ; Crate is now "at" the place
      (not (clear ?s))     ; Target surface is no longer clear
      (clear ?c)           ; Crate is now clear (can be stacked upon)
      (on ?c ?s)           ; Crate is on the surface
    )
  )

  (:action load_crate_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c)      ; Hoist must be lifting the crate
    )
    :effect (and
      (available ?h)       ; Hoist becomes available
      (not (lifting ?h ?c)); Hoist stops lifting
      (in ?c ?t)           ; Crate is in the truck
      (not (at ?c ?p))     ; Crate is not "at" the place (it's in the truck)
      ; (clear ?c) is expected to be false from lift_crate_from_surface action.
    )
  )

  (:action unload_crate_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h)       ; Hoist must be available to unload (to then lift)
      (in ?c ?t)           ; Crate must be in the truck
    )
    :effect (and
      (not (in ?c ?t))     ; Crate is no longer in the truck
      (not (available ?h)) ; Hoist becomes busy lifting
      (lifting ?h ?c)      ; Hoist is now lifting the crate
      ; (clear ?c) is expected to be false from load_crate_into_truck action.
    )
  )
)