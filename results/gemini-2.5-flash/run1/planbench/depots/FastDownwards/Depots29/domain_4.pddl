(define (domain depots29)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    movable_item
    truck hoist - movable_item
  )
  (:predicates
    (at_place ?obj - movable_item ?p - place) ; Location for trucks and hoists
    (at_surface ?s - surface ?p - place) ; Location for pallets and crates (when resting on a surface)
    (connected ?from ?to - place) ; Indicates direct road connection between two places
    (hoist_available ?h - hoist) ; True if the hoist is not currently lifting anything
    (hoist_lifting ?h - hoist ?c - crate) ; True if the hoist is currently lifting the specified crate
    (on ?c - crate ?s - surface) ; True if crate ?c is physically on top of surface ?s
    (clear ?s - surface) ; True if nothing is on top of surface ?s
    (in_truck ?c - crate ?t - truck) ; True if crate ?c is inside truck ?t
  )

  (:action drive_truck
    :parameters (?t - truck ?from ?to - place)
    :precondition (and
      (at_place ?t ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (at_place ?t ?from))
      (at_place ?t ?to)
    )
  )

  (:action lift_crate
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_place ?h ?p)
      (at_surface ?c ?p) ; Crate must be at the place to be lifted
      (at_surface ?s ?p) ; The surface the crate is on must be at the place
      (hoist_available ?h)
      (clear ?c)
      (on ?c ?s)
    )
    :effect (and
      (not (at_surface ?c ?p)) ; Crate is no longer resting at the place
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
      (clear ?s) ; The surface it was on is now clear
      (not (on ?c ?s))
    )
  )

  (:action drop_crate
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_place ?h ?p)
      (at_surface ?s ?p) ; The target surface must be at the place
      (clear ?s) ; The target surface must be clear
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (at_surface ?c ?p) ; Crate is now resting at the place
      (not (clear ?s)) ; The target surface is no longer clear
      (clear ?c) ; The crate itself is clear after being dropped (nothing on top)
      (on ?c ?s)
    )
  )

  (:action load_crate
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_place ?h ?p)
      (at_place ?t ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?t)
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      ; (not (at_surface ?c ?p)) is implicitly true because it was (hoist_lifting)
    )
  )

  (:action unload_crate
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_place ?h ?p)
      (at_place ?t ?p)
      (hoist_available ?h) ; Hoist must be available to pick up the crate
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (not (hoist_available ?h))
      (hoist_lifting ?h ?c)
      ; (not (at_surface ?c ?p)) is implicitly true because it is now (hoist_lifting)
    )
  )
)