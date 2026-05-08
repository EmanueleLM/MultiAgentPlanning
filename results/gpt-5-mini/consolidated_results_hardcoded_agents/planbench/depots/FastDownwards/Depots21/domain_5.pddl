(define (domain logistics-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    place surface step - object
    depot distributor - place
    pallet crate - surface
    truck hoist - object
  )

  (:predicates
    ;; locations
    (truck_at ?tr - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (surface_at ?s - surface ?p - place)

    ;; placement / carriage / holding
    (crate_on ?c - crate ?s - surface)     ;; crate directly on surface (pallet or crate)
    (crate_in ?c - crate ?tr - truck)      ;; crate inside truck (cargo)
    (crate_held ?c - crate ?h - hoist)     ;; crate held by hoist

    ;; support/clear/availability
    (surface_clear ?s - surface)           ;; nothing on top of surface
    (crate_clear ?c - crate)               ;; nothing on top of crate
    (hoist_free ?h - hoist)                ;; hoist is available (not holding)

    ;; explicit stage progression
    (next ?s1 - step ?s2 - step)
    (current_step ?s - step)
  )

  ;; DRIVE: move a truck from one place to another; consumes current step -> successor
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place ?s - step ?s2 - step)
    :precondition (and
      (current_step ?s)
      (next ?s ?s2)
      (truck_at ?tr ?from)
      (not (truck_at ?tr ?to))
    )
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
      (not (current_step ?s))
      (current_step ?s2)
    )
  )

  ;; HOIST LIFT from a pallet: hoist at place, pallet at place, crate on pallet, crate clear, hoist free.
  ;; Effects: crate removed from surface and place, hoist holds crate, hoist becomes unavailable, surface becomes clear, advance step.
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
      (not (crate_on ?c ?pallet))
      (crate_held ?c ?h)
      (not (hoist_free ?h))
      (surface_clear ?pallet)
      (not (surface_at ?c ?p))
      (not (current_step ?s))
      (current_step ?s2)
    )
  )

  ;; HOIST LIFT from a supporting crate
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
      (crate_clear ?support)
      (not (surface_at ?c ?p))
      (not (current_step ?s))
      (current_step ?s2)
    )
  )

  ;; HOIST DROP onto a pallet: hoist at place, pallet at place, pallet clear, hoist holding crate.
  ;; Effects: crate placed on pallet, crate becomes surface at place, hoist becomes free, surface not clear, crate clear, advance step.
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

  ;; HOIST DROP onto a supporting crate
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

  ;; HOIST LOAD into truck: hoist at place, truck at same place, hoist holding crate.
  ;; Effects: crate becomes in-truck, hoist becomes free, crate no longer surface at place, advance step.
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
      (not (surface_at ?c ?p))
      (not (current_step ?s))
      (current_step ?s2)
    )
  )

  ;; HOIST UNLOAD from truck into hoist: hoist at place, truck at place, hoist free, crate in truck.
  ;; Effects: crate removed from truck and held by hoist, hoist becomes unavailable, advance step.
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