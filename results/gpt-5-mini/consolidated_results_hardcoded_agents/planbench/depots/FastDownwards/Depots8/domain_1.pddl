(define (domain depot-distributor)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location truck hoist surface step
  )
  (:types
    crate pallet - surface
  )

  (:predicates
    ;; Locations
    (truck_at ?tr - truck ?l - location)
    (hoist_at ?h - hoist ?l - location)
    (surface_at ?s - surface ?l - location)

    ;; Stage progression
    (current ?st - step)
    (next ?st - step ?st2 - step)

    ;; Placement and containers
    (crate_on_surface ?c - crate ?s - surface)  ;; crate placed on a surface (pallet or crate)
    (in_truck ?c - crate ?tr - truck)
    (crate_at ?c - crate ?l - location)         ;; crate is located at a place (when resting or after drop)

    ;; Surface and resource availability
    (surface_clear ?s - surface)               ;; no object on this surface
    (pallet_free ?p - pallet)                  ;; pallet free (no crate on it)
    (hoist_free ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)      ;; hoist currently lifting this crate

    ;; Per-crate clear (nothing on top of this crate)
    (crate_clear ?c - crate)
  )

  ;; DRIVER actions (namespaced)
  (:action driver-drive-truck
    :parameters (?tr - truck ?from - location ?to - location ?st - step ?st2 - step)
    :precondition (and
      (truck_at ?tr ?from)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; HOIST movement
  (:action hoist-move
    :parameters (?h - hoist ?from - location ?to - location ?st - step ?st2 - step)
    :precondition (and
      (hoist_at ?h ?from)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      (not (hoist_at ?h ?from))
      (hoist_at ?h ?to)
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; LIFT actions (two flavors: lift a crate from a pallet surface, or from another crate surface)
  (:action hoist-lift-from-pallet
    :parameters (?h - hoist ?p - pallet ?loc - location ?c - crate ?st - step ?st2 - step)
    :precondition (and
      (hoist_at ?h ?loc)
      (surface_at ?p ?loc)
      (crate_on_surface ?c ?p)
      (hoist_free ?h)
      (crate_clear ?c)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      (not (crate_on_surface ?c ?p))
      (not (crate_at ?c ?loc))
      (hoist_lifting ?h ?c)
      (not (hoist_free ?h))
      (surface_clear ?p)
      (pallet_free ?p)
      (not (current ?st))
      (current ?st2)
    )
  )

  (:action hoist-lift-from-crate
    :parameters (?h - hoist ?s - crate ?loc - location ?c - crate ?st - step ?st2 - step)
    :precondition (and
      (hoist_at ?h ?loc)
      (surface_at ?s ?loc)
      (crate_on_surface ?c ?s)
      (hoist_free ?h)
      (crate_clear ?c)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      (not (crate_on_surface ?c ?s))
      (not (crate_at ?c ?loc))
      (hoist_lifting ?h ?c)
      (not (hoist_free ?h))
      (surface_clear ?s)
      (crate_clear ?s)
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; LOAD into truck (hoist places lifted crate into truck)
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?tr - truck ?loc - location ?c - crate ?st - step ?st2 - step)
    :precondition (and
      (hoist_at ?h ?loc)
      (truck_at ?tr ?loc)
      (hoist_lifting ?h ?c)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      (in_truck ?c ?tr)
      (not (hoist_lifting ?h ?c))
      (hoist_free ?h)
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; UNLOAD from truck (hoist picks crate out of truck, becomes not free and lifts crate)
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?tr - truck ?loc - location ?c - crate ?st - step ?st2 - step)
    :precondition (and
      (hoist_at ?h ?loc)
      (truck_at ?tr ?loc)
      (hoist_free ?h)
      (in_truck ?c ?tr)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (not (hoist_free ?h))
      (hoist_lifting ?h ?c)
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; DROP actions (two flavors: drop onto a pallet, or drop onto another crate)
  (:action hoist-drop-to-pallet
    :parameters (?h - hoist ?p - pallet ?loc - location ?c - crate ?st - step ?st2 - step)
    :precondition (and
      (hoist_at ?h ?loc)
      (surface_at ?p ?loc)
      (surface_clear ?p)
      (hoist_lifting ?h ?c)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      (hoist_free ?h)
      (not (hoist_lifting ?h ?c))
      (crate_at ?c ?loc)
      (not (surface_clear ?p))
      (not (pallet_free ?p))
      (crate_clear ?c)
      (crate_on_surface ?c ?p)
      (not (current ?st))
      (current ?st2)
    )
  )

  (:action hoist-drop-to-crate
    :parameters (?h - hoist ?s - crate ?loc - location ?c - crate ?st - step ?st2 - step)
    :precondition (and
      (hoist_at ?h ?loc)
      (surface_at ?s ?loc)
      (surface_clear ?s)
      (hoist_lifting ?h ?c)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      (hoist_free ?h)
      (not (hoist_lifting ?h ?c))
      (crate_at ?c ?loc)
      (not (surface_clear ?s))
      (crate_clear ?c)
      (not (crate_clear ?s))
      (crate_on_surface ?c ?s)
      (not (current ?st))
      (current ?st2)
    )
  )
)