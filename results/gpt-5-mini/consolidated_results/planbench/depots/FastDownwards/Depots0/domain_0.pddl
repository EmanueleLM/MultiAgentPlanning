(define (domain multiagent-transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    crate pallet vehicle driver hoist - object
    location
  )

  (:predicates
    ;; location of objects (crates, pallets, vehicles, drivers)
    (at ?obj - object ?loc - location)

    ;; crate is inside a vehicle
    (in ?c - crate ?v - vehicle)

    ;; crate is placed on a pallet
    (on ?c - crate ?p - pallet)

    ;; hoist is attached to a particular vehicle (fixed attachment, hoist moves with vehicle)
    (hoist-attached ?h - hoist ?v - vehicle)

    ;; hoist availability flag (must be true for hoist actions)
    (hoist-free ?h - hoist)

    ;; driver is inside a vehicle
    (driver-in ?d - driver ?v - vehicle)
  )

  ;; DRIVER actions namespace: driver-...
  (:action driver-board
    :parameters (?d - driver ?v - vehicle ?l - location)
    :precondition (and
      (at ?d ?l)
      (at ?v ?l)
    )
    :effect (and
      (driver-in ?d ?v)
      (not (at ?d ?l))
    )
  )

  (:action driver-disembark
    :parameters (?d - driver ?v - vehicle ?l - location)
    :precondition (and
      (driver-in ?d ?v)
      (at ?v ?l)
    )
    :effect (and
      (at ?d ?l)
      (not (driver-in ?d ?v))
    )
  )

  ;; driving moves the vehicle (and any crates that are in it remain 'in' the vehicle)
  (:action driver-drive
    :parameters (?d - driver ?v - vehicle ?from - location ?to - location)
    :precondition (and
      (driver-in ?d ?v)
      (at ?v ?from)
    )
    :effect (and
      (at ?v ?to)
      (not (at ?v ?from))
    )
  )

  ;; HOIST actions namespace: hoist-...
  ;; Load a crate from the current location into the attached vehicle.
  ;; Preconditions:
  ;;  - hoist is attached to the vehicle,
  ;;  - vehicle and crate are at same location,
  ;;  - hoist is free,
  ;;  - crate is not already in that vehicle.
  (:action hoist-load-into-vehicle
    :parameters (?h - hoist ?v - vehicle ?c - crate ?l - location)
    :precondition (and
      (hoist-attached ?h ?v)
      (at ?v ?l)
      (at ?c ?l)
      (hoist-free ?h)
      (not (in ?c ?v))
    )
    :effect (and
      (in ?c ?v)
      (not (at ?c ?l))
    )
  )

  ;; Place a crate from the vehicle onto a pallet at the vehicle location.
  ;; Preconditions:
  ;;  - hoist attached to vehicle,
  ;;  - vehicle and pallet are at same location,
  ;;  - crate is in the vehicle,
  ;;  - hoist is free.
  (:action hoist-place-on-pallet
    :parameters (?h - hoist ?v - vehicle ?c - crate ?p - pallet ?l - location)
    :precondition (and
      (hoist-attached ?h ?v)
      (at ?v ?l)
      (in ?c ?v)
      (at ?p ?l)
      (hoist-free ?h)
    )
    :effect (and
      (on ?c ?p)
      (not (in ?c ?v))
    )
  )
)