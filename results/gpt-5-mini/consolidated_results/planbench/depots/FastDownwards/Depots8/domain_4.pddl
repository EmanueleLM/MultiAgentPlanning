(define (domain depot-distributor)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    crate pallet - surface
    location truck hoist
  )

  (:predicates
    ;; locations
    (truck_at ?tr - truck ?l - location)
    (hoist_at ?h - hoist ?l - location)
    (surface_at ?s - surface ?l - location)  ;; surface (pallet or crate) located at a place

    ;; placement and containers
    (crate_on_surface ?c - crate ?s - surface) ;; crate c directly on surface s (pallet or crate)
    (in_truck ?c - crate ?tr - truck)
    (crate_at ?c - crate ?l - location)        ;; crate is located at place (when resting or after drop)

    ;; surface and hoist availability
    (surface_clear ?s - surface)               ;; no object on this surface
    (crate_clear ?c - crate)                   ;; nothing on top of this crate
    (hoist_free ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)      ;; hoist currently lifting this crate
  )

  ;; DRIVER: drive a truck from one place to another
  (:action driver-drive-truck
    :parameters (?tr - truck ?from - location ?to - location)
    :precondition (and
      (truck_at ?tr ?from)
    )
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
    )
  )

  ;; HOIST movement between locations
  (:action hoist-move
    :parameters (?h - hoist ?from - location ?to - location)
    :precondition (and
      (hoist_at ?h ?from)
    )
    :effect (and
      (not (hoist_at ?h ?from))
      (hoist_at ?h ?to)
    )
  )

  ;; LIFT a crate from a pallet surface
  (:action hoist-lift-from-pallet
    :parameters (?h - hoist ?p - pallet ?loc - location ?c - crate)
    :precondition (and
      (hoist_at ?h ?loc)
      (surface_at ?p ?loc)
      (crate_on_surface ?c ?p)
      (hoist_free ?h)
      (crate_clear ?c)
    )
    :effect (and
      ;; remove stacking and location of the lifted crate
      (not (crate_on_surface ?c ?p))
      (not (crate_at ?c ?loc))
      (not (surface_at ?c ?loc))

      ;; hoist state
      (hoist_lifting ?h ?c)
      (not (hoist_free ?h))

      ;; pallet becomes clear after removing the crate
      (surface_clear ?p)
    )
  )

  ;; LIFT a crate from another crate surface
  (:action hoist-lift-from-crate
    :parameters (?h - hoist ?s - crate ?loc - location ?c - crate)
    :precondition (and
      (hoist_at ?h ?loc)
      (surface_at ?s ?loc)
      (crate_on_surface ?c ?s)
      (hoist_free ?h)
      (crate_clear ?c)
    )
    :effect (and
      ;; remove stacking and location of the lifted crate
      (not (crate_on_surface ?c ?s))
      (not (crate_at ?c ?loc))
      (not (surface_at ?c ?loc))

      ;; hoist state
      (hoist_lifting ?h ?c)
      (not (hoist_free ?h))

      ;; supporting crate becomes clear
      (surface_clear ?s)
      (crate_clear ?s)
    )
  )

  ;; LOAD a lifted crate into a truck (crate goes into truck)
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?tr - truck ?loc - location ?c - crate)
    :precondition (and
      (hoist_at ?h ?loc)
      (truck_at ?tr ?loc)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      ;; crate enters truck
      (in_truck ?c ?tr)

      ;; crate is no longer at the location or a surface while inside truck
      (not (crate_at ?c ?loc))
      (not (surface_at ?c ?loc))

      ;; hoist becomes free and stops lifting
      (not (hoist_lifting ?h ?c))
      (hoist_free ?h)
    )
  )

  ;; UNLOAD a crate from a truck into the hoist (hoist starts lifting it)
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?tr - truck ?loc - location ?c - crate)
    :precondition (and
      (hoist_at ?h ?loc)
      (truck_at ?tr ?loc)
      (hoist_free ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      ;; crate removed from truck and hoist lifts it
      (not (in_truck ?c ?tr))
      (hoist_lifting ?h ?c)
      (not (hoist_free ?h))

      ;; crate is not considered at the location while hoist is lifting it
      (not (crate_at ?c ?loc))
      (not (surface_at ?c ?loc))
    )
  )

  ;; DROP a lifted crate onto a pallet surface
  (:action hoist-drop-to-pallet
    :parameters (?h - hoist ?p - pallet ?loc - location ?c - crate)
    :precondition (and
      (hoist_at ?h ?loc)
      (surface_at ?p ?loc)
      (surface_clear ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      ;; hoist releases crate
      (hoist_free ?h)
      (not (hoist_lifting ?h ?c))

      ;; crate now at location and on pallet p
      (crate_at ?c ?loc)
      (surface_at ?c ?loc)
      (crate_on_surface ?c ?p)

      ;; pallet is no longer clear; crate is clear
      (not (surface_clear ?p))
      (crate_clear ?c)
    )
  )

  ;; DROP a lifted crate onto another crate surface
  (:action hoist-drop-to-crate
    :parameters (?h - hoist ?s - crate ?loc - location ?c - crate)
    :precondition (and
      (hoist_at ?h ?loc)
      (surface_at ?s ?loc)
      (surface_clear ?s)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      ;; hoist releases crate
      (hoist_free ?h)
      (not (hoist_lifting ?h ?c))

      ;; crate now at location and on crate s
      (crate_at ?c ?loc)
      (surface_at ?c ?loc)
      (crate_on_surface ?c ?s)

      ;; supporting crate is no longer clear; new crate is clear
      (not (surface_clear ?s))
      (not (crate_clear ?s))
      (crate_clear ?c)
    )
  )
)