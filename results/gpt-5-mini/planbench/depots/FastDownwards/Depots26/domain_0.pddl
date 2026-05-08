(define (domain hoist-operations)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    object
    hoist truck surface - object
    pallet crate - surface
  )

  (:predicates
    ;; general location for any object (hoist, truck, surface, crate when not in-truck)
    (at ?o - object ?p - place)

    ;; stacking and containment
    (on ?c - crate ?s - surface)                     ; crate directly on a surface (pallet or crate)
    (in ?c - crate ?t - truck)                       ; crate directly inside a truck

    ;; transitive marker for objects contained in a truck (explicit maintenance required)
    (contained_in_truck_transitive ?o - object ?t - truck)

    ;; mutual-exclusion / resource tokens
    (clear_top ?x - object)                          ; top-of-stack token for surfaces or crates
    (unclaimed ?c - crate)                           ; crate is not currently claimed/reserved
    (hoist_available ?h - hoist)                     ; hoist free token
    (hoist_holding ?h - hoist ?c - crate)            ; hoist is holding crate
  )

  ;; HOIST LIFT: pick a top crate from a co-located surface into the hoist gripper
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear_top ?c)
      (unclaimed ?c)
    )
    :effect (and
      ;; consume tokens / remove from surface
      (not (hoist_available ?h))
      (not (on ?c ?s))
      (not (unclaimed ?c))
      (not (clear_top ?c))

      ;; add holding and make the surface top (surface now exposed)
      (hoist_holding ?h ?c)
      (clear_top ?s)
      ;; note: crate's at(?c,?p) is left unchanged (crate remains at the place while held by hoist)
    )
  )

  ;; HOIST DROP: place a held crate onto a co-located surface that is the current top
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_holding ?h ?c)
      (at ?h ?p)
      (at ?s ?p)
      (clear_top ?s)
    )
    :effect (and
      ;; consume hoist holding and surface top token
      (not (hoist_holding ?h ?c))
      (not (clear_top ?s))

      ;; place crate onto surface and update tokens
      (on ?c ?s)
      (clear_top ?c)
      (hoist_available ?h)
      (unclaimed ?c)
      ;; crate remains at the same place (on + at(surface,place) gives crate location)
    )
  )

  ;; HOIST LOAD ONTO TRUCK: move a held crate into the truck's containment
  (:action hoist-load-onto-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist_holding ?h ?c)
      (at ?h ?p)
      (at ?t ?p)
    )
    :effect (and
      ;; consume holding
      (not (hoist_holding ?h ?c))

      ;; crate becomes in the truck and is marked transitive-contained
      (in ?c ?t)
      (contained_in_truck_transitive ?c ?t)

      ;; free the hoist and release crate token inside truck
      (hoist_available ?h)
      (unclaimed ?c)

      ;; if the domain instance stores per-crate at facts, the orchestrator must delete at(?c,?p) here.
      ;; To keep the domain STRIPS/simple, planners that maintain per-object at facts should also ensure
      ;; that at(?c,?p) is removed when in(?c,?t) is added. This PDDL action does not explicitly delete an at(?c,?p)
      ;; predicate to avoid an unsound generalization for planners that derive crate location from in+at(truck,place).
    )
  )

  ;; HOIST UNLOAD FROM TRUCK: extract a crate from the truck into the hoist gripper
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (hoist_available ?h)
      (in ?c ?t)
      (unclaimed ?c)
    )
    :effect (and
      ;; hoist becomes busy holding crate; crate removed from truck and transitive marker removed
      (not (hoist_available ?h))
      (not (in ?c ?t))
      (not (contained_in_truck_transitive ?c ?t))
      (not (unclaimed ?c))

      (hoist_holding ?h ?c)

      ;; crate remains at the place while held; planner/orchestrator should add at(?c,?p) if it explicitly models crate locations when held
      ;; (no explicit add here to remain consistent for planners that derive crate location from on(...) + at(...))
    )
  )

  ;; DRIVE TRUCK: move a truck from origin to destination; does not alter hoist state or in(...) relations
  (:action drive-truck
    :parameters (?t - truck ?origin - place ?destination - place)
    :precondition (and
      (at ?t ?origin)
      (not (= ?origin ?destination))
    )
    :effect (and
      (not (at ?t ?origin))
      (at ?t ?destination)
      ;; NOTE: this action does NOT modify in(...,?t) or contained_in_truck_transitive(...) relations.
      ;; If the planner stores explicit per-object at facts for objects contained in the truck, an external
      ;; maintenance step or additional actions must update those at(...) facts for each object X where
      ;; contained_in_truck_transitive(X, ?t) holds. The audited specification requires explicit maintenance
      ;; of contained_in_truck_transitive and explicit per-object at updates if the problem models them.
    )
  )
)