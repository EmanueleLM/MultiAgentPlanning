(define (domain depots_transport)
  (:requirements :strips :typing)
  (:types place hoist truck surface)

  (:predicates
    ; locations
    (at_truck ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_surface ?s - surface ?p - place)

    ; stacking / containment
    (on ?c - surface ?s - surface)        ; c is on surface s (pallet or crate)
    (in_truck ?c - surface ?tr - truck)  ; c is inside/loaded in truck

    ; hoist state and support state
    (hoist_free ?h - hoist)
    (hoist_lifting ?h - hoist ?c - surface)
    (clear ?s - surface)                  ; nothing on top of this surface (pallet or crate)
  )

  ; DRIVER actions: move trucks between places
  (:action driver_drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at_truck ?tr ?from)
    )
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  ; LOADER / HOIST actions
  (:action loader_lift
    :parameters (?h - hoist ?c - surface ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (on ?c ?s)
      (hoist_free ?h)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))           ; crate removed from its supporting surface
      (not (at_surface ?c ?p))   ; crate not at place while lifted
      (hoist_lifting ?h ?c)      ; hoist now lifting this crate
      (not (hoist_free ?h))      ; hoist becomes occupied
      (clear ?s)                 ; supporting surface becomes clear
    )
  )

  (:action loader_drop
    :parameters (?h - hoist ?c - surface ?s - surface ?p - place)
    :precondition (and
      (hoist_lifting ?h ?c)
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (clear ?s)
    )
    :effect (and
      (not (hoist_lifting ?h ?c))
      (hoist_free ?h)
      (on ?c ?s)
      (at_surface ?c ?p)
      (not (clear ?s))
      (clear ?c)
    )
  )

  (:action loader_load
    :parameters (?h - hoist ?c - surface ?tr - truck ?p - place)
    :precondition (and
      (hoist_lifting ?h ?c)
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
    )
    :effect (and
      (not (hoist_lifting ?h ?c))
      (hoist_free ?h)
      (in_truck ?c ?tr)
    )
  )

  (:action loader_unload
    :parameters (?h - hoist ?c - surface ?tr - truck ?p - place)
    :precondition (and
      (hoist_free ?h)
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (hoist_lifting ?h ?c)
      (not (hoist_free ?h))
    )
  )
)