(define (domain logistics-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor
    truck
    hoist
    surface pallet crate
  )

  (:predicates
    ;; locations
    (truck_at ?tr - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (surface_at ?s - surface ?p - place)  ;; a surface (pallet or crate) is located at a place

    ;; crate placement and carriage
    (crate_on ?c - crate ?s - surface)     ;; crate c directly on surface s
    (crate_in ?c - crate ?tr - truck)     ;; crate c inside truck tr (cargo)
    (crate_held ?c - crate ?h - hoist)    ;; crate c held by hoist h

    ;; clear / availability (maintained exactly by actions)
    (surface_clear ?s - surface)           ;; surface s has nothing on top of it
    (crate_clear ?c - crate)               ;; crate c has nothing on top of it
    (hoist_free ?h - hoist)                ;; hoist h is free (not holding any crate)
  )

  ;; Drive action performed by driver/orchestrator agent
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (truck_at ?tr ?from)
      (not (truck_at ?tr ?to))   ;; avoid no-op moves
    )
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
    )
  )

  ;; Hoist lift from a pallet (support is a pallet surface)
  (:action hoist-lift-from-pallet
    :parameters (?h - hoist ?c - crate ?pallet - pallet ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (surface_at ?pallet ?p)
      (crate_on ?c ?pallet)
      (crate_clear ?c)
      (hoist_free ?h)
    )
    :effect (and
      (not (crate_on ?c ?pallet))
      (crate_held ?c ?h)
      (not (hoist_free ?h))
      (surface_clear ?pallet)        ;; removing top makes pallet clear
      (not (surface_at ?c ?p))       ;; crate-as-surface no longer at place while held
    )
  )

  ;; Hoist lift from a supporting crate (support is a crate surface)
  (:action hoist-lift-from-crate
    :parameters (?h - hoist ?c - crate ?support - crate ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (surface_at ?support ?p)
      (crate_on ?c ?support)
      (crate_clear ?c)
      (hoist_free ?h)
    )
    :effect (and
      (not (crate_on ?c ?support))
      (crate_held ?c ?h)
      (not (hoist_free ?h))
      (crate_clear ?support)        ;; support crate becomes clear when its top is removed
      (not (surface_at ?c ?p))
    )
  )

  ;; Hoist drop onto a pallet
  (:action hoist-drop-on-pallet
    :parameters (?h - hoist ?c - crate ?pallet - pallet ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (surface_at ?pallet ?p)
      (surface_clear ?pallet)
      (crate_held ?c ?h)
    )
    :effect (and
      (not (crate_held ?c ?h))
      (hoist_free ?h)
      (crate_on ?c ?pallet)
      (crate_clear ?c)
      (not (surface_clear ?pallet))
      (surface_at ?c ?p)
    )
  )

  ;; Hoist drop onto a supporting crate
  (:action hoist-drop-on-crate
    :parameters (?h - hoist ?c - crate ?support - crate ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (surface_at ?support ?p)
      (crate_clear ?support)
      (crate_held ?c ?h)
    )
    :effect (and
      (not (crate_held ?c ?h))
      (hoist_free ?h)
      (crate_on ?c ?support)
      (crate_clear ?c)
      (not (crate_clear ?support))
      (surface_at ?c ?p)
    )
  )

  ;; Hoist loads a held crate into a truck at same place
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?tr ?p)
      (crate_held ?c ?h)
    )
    :effect (and
      (not (crate_held ?c ?h))
      (crate_in ?c ?tr)
      (hoist_free ?h)
      ;; crate no longer exists as a surface at a place while inside truck
      (not (surface_at ?c ?p))
    )
  )

  ;; Hoist unloads a crate from a truck into hoist (hoist must be free)
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?tr ?p)
      (hoist_free ?h)
      (crate_in ?c ?tr)
    )
    :effect (and
      (crate_held ?c ?h)
      (not (crate_in ?c ?tr))
      (not (hoist_free ?h))
      ;; crate_as_surface location will be set when dropped (not set while held)
    )
  )
)