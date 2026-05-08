(define (domain depot-distributor)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor - place
    surface pallet crate - surface
    truck
    hoist
    stage
  )

  (:predicates
    ;; stage progression
    (stage_now ?st - stage)
    (stage_next ?st - stage ?st2 - stage)

    ;; locations
    (truck_at ?tr - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (surface_at ?s - surface ?p - place)   ;; surface (pallet or crate) located at a place

    ;; placement and containers
    (crate_on_surface ?c - crate ?s - surface) ;; crate c directly on surface s (pallet or crate)
    (in_truck ?c - crate ?tr - truck)

    ;; surface and hoist availability
    (surface_clear ?s - surface)               ;; nothing on this surface
    (hoist_free ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)      ;; hoist currently lifting this crate
  )

  ;; DRIVER: drive a truck from one place to another (advances stage)
  (:action driver-drive-truck
    :parameters (?st - stage ?st2 - stage ?tr - truck ?from - place ?to - place)
    :precondition (and
      (stage_now ?st)
      (stage_next ?st ?st2)
      (truck_at ?tr ?from)
    )
    :effect (and
      ;; stage advancement
      (not (stage_now ?st))
      (stage_now ?st2)

      ;; move truck
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
    )
  )

  ;; HOIST movement between places (advances stage)
  (:action hoist-move
    :parameters (?st - stage ?st2 - stage ?h - hoist ?from - place ?to - place)
    :precondition (and
      (stage_now ?st)
      (stage_next ?st ?st2)
      (hoist_at ?h ?from)
    )
    :effect (and
      ;; stage advancement
      (not (stage_now ?st))
      (stage_now ?st2)

      ;; move hoist
      (not (hoist_at ?h ?from))
      (hoist_at ?h ?to)
    )
  )

  ;; LIFT a crate from a pallet surface (hoist starts lifting crate) (advances stage)
  (:action hoist-lift-from-pallet
    :parameters (?st - stage ?st2 - stage ?h - hoist ?p - pallet ?loc - place ?c - crate)
    :precondition (and
      (stage_now ?st)
      (stage_next ?st ?st2)
      (hoist_at ?h ?loc)
      (surface_at ?p ?loc)
      (crate_on_surface ?c ?p)
      (hoist_free ?h)
      (surface_clear ?c)  ;; crate is clear (no object on top)
    )
    :effect (and
      ;; stage
      (not (stage_now ?st))
      (stage_now ?st2)

      ;; remove stacking and location of the lifted crate
      (not (crate_on_surface ?c ?p))
      (not (surface_at ?c ?loc))

      ;; hoist state
      (hoist_lifting ?h ?c)
      (not (hoist_free ?h))

      ;; pallet becomes clear after removing the crate
      (surface_clear ?p)
    )
  )

  ;; LIFT a crate from another crate surface (hoist starts lifting crate) (advances stage)
  (:action hoist-lift-from-crate
    :parameters (?st - stage ?st2 - stage ?h - hoist ?s - crate ?loc - place ?c - crate)
    :precondition (and
      (stage_now ?st)
      (stage_next ?st ?st2)
      (hoist_at ?h ?loc)
      (surface_at ?s ?loc)
      (crate_on_surface ?c ?s)
      (hoist_free ?h)
      (surface_clear ?c)  ;; crate c clear (top)
    )
    :effect (and
      ;; stage
      (not (stage_now ?st))
      (stage_now ?st2)

      ;; remove stacking and location of the lifted crate
      (not (crate_on_surface ?c ?s))
      (not (surface_at ?c ?loc))

      ;; hoist state
      (hoist_lifting ?h ?c)
      (not (hoist_free ?h))

      ;; supporting crate becomes clear
      (surface_clear ?s)
    )
  )

  ;; LOAD a lifted crate into a truck (crate goes into truck) (advances stage)
  (:action hoist-load-into-truck
    :parameters (?st - stage ?st2 - stage ?h - hoist ?tr - truck ?loc - place ?c - crate)
    :precondition (and
      (stage_now ?st)
      (stage_next ?st ?st2)
      (hoist_at ?h ?loc)
      (truck_at ?tr ?loc)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      ;; stage
      (not (stage_now ?st))
      (stage_now ?st2)

      ;; crate enters truck
      (in_truck ?c ?tr)

      ;; crate is no longer at the place or a surface while inside truck
      (not (surface_at ?c ?loc))

      ;; hoist becomes free and stops lifting
      (not (hoist_lifting ?h ?c))
      (hoist_free ?h)
    )
  )

  ;; UNLOAD a crate from a truck into the hoist (hoist starts lifting it) (advances stage)
  (:action hoist-unload-from-truck
    :parameters (?st - stage ?st2 - stage ?h - hoist ?tr - truck ?loc - place ?c - crate)
    :precondition (and
      (stage_now ?st)
      (stage_next ?st ?st2)
      (hoist_at ?h ?loc)
      (truck_at ?tr ?loc)
      (hoist_free ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      ;; stage
      (not (stage_now ?st))
      (stage_now ?st2)

      ;; crate removed from truck and hoist lifts it
      (not (in_truck ?c ?tr))
      (hoist_lifting ?h ?c)
      (not (hoist_free ?h))

      ;; crate is not considered at the location while hoist is lifting it
      (not (surface_at ?c ?loc))
    )
  )

  ;; DROP a lifted crate onto a pallet surface (advances stage)
  (:action hoist-drop-to-pallet
    :parameters (?st - stage ?st2 - stage ?h - hoist ?p - pallet ?loc - place ?c - crate)
    :precondition (and
      (stage_now ?st)
      (stage_next ?st ?st2)
      (hoist_at ?h ?loc)
      (surface_at ?p ?loc)
      (surface_clear ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      ;; stage
      (not (stage_now ?st))
      (stage_now ?st2)

      ;; hoist releases crate
      (hoist_free ?h)
      (not (hoist_lifting ?h ?c))

      ;; crate now at location and on pallet p
      (surface_at ?c ?loc)
      (crate_on_surface ?c ?p)

      ;; pallet is no longer clear; crate is clear
      (not (surface_clear ?p))
      (surface_clear ?c)
    )
  )

  ;; DROP a lifted crate onto another crate surface (advances stage)
  (:action hoist-drop-to-crate
    :parameters (?st - stage ?st2 - stage ?h - hoist ?s - crate ?loc - place ?c - crate)
    :precondition (and
      (stage_now ?st)
      (stage_next ?st ?st2)
      (hoist_at ?h ?loc)
      (surface_at ?s ?loc)
      (surface_clear ?s)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      ;; stage
      (not (stage_now ?st))
      (stage_now ?st2)

      ;; hoist releases crate
      (hoist_free ?h)
      (not (hoist_lifting ?h ?c))

      ;; crate now at location and on crate s
      (surface_at ?c ?loc)
      (crate_on_surface ?c ?s)

      ;; supporting crate is no longer clear; new crate is clear
      (not (surface_clear ?s))
      (surface_clear ?c)
    )
  )
)