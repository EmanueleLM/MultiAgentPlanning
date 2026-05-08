(define (domain hoist-operations-conservative)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    hoist
    truck
    surface
    crate  - surface
    pallet - surface
  )

  (:predicates
    ;; location: hoists, trucks and surfaces are located at places
    (at ?e - (either hoist truck surface) ?p - place)

    ;; stacking/containment
    (on ?c - crate ?s - surface)        ;; crate directly on a surface (pallet or crate)
    (in ?c - crate ?t - truck)         ;; crate inside truck

    ;; hoist state
    (holding ?h - hoist ?c - crate)    ;; hoist holds crate
    (hoist_available ?h - hoist)       ;; hoist is free (resource token)

    ;; surface and crate top availability
    (surface_clear ?s - surface)       ;; surface has no crate on top (can receive crate)
    (crate_clear ?c - crate)           ;; no crate stacked on top of this crate

    ;; truck resource token to avoid concurrent drive/load/unload races
    (truck_available ?t - truck)

    ;; discriminator predicate: true for surfaces that are crates (stacking surfaces)
    (surface_is_crate ?s - surface)
  )

  ;; Actions: separate variants for pallets vs crate-surfaces where crate_clear must be updated,
  ;; so conditional effects are avoided and :negative-preconditions is available for alternate branches.

  ;; HOIST LIFT FROM A PALLET SURFACE (source is a pallet)
  (:action hoist-lift-from-pallet
    :parameters (?h - hoist ?c - crate ?s - pallet ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (crate_clear ?c)
      (hoist_available ?h)
    )
    :effect (and
      ;; hoist acquires occupancy: remove availability (acquired for the operation)
      (not (hoist_available ?h))

      ;; crate moved into hoist
      (holding ?h ?c)
      (not (on ?c ?s))

      ;; surface becomes free when the crate is lifted
      (surface_clear ?s)
    )
  )

  ;; HOIST LIFT FROM A CRATE SURFACE (source is a crate acting as surface)
  (:action hoist-lift-from-crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (crate_clear ?c)
      (hoist_available ?h)
      (surface_is_crate ?s)
    )
    :effect (and
      (not (hoist_available ?h))
      (holding ?h ?c)
      (not (on ?c ?s))
      (surface_clear ?s)
      ;; the surface S is a crate, so its top becomes clear once its top crate is removed
      (crate_clear ?s)
    )
  )

  ;; HOIST DROP ONTO A PALLET (target is a pallet)
  (:action hoist-drop-onto-pallet
    :parameters (?h - hoist ?c - crate ?s - pallet ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (holding ?h ?c)
      (surface_clear ?s)
    )
    :effect (and
      ;; crate placed on surface
      (on ?c ?s)
      (crate_clear ?c)

      ;; hoist released (becomes available)
      (hoist_available ?h)
      (not (holding ?h ?c))

      ;; surface is no longer clear
      (not (surface_clear ?s))
    )
  )

  ;; HOIST DROP ONTO A CRATE (target is a crate surface)
  (:action hoist-drop-onto-crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (holding ?h ?c)
      (surface_clear ?s)
      (surface_is_crate ?s)
    )
    :effect (and
      (on ?c ?s)
      (crate_clear ?c)

      ;; the target crate's top is now occupied
      (not (crate_clear ?s))

      (hoist_available ?h)
      (not (holding ?h ?c))
      (not (surface_clear ?s))
    )
  )

  ;; HOIST LOAD ONTO TRUCK
  (:action hoist-load-onto-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (holding ?h ?c)
      (truck_available ?t)
    )
    :effect (and
      ;; hoist frees up after placing crate in truck
      (hoist_available ?h)
      (not (holding ?h ?c))

      ;; crate becomes contained in truck
      (in ?c ?t)

      ;; acquire and release truck token (deleted and re-added to express atomic use)
      (not (truck_available ?t))
      (truck_available ?t)
    )
  )

  ;; HOIST UNLOAD FROM TRUCK (hoist takes crate out of truck and holds it)
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (hoist_available ?h)
      (in ?c ?t)
      (truck_available ?t)
    )
    :effect (and
      ;; hoist becomes occupied (acquired) and holds the crate
      (not (hoist_available ?h))
      (holding ?h ?c)

      ;; crate removed from truck
      (not (in ?c ?t))

      ;; truck token is acquired and then released by the end of the action
      (not (truck_available ?t))
      (truck_available ?t)
    )
  )

  ;; DRIVE A TRUCK FROM ORIGIN TO DESTINATION (complete connectivity)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (not (= ?from ?to))
      (truck_available ?tr)
    )
    :effect (and
      ;; move truck
      (not (at ?tr ?from))
      (at ?tr ?to)

      ;; acquire-and-release truck token during drive (prevent concurrent drive/load/unload)
      (not (truck_available ?tr))
      (truck_available ?tr)
    )
  )

)