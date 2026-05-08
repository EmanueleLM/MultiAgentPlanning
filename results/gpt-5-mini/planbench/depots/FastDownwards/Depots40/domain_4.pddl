(define (domain depots_repaired)
  (:requirements :strips)
  (:predicates
    ;; locations
    (truck_at ?tr ?p)
    (hoist_at ?h ?p)
    (surface_at ?s ?p)

    ;; stacking and containment
    (on ?c ?s)          ;; crate ?c is directly on surface ?s (surface or crate)
    (in_truck ?c ?t)    ;; crate ?c is inside truck ?t
    (lifting ?h ?c)     ;; hoist ?h is lifting crate ?c

    ;; resources / state
    (hoist_available ?h)
    (clear ?x)          ;; nothing on top of surface or crate
  )

  ;; drive a truck between any two places (roads between every pair)
  (:action drive
    :parameters (?tr ?from ?to)
    :precondition (and
      (truck_at ?tr ?from)
    )
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a surface at the same place
  (:action hoist_lift_from_surface
    :parameters (?h ?c ?s ?p)
    :precondition (and
      (hoist_at ?h ?p)
      (surface_at ?s ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (lifting ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
    )
  )

  ;; hoist drops a lifted crate onto a surface at the same place
  (:action hoist_drop_to_surface
    :parameters (?h ?c ?s ?p)
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
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; hoist loads a lifted crate into a truck at the same place
  (:action hoist_load_into_truck
    :parameters (?h ?c ?t ?p)
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
    )
  )

  ;; hoist unloads a crate from a truck at the same place (hoist becomes occupied lifting the crate)
  (:action hoist_unload_from_truck
    :parameters (?h ?c ?t ?p)
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