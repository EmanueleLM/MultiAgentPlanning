(define (domain logistics-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor
    truck
    hoist
    surface pallet crate
    step
  )
  ;; depot and distributor are subtypes of place; pallet and crate are subtypes of surface
  ;; using explicit subtype declarations
  (:constants )
  (:predicates
    ;; locations (time-independent state facts)
    (truck_at ?tr - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (surface_at ?s - surface ?p - place)  ;; a surface (pallet or crate) located at a place

    ;; crate placement and carriage
    (crate_on ?c - crate ?s - surface)     ;; crate c directly on surface s
    (crate_in ?c - crate ?tr - truck)     ;; crate c inside truck tr (cargo)
    (crate_held ?c - crate ?h - hoist)    ;; crate c held by hoist h

    ;; clear / availability (maintained exactly by actions)
    (surface_clear ?s - surface)           ;; surface s has nothing on top of it
    (crate_clear ?c - crate)               ;; crate c has nothing on top of it
    (hoist_free ?h - hoist)                ;; hoist h is free (not holding any crate)

    ;; explicit stage progression
    (next ?s1 - step ?s2 - step)           ;; successor relation over steps
    (current_step ?s - step)               ;; the global current stage; exactly one step true at a time
  )

  ;; DRIVER: drive a truck from one place to another (advances the global step)
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place ?s - step ?s2 - step)
    :precondition (and
      (current_step ?s)
      (next ?s ?s2)
      (truck_at ?tr ?from)
      (not (truck_at ?tr ?to))     ;; prevent no-op transitions (explicit negative precond)
    )
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
      (not (current_step ?s))
      (current_step ?s2)
    )
  )

  ;; HOIST OPERATIONS: all hoist actions require hoist and other objects at the same place,
  ;; enforce hoist availability and crate clearance, and advance the global step.

  ;; Lift a crate from a pallet surface
  (:action hoist-lift-from-pallet
    :parameters (?h - hoist ?c - crate ?pallet - pallet ?p - place ?s - step ?s2 - step)
    :precondition (and
      (current_step ?s)
      (next ?s ?s2)
      (hoist_at ?h ?p)
      (surface_at ?pallet ?p)
      (crate_on ?c ?pallet)
      (crate_clear ?c)
      (hoist_free ?h)
    )
    :effect (and
      ;; remove top relation between crate and pallet
      (not (crate_on ?c ?pallet))
      ;; hoist takes the crate (hoist becomes unavailable)
      (crate_held ?c ?h)
      (not (hoist_free ?h))
      ;; pallet becomes clear when its top crate is removed
      (surface_clear ?pallet)
      ;; crate is no longer registered as being at the place as a surface while held
      (not (surface_at ?c ?p))
      ;; advance step
      (not (current_step ?s))
      (current_step ?s2)
    )
  )

  ;; Lift a crate from another crate (support is a crate)
  (:action hoist-lift-from-crate
    :parameters (?h - hoist ?c - crate ?support - crate ?p - place ?s - step ?s2 - step)
    :precondition (and
      (current_step ?s)
      (next ?s ?s2)
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
      ;; the support crate becomes clear once its top crate is removed
      (crate_clear ?support)
      (not (surface_at ?c ?p))
      (not (current_step ?s))
      (current_step ?s2)
    )
  )

  ;; Drop a held crate onto a pallet surface
  (:action hoist-drop-on-pallet
    :parameters (?h - hoist ?c - crate ?pallet - pallet ?p - place ?s - step ?s2 - step)
    :precondition (and
      (current_step ?s)
      (next ?s ?s2)
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
      (not (current_step ?s))
      (current_step ?s2)
    )
  )

  ;; Drop a held crate onto a supporting crate
  (:action hoist-drop-on-crate
    :parameters (?h - hoist ?c - crate ?support - crate ?p - place ?s - step ?s2 - step)
    :precondition (and
      (current_step ?s)
      (next ?s ?s2)
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
      (not (current_step ?s))
      (current_step ?s2)
    )
  )

  ;; Load a held crate into a truck at the same place (crate becomes cargo; not a surface at place)
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?s - step ?s2 - step)
    :precondition (and
      (current_step ?s)
      (next ?s ?s2)
      (hoist_at ?h ?p)
      (truck_at ?tr ?p)
      (crate_held ?c ?h)
    )
    :effect (and
      (not (crate_held ?c ?h))
      (crate_in ?c ?tr)
      (hoist_free ?h)
      (not (surface_at ?c ?p))  ;; crate no longer exists as a surface at the place while inside truck
      (not (current_step ?s))
      (current_step ?s2)
    )
  )

  ;; Unload a crate from a truck into the hoist (hoist must be free)
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?s - step ?s2 - step)
    :precondition (and
      (current_step ?s)
      (next ?s ?s2)
      (hoist_at ?h ?p)
      (truck_at ?tr ?p)
      (hoist_free ?h)
      (crate_in ?c ?tr)
    )
    :effect (and
      (crate_held ?c ?h)
      (not (crate_in ?c ?tr))
      (not (hoist_free ?h))
      (not (current_step ?s))
      (current_step ?s2)
    )
  )
)