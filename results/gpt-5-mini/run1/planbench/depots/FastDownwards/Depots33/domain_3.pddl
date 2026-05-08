(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    truck
    hoist
    surface
    pallet crate - surface
  )

  (:predicates
    ;; location predicates
    (at_truck ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_surface ?s - surface ?p - place)    ; a surface (pallet or crate) is at a place

    ;; stacking/support
    (on ?c - crate ?s - surface)            ; crate c is directly on surface s

    ;; surface/top status
    (clear ?s - surface)                    ; the top of surface s is clear (nothing on it)

    ;; hoist state
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)

    ;; transport status
    (in_truck ?c - crate ?tr - truck)
  )

  ;; Drive a truck from one place to another place.
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at_truck ?tr ?from)
    :effect (and
      (at_truck ?tr ?to)
      (not (at_truck ?tr ?from))
    )
  )

  ;; Hoist lifts a crate from a surface (pallet or crate) at a place.
  ;; Preconditions: hoist present at place, crate on the surface at that place,
  ;; hoist available, crate clear.
  ;; Effects: hoist lifts crate, hoist becomes unavailable, crate removed from place and surface,
  ;; surface becomes clear.
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (at_surface ?c ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
      (not (at_surface ?c ?p))
      (not (on ?c ?s))
      (clear ?s)
    )
  )

  ;; Hoist drops a crate onto a surface (pallet or crate) at a place.
  ;; Preconditions: hoist and surface at place, hoist lifting crate, surface clear.
  ;; Effects: crate is at place and on the surface, crate becomes clear, surface no longer clear,
  ;; hoist becomes available and is no longer lifting the crate.
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (hoist_lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      (at_surface ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (not (clear ?s))
    )
  )

  ;; Hoist loads a (lifted) crate into a truck at a place.
  ;; Preconditions: hoist and truck at same place, hoist lifting the crate.
  ;; Effects: crate becomes in the truck, hoist becomes available and stops lifting the crate,
  ;; crate is no longer at the place (not on a surface at the place).
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (not (at_surface ?c ?p))
    )
  )

  ;; Hoist unloads a crate from a truck at a place (placing it in the hoist).
  ;; Preconditions: hoist and truck at same place, hoist available, crate in truck.
  ;; Effects: hoist lifts crate and becomes unavailable, crate no longer in truck.
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (hoist_available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
      (not (in_truck ?c ?tr))
    )
  )
)