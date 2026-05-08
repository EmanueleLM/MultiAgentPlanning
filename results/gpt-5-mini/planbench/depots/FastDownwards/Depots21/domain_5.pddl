(define (domain depots_hoist_truck)
  (:requirements :strips :typing)
  (:types place truck hoist surface)

  (:predicates
    (truck_at ?tr - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (hoist_available ?h - hoist)

    (surface_at ?s - surface ?p - place)
    (on ?s - surface ?support - surface)
    (in_truck ?s - surface ?tr - truck)
    (holding ?h - hoist ?s - surface)
    (clear ?s - surface)
  )

  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (truck_at ?tr ?from)
    )
    :effect (and
      (truck_at ?tr ?to)
      (not (truck_at ?tr ?from))
    )
  )

  (:action hoist-lift
    :parameters (?h - hoist ?s - surface ?support - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (surface_at ?s ?p)
      (surface_at ?support ?p)
      (on ?s ?support)
      (hoist_available ?h)
      (clear ?s)
    )
    :effect (and
      (holding ?h ?s)
      (not (hoist_available ?h))
      (not (on ?s ?support))
      (not (surface_at ?s ?p))
      (clear ?support)
    )
  )

  (:action hoist-drop
    :parameters (?h - hoist ?s - surface ?support - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (surface_at ?support ?p)
      (holding ?h ?s)
      (clear ?support)
    )
    :effect (and
      (hoist_available ?h)
      (not (holding ?h ?s))
      (on ?s ?support)
      (surface_at ?s ?p)
      (not (clear ?support))
      (clear ?s)
    )
  )

  (:action hoist-load
    :parameters (?h - hoist ?s - surface ?tr - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?tr ?p)
      (holding ?h ?s)
    )
    :effect (and
      (in_truck ?s ?tr)
      (hoist_available ?h)
      (not (holding ?h ?s))
      (not (surface_at ?s ?p))
      (clear ?s)
    )
  )

  (:action hoist-unload
    :parameters (?h - hoist ?s - surface ?tr - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?tr ?p)
      (hoist_available ?h)
      (in_truck ?s ?tr)
    )
    :effect (and
      (holding ?h ?s)
      (not (in_truck ?s ?tr))
      (not (hoist_available ?h))
      (clear ?s)
    )
  )
)