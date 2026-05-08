(define (domain depots10)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    truck
    hoist
  )

  (:predicates
    ;; location predicates for different object categories (explicit to avoid type-union issues)
    (at_truck ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_surface ?s - surface ?p - place)    ; a surface (pallet or crate) or crate itself being located at a place

    ;; stacking / containment
    (on ?c - crate ?s - surface)             ; crate is on a surface (pallet or crate)
    (in_truck ?c - crate ?tr - truck)       ; crate is loaded into a truck

    ;; state flags
    (clear ?c - crate)                       ; nothing on this crate
    (surface_clear ?s - surface)             ; surface (pallet or crate) has no crate on it
    (available ?h - hoist)                   ; hoist is free to operate
    (lifting ?h - hoist ?c - crate)          ; hoist is currently lifting crate
  )

  ;; Drive a truck from one place to another
  (:action drive_truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at_truck ?tr ?from)
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  ;; Hoist lifts a crate from a surface at a place
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      ;; crate is lifted: not at the place/surface, removed from surface
      (not (at_surface ?c ?p))
      (not (on ?c ?s))
      ;; hoist becomes busy and holds crate
      (lifting ?h ?c)
      (not (available ?h))
      ;; surface becomes clear (nothing on it now)
      (surface_clear ?s)
    )
  )

  ;; Hoist drops a crate to a surface at a place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (surface_clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      ;; crate placed on surface and located at the place
      (at_surface ?c ?p)
      (on ?c ?s)
      ;; crate becomes clear (nothing on top of it right after drop)
      (clear ?c)
      ;; hoist freed
      (available ?h)
      (not (lifting ?h ?c))
      ;; surface no longer clear
      (not (surface_clear ?s))
    )
  )

  ;; Hoist loads a lifted crate into a truck at the same place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      ;; crate is now inside truck
      (in_truck ?c ?tr)
      ;; hoist freed and no longer lifting
      (available ?h)
      (not (lifting ?h ?c))
      ;; crate no longer located at the place (while in truck)
      (not (at_surface ?c ?p))
    )
  )

  ;; Hoist unloads a crate from a truck (hoist must be available and co-located with truck)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      ;; crate removed from truck and hoist takes it (hoist becomes busy)
      (not (in_truck ?c ?tr))
      (lifting ?h ?c)
      (not (available ?h))
      ;; crate is not yet at a surface/place until dropped (no at_surface fact)
    )
  )
)