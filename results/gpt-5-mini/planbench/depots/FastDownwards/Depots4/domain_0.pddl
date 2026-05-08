(define (domain logistics-hoist-truck)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck hoist location cargo)

  (:predicates
    (truck-at ?tr - truck ?loc - location)
    (hoist-at ?h - hoist ?loc - location)
    (cargo-at ?o - cargo ?loc - location)
    (in-truck ?o - cargo ?tr - truck)
    (holding ?h - hoist ?o - cargo)
    (hoist-free ?h - hoist)
    (connected ?from - location ?to - location)
  )

  ;; Truck driver action: drive a truck along a declared connection between locations.
  (:action drive
    :parameters (?tr - truck ?from - location ?to - location)
    :precondition (and
      (truck-at ?tr ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
    )
  )

  ;; Hoist operator action: lift cargo from ground into hoist grip.
  ;; Enforces hoist must be at same location as cargo and hoist must be free.
  (:action lift
    :parameters (?h - hoist ?o - cargo ?loc - location)
    :precondition (and
      (hoist-at ?h ?loc)
      (cargo-at ?o ?loc)
      (hoist-free ?h)
    )
    :effect (and
      (not (cargo-at ?o ?loc))
      (holding ?h ?o)
      (not (hoist-free ?h))
    )
  )

  ;; Hoist operator action: drop cargo from hoist to ground at hoist location.
  (:action drop
    :parameters (?h - hoist ?o - cargo ?loc - location)
    :precondition (and
      (holding ?h ?o)
      (hoist-at ?h ?loc)
    )
    :effect (and
      (not (holding ?h ?o))
      (cargo-at ?o ?loc)
      (hoist-free ?h)
    )
  )

  ;; Truck driver action: load cargo into a truck from a hoist holding it.
  ;; Distinct agent action from hoist's lift/drop: requires hoist to be holding.
  (:action load-into-truck
    :parameters (?tr - truck ?h - hoist ?o - cargo ?loc - location)
    :precondition (and
      (truck-at ?tr ?loc)
      (hoist-at ?h ?loc)
      (holding ?h ?o)
    )
    :effect (and
      (not (holding ?h ?o))
      (in-truck ?o ?tr)
      (hoist-free ?h)
    )
  )

  ;; Truck driver action: unload cargo from truck onto ground at truck location.
  ;; This action does not require the hoist; it deposits cargo on the ground.
  (:action unload-from-truck
    :parameters (?tr - truck ?o - cargo ?loc - location)
    :precondition (and
      (truck-at ?tr ?loc)
      (in-truck ?o ?tr)
    )
    :effect (and
      (not (in-truck ?o ?tr))
      (cargo-at ?o ?loc)
    )
  )

)