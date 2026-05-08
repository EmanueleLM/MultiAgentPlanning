(define (domain depots20)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place moveable_item - object ; Introduce a common parent for locatable things
    surface - moveable_item      ; Surface is also a moveable_item, as crates/pallets can be moved
    depot distributor - place
    hoist truck - moveable_item
    pallet crate - surface       ; Pallets and crates are surfaces
  )
  (:predicates
    (at ?obj - moveable_item ?loc - place) ; Use the new common type
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (on ?c - crate ?s - surface)
    (clear ?s - surface) ; True if nothing is on this surface (can be a pallet or crate)
    (in ?c - crate ?t - truck)
    (connected ?p1 - place ?p2 - place)
  )

  ;; Action: Drive a truck from one place to another place.
  (:action drive_truck
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at ?t ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; Action: Use a hoist to lift a crate from a surface at a place.
  (:action lift_crate
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?c ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c) ; Crate itself must be clear to be lifted
    )
    :effect (and
      (not (at ?c ?p))
      (not (on ?c ?s))
      (clear ?s)
      (not (available ?h))
      (lifting ?h ?c)
      (not (clear ?c)) ; Crate is no longer clear when lifted
    )
  )

  ;; Action: Use a hoist to drop a crate to a surface at a place.
  (:action drop_crate
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p) ; A surface must be at the place to drop a crate onto it
      (lifting ?h ?c)
      (clear ?s) ; Target surface must be clear to drop onto
    )
    :effect (and
      (at ?c ?p)
      (on ?c ?s)
      (not (clear ?s))
      (clear ?c) ; Crate becomes clear after being dropped
      (available ?h)
      (not (lifting ?h ?c))
    )
  )

  ;; Action: Use a hoist to load a crate into a truck at a place.
  (:action load_crate
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c) ; Hoist must be lifting the crate
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (in ?c ?t)
      (clear ?c) ; Crate becomes clear when loaded into truck
    )
  )

  ;; Action: Use a hoist to unload a crate from a truck at a place.
  (:action unload_crate
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h) ; Hoist must be available to pick up
      (in ?c ?t)     ; Crate must be in the truck
    )
    :effect (and
      (not (in ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
      (not (clear ?c)) ; Crate is no longer clear when lifted
    )
  )
)