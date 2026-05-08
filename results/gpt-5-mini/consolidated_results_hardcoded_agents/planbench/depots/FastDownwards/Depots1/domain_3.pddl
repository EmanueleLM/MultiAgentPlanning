(define (domain depots1)
  (:requirements :typing :negative-preconditions :strips)
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
    (truck-at ?tr - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (surface-at ?s - surface ?p - place)   ;; surface (pallet or crate) is located at place p

    ;; stacking / support
    (on ?c - crate ?s - surface)            ;; crate c is directly on surface s
    (clear ?s - surface)                    ;; top of surface s is clear (nothing on it)

    ;; hoist state
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; truck contents
    (in-truck ?c - crate ?tr - truck)
  )

  ;; DRIVE: driver agent moves a truck from one place to another
  ;; Preconditions: truck is at origin and origin != destination
  ;; Effects: truck no longer at origin, truck at destination
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (truck-at ?tr ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
    )
  )

  ;; LIFT: loader agent uses hoist to lift a crate from a surface at a place
  ;; Preconditions:
  ;;   - hoist and surface are co-located at the place
  ;;   - crate is directly on that surface
  ;;   - crate is clear (nothing on top of it)
  ;;   - hoist is available
  ;; Effects:
  ;;   - crate is no longer on the surface
  ;;   - crate is no longer recorded at the place (surface-at for crate removed)
  ;;   - hoist becomes not available and is recorded lifting the crate
  ;;   - the supporting surface becomes clear
  (:action loader-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist-available ?h)
    )
    :effect (and
      (not (on ?c ?s))
      (not (surface-at ?c ?p))
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))
      (clear ?s)
    )
  )

  ;; DROP: loader agent drops a hoist-lifted crate onto a surface at a place
  ;; Preconditions:
  ;;   - hoist is lifting the crate
  ;;   - hoist and surface are co-located at the place
  ;;   - surface is clear
  ;; Effects:
  ;;   - crate is placed on the surface
  ;;   - crate is recorded at the place
  ;;   - the surface becomes not clear
  ;;   - crate becomes clear (its top is free)
  ;;   - hoist stops lifting and becomes available
  (:action loader-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-lifting ?h ?c)
      (hoist-at ?h ?p)
      (surface-at ?s ?p)
      (clear ?s)
    )
    :effect (and
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)
      (on ?c ?s)
      (surface-at ?c ?p)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; LOAD: loader agent loads a hoist-lifted crate into a co-located truck
  ;; Preconditions:
  ;;   - hoist is lifting the crate
  ;;   - hoist and truck are co-located at the place
  ;; Effects:
  ;;   - crate becomes in the truck
  ;;   - crate is no longer considered at the place
  ;;   - hoist stops lifting and becomes available
  ;; Note: The action assumes the crate was already removed from any surface by a prior lift.
  (:action loader-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-lifting ?h ?c)
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
    )
    :effect (and
      (in-truck ?c ?tr)
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)
      (not (surface-at ?c ?p))
    )
  )

  ;; UNLOAD: loader agent unloads a crate from a co-located truck; the hoist immediately begins lifting it
  ;; Preconditions:
  ;;   - hoist is available
  ;;   - hoist and truck are co-located at the place
  ;;   - crate is in the truck
  ;; Effects:
  ;;   - crate is removed from the truck
  ;;   - hoist becomes not available and is recorded lifting the crate
  ;; Note: crate is not placed at the place or on any surface until a subsequent DROP.
  (:action loader-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-available ?h)
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (in-truck ?c ?tr)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))
      (not (surface-at ?c ?p))
    )
  )
)