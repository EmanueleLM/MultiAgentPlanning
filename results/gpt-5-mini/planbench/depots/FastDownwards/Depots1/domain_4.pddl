(define (domain depots1)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    hoist
    truck
  )

  (:predicates
    ;; locations
    (at_truck ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_place ?s - surface ?p - place)

    ;; hoist state
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; crate in truck
    (in ?c - crate ?t - truck)

    ;; stacking/support
    (clear ?s - surface)
    (on ?c - crate ?s - surface)
  )

  ;; Driver action: drive a truck from one place to another.
  ;; Preconditions: truck is at origin.
  ;; Effects: truck no longer at origin, truck at destination.
  (:action driver_drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at_truck ?tr ?from)
      ;; explicit: allow driving between any two places (no road graph encoded)
    )
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  ;; Loader / hoist actions

  ;; Lift a crate from a surface at a place.
  ;; Preconditions:
  ;;   - hoist is at the place
  ;;   - surface is at the place
  ;;   - crate is at the place and on the surface
  ;;   - hoist is available
  ;;   - crate is clear (top)
  ;; Effects:
  ;;   - crate is no longer at the place
  ;;   - crate is no longer on the surface
  ;;   - hoist is lifting the crate and becomes unavailable
  ;;   - the surface becomes clear (its top freed)
  (:action loader_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_place ?s ?p)
      (at_place ?c ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at_place ?c ?p))
      (not (on ?c ?s))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
    )
  )

  ;; Drop a crate from a hoist onto a surface at the same place.
  ;; Preconditions:
  ;;   - hoist is lifting the crate
  ;;   - hoist and target surface are at the same place
  ;;   - target surface is clear (able to accept the crate)
  ;; Effects:
  ;;   - hoist stops lifting and becomes available
  ;;   - crate is at the place and on the surface
  ;;   - target surface becomes not clear
  ;;   - the placed crate becomes clear (it is top)
  (:action loader_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (lifting ?h ?c)
      (at_hoist ?h ?p)
      (at_place ?s ?p)
      (clear ?s)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (at_place ?c ?p)
      (on ?c ?s)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; Load a crate into a truck using the hoist (hoist places crate into truck).
  ;; Preconditions:
  ;;   - hoist is lifting the crate
  ;;   - hoist and truck are co-located at the same place
  ;; Effects:
  ;;   - hoist stops lifting and becomes available
  ;;   - crate becomes in the truck
  ;;   - crate is no longer at the place
  ;; Note: crate must already have been detached from any surface by lifting.
  (:action loader_load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (lifting ?h ?c)
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (in ?c ?t)
      (not (at_place ?c ?p))
    )
  )

  ;; Unload a crate from a truck using the hoist (hoist picks crate out of truck).
  ;; Preconditions:
  ;;   - hoist is available and co-located with the truck at the place
  ;;   - crate is in the truck
  ;; Effects:
  ;;   - crate is removed from the truck
  ;;   - hoist becomes busy lifting that crate (and unavailable)
  ;; Note: after this action the hoist holds the crate and a subsequent drop/load will place it.
  (:action loader_unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (available ?h)
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (in ?c ?t)
    )
    :effect (and
      (not (in ?c ?t))
      (lifting ?h ?c)
      (not (available ?h))
    )
  )
)