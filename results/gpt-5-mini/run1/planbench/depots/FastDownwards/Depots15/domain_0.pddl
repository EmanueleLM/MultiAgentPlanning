(define (domain multiagent-hoist-truck)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor
    physical hoist truck surface pallet crate
    ;; typing hierarchy:
    ;; depot distributor - subtypes of place
    ;; hoist truck surface - subtypes of physical
    ;; pallet crate - subtypes of surface
  )

  ;; Type predicates (kept as explicit predicates per specification)
  (:predicates
    ;; type predicates (redundant with :types but included per spec)
    (place ?p - place)
    (depot ?d - depot)
    (distributor ?d - distributor)
    (physical ?x - physical)
    (hoist_type ?h - hoist)
    (truck_type ?t - truck)
    (surface_type ?s - surface)
    (pallet_type ?p - pallet)
    (crate_type ?c - crate)

    ;; location / containment / stacking predicates
    (at ?obj - physical ?pl - place)      ;; object (hoist/truck/surface) is at place
    (on ?c - crate ?s - surface)         ;; crate directly on surface
    (in ?c - crate ?t - truck)           ;; crate inside truck
    (holding ?h - hoist ?c - crate)      ;; hoist holds crate

    ;; resource / availability / occupancy predicates
    (available ?h - hoist)               ;; hoist free (not holding)
    (clear ?s - surface)                 ;; no crate directly on surface
    (free ?c - crate)                    ;; crate not being manipulated (lock for crate)
    (truck-free ?t - truck)              ;; truck not locked for load/unload (prevents drive)
  )

  ;; -------------------------
  ;; Actions (agent-prefixed)
  ;; -------------------------

  ;; Truck action (truck_dispatcher)
  (:action truck-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (truck_type ?tr)
      (at ?tr ?from)
      (truck-free ?tr)
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; Hoist actions (hoist_operator)
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_type ?h)
      (crate_type ?c)
      (surface_type ?s)
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (clear ?c)           ;; crate has no crate on top
      (available ?h)       ;; hoist free
      (free ?c)            ;; crate not locked / not being manipulated
    )
    :effect (and
      (holding ?h ?c)
      (not (available ?h))
      (not (on ?c ?s))
      (not (at ?c ?p))
      (clear ?s)           ;; original surface becomes clear
      (not (free ?c))      ;; crate is now locked by being held
    )
  )

  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_type ?h)
      (crate_type ?c)
      (surface_type ?s)
      (at ?h ?p)
      (at ?s ?p)
      (holding ?h ?c)
      (clear ?s)           ;; target must be clear
    )
    :effect (and
      (not (holding ?h ?c))
      (available ?h)
      (on ?c ?s)
      (at ?c ?p)
      (clear ?c)           ;; placed crate has nothing on top immediately
      (not (clear ?s))     ;; target surface now occupied
      (free ?c)            ;; crate becomes free after placement
    )
  )

  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_type ?h)
      (crate_type ?c)
      (truck_type ?tr)
      (at ?h ?p)
      (at ?tr ?p)
      (holding ?h ?c)
      (truck-free ?tr)
    )
    :effect (and
      (not (holding ?h ?c))
      (available ?h)
      (in ?c ?tr)
      (free ?c)            ;; crate inside truck and not being manipulated
    )
  )

  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_type ?h)
      (crate_type ?c)
      (truck_type ?tr)
      (at ?h ?p)
      (at ?tr ?p)
      (available ?h)
      (in ?c ?tr)
      (free ?c)
    )
    :effect (and
      (holding ?h ?c)
      (not (available ?h))
      (not (in ?c ?tr))
      (not (free ?c))
    )
  )

)