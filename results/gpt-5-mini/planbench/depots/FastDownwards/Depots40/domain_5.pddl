(define (domain depots_repaired)
  (:requirements :strips :typing)
  (:types place depot distributor truck hoist surface pallet crate)

  ;; type hierarchy
  ;; depot and distributor are subtypes of place
  ;; pallet and crate are subtypes of surface

  (:predicates
    ;; locations
    (truck_at ?tr - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (surface_at ?s - surface ?p - place)

    ;; stacking and containment
    (on ?c - crate ?s - surface)       ;; crate ?c is directly on surface ?s (pallet or crate)
    (in_truck ?c - crate ?t - truck)   ;; crate ?c is inside truck ?t
    (lifting ?h - hoist ?c - crate)    ;; hoist ?h is lifting crate ?c

    ;; resources / state
    (hoist_available ?h - hoist)
    (clear ?x - surface)               ;; nothing on top of surface (pallet or crate)
  )

  ;; drive a truck between any two places (roads between every pair)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (truck_at ?tr ?from)
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a surface at the same place
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (surface_at ?s ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (not (surface_at ?c ?p))
      (lifting ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
    )
  )

  ;; hoist drops a lifted crate onto a surface at the same place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (surface_at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (hoist_available ?h)
      (on ?c ?s)
      (surface_at ?c ?p)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; hoist loads a lifted crate into a truck at the same place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (hoist_available ?h)
      (in_truck ?c ?t)
      (clear ?c)
      (not (surface_at ?c ?p))
    )
  )

  ;; hoist unloads a crate from a truck at the same place (hoist becomes occupied lifting the crate)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?t ?p)
      (hoist_available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (not (hoist_available ?h))
      (lifting ?h ?c)
    )
  )
)