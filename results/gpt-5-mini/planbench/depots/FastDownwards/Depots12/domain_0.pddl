(define (domain multiagent-transport-hoist)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck hoist item location step)

  (:predicates
    ;; positions
    (at-truck ?t - truck ?l - location)
    (at-hoist ?h - hoist ?l - location)

    ;; item state
    (on-ground ?i - item ?l - location)
    (lifted ?i - item ?h - hoist)
    (loaded ?i - item ?t - truck)

    ;; availability flags
    (hoist-free ?h - hoist)
    (truck-free ?t - truck)

    ;; connectivity (directed)
    (connected ?from - location ?to - location)

    ;; sequencing steps (explicit ordered steps)
    (step-complete ?s - step)
  )

  ;; ACTIONS NAMESPACED BY AGENT TYPE
  ;; 1) Truck drives between locations; sequence enforced by step predicates.
  (:action truck-drive
    :parameters (?tr - truck ?from - location ?to - location ?prev - step ?cur - step)
    :precondition (and
      (at-truck ?tr ?from)
      (connected ?from ?to)
      (step-complete ?prev)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      (step-complete ?cur)
    )
  )

  ;; 2) Hoist lifts an item from the ground at a location (prepares for transfer to truck).
  (:action hoist-lift
    :parameters (?h - hoist ?i - item ?loc - location ?prev - step ?cur - step)
    :precondition (and
      (at-hoist ?h ?loc)
      (on-ground ?i ?loc)
      (hoist-free ?h)
      (step-complete ?prev)
    )
    :effect (and
      (not (on-ground ?i ?loc))
      (lifted ?i ?h)
      (not (hoist-free ?h))
      (step-complete ?cur)
    )
  )

  ;; 3) Truck-side load: transfer item from hoist to inside truck
  (:action truck-load-from-hoist
    :parameters (?tr - truck ?h - hoist ?i - item ?loc - location ?prev - step ?cur - step)
    :precondition (and
      (at-truck ?tr ?loc)
      (at-hoist ?h ?loc)
      (lifted ?i ?h)
      (truck-free ?tr)
      (step-complete ?prev)
    )
    :effect (and
      (not (lifted ?i ?h))
      (loaded ?i ?tr)
      (not (truck-free ?tr))
      (hoist-free ?h)
      (step-complete ?cur)
    )
  )

  ;; 4) Hoist moves between locations (used to position hoist before lowering)
  (:action hoist-move
    :parameters (?h - hoist ?from - location ?to - location ?prev - step ?cur - step)
    :precondition (and
      (at-hoist ?h ?from)
      (connected ?from ?to)
      (step-complete ?prev)
    )
    :effect (and
      (not (at-hoist ?h ?from))
      (at-hoist ?h ?to)
      (step-complete ?cur)
    )
  )

  ;; 5) Hoist picks item from truck and places it on the ground at the same location.
  ;; This models the unload requiring the hoist to be present; truck becomes free afterwards.
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?tr - truck ?i - item ?loc - location ?prev - step ?cur - step)
    :precondition (and
      (at-hoist ?h ?loc)
      (at-truck ?tr ?loc)
      (loaded ?i ?tr)
      (hoist-free ?h)
      (step-complete ?prev)
    )
    :effect (and
      (not (loaded ?i ?tr))
      (on-ground ?i ?loc)
      (truck-free ?tr)
      ;; hoist remains free after lowering and releasing the item
      (hoist-free ?h)
      (step-complete ?cur)
    )
  )
)