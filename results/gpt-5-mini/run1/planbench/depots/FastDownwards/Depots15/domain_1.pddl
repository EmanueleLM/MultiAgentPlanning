(define (domain multiagent-hoist-truck)
  (:requirements :strips :typing)
  (:types
    depot distributor - place
    pallet crate - surface
    place surface hoist truck
  )

  (:predicates
    ;; locations
    (at_hoist ?h - hoist ?p - place)
    (at_truck ?t - truck ?p - place)
    (at_surface ?s - surface ?p - place)

    ;; stacking / containment
    (on ?c - crate ?s - surface)    ;; crate directly on a surface (pallet or crate)
    (in ?c - crate ?tr - truck)     ;; crate inside a truck
    (holding ?h - hoist ?c - crate) ;; hoist holds crate

    ;; resources / clearance
    (available ?h - hoist)          ;; hoist is available to start a lift
    (clear_surface ?s - surface)    ;; surface (pallet or crate) has nothing directly on it
    (clear_crate ?c - crate)        ;; crate has nothing on top of it
    (truck_free ?tr - truck)        ;; truck is not locked (prevents driving if false)
  )

  ;; Truck movement
  (:action truck-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at_truck ?tr ?from)
      (truck_free ?tr)
    )
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  ;; Hoist actions
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (on ?c ?s)
      (clear_crate ?c)
      (available ?h)
    )
    :effect (and
      (holding ?h ?c)
      (not (available ?h))
      (not (on ?c ?s))
      (clear_surface ?s)    ;; surface becomes clear after lifting its top crate
    )
  )

  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (holding ?h ?c)
      (clear_surface ?s)
    )
    :effect (and
      (not (holding ?h ?c))
      (available ?h)
      (on ?c ?s)
      (clear_crate ?c)
      (not (clear_surface ?s))
    )
  )

  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (holding ?h ?c)
      (truck_free ?tr)
    )
    :effect (and
      (not (holding ?h ?c))
      (available ?h)
      (in ?c ?tr)
    )
  )

  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (available ?h)
      (in ?c ?tr)
    )
    :effect (and
      (holding ?h ?c)
      (not (available ?h))
      (not (in ?c ?tr))
    )
  )
)