(define (domain transport_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package city location airport - location stage)

  (:predicates
    ;; vehicle and package locations
    (truck_at ?t - truck ?l - location)
    (airplane_at ?a - airplane ?l - airport)
    (package_at ?p - package ?l - location)

    ;; containment
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)

    ;; city membership relation between locations (symmetric entries supplied in :init)
    (same_city ?l1 - location ?l2 - location)
    ;; different_city used to permit flights (symmetric entries supplied in :init)
    (different_city ?l1 - location ?l2 - location)

    ;; explicit discrete stage progression to enforce ordering (succ is an acyclic successor relation)
    (current_stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; All actions advance the current_stage from a stage to its successor to enforce a strict,
  ;; contiguous ordering of actions (no slack or oscillation). Each action requires the current
  ;; stage and a succ link to the next stage; effects remove the current_stage and set the next.

  ;; Truck-agent actions
  (:action truck_agent-load-into-truck
    :parameters (?tr - truck ?p - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (truck_at ?tr ?loc)
      (package_at ?p ?loc)
      (current_stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (in_truck ?p ?tr)
      (not (package_at ?p ?loc))
      (not (current_stage ?s))
      (current_stage ?s2)
    )
  )

  (:action truck_agent-unload-from-truck
    :parameters (?tr - truck ?p - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (truck_at ?tr ?loc)
      (in_truck ?p ?tr)
      (current_stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (package_at ?p ?loc)
      (not (in_truck ?p ?tr))
      (not (current_stage ?s))
      (current_stage ?s2)
    )
  )

  (:action truck_agent-drive
    :parameters (?tr - truck ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (truck_at ?tr ?from)
      (same_city ?from ?to)
      (current_stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (truck_at ?tr ?to)
      (not (truck_at ?tr ?from))
      ;; packages carried remain in_truck and therefore move implicitly with the truck's identity;
      ;; they are not placed at intermediate locations by this action.
      (not (current_stage ?s))
      (current_stage ?s2)
    )
  )

  ;; Airplane-agent actions
  (:action airplane_agent-load-into-airplane
    :parameters (?ap - airplane ?p - package ?airport - airport ?s - stage ?s2 - stage)
    :precondition (and
      (airplane_at ?ap ?airport)
      (package_at ?p ?airport)
      (current_stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (in_airplane ?p ?ap)
      (not (package_at ?p ?airport))
      (not (current_stage ?s))
      (current_stage ?s2)
    )
  )

  (:action airplane_agent-unload-from-airplane
    :parameters (?ap - airplane ?p - package ?airport - airport ?s - stage ?s2 - stage)
    :precondition (and
      (airplane_at ?ap ?airport)
      (in_airplane ?p ?ap)
      (current_stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (package_at ?p ?airport)
      (not (in_airplane ?p ?ap))
      (not (current_stage ?s))
      (current_stage ?s2)
    )
  )

  (:action airplane_agent-fly
    :parameters (?ap - airplane ?from - airport ?to - airport ?s - stage ?s2 - stage)
    :precondition (and
      (airplane_at ?ap ?from)
      (different_city ?from ?to)
      (current_stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (airplane_at ?ap ?to)
      (not (airplane_at ?ap ?from))
      ;; packages in the airplane remain in_airplane and travel with the airplane
      (not (current_stage ?s))
      (current_stage ?s2)
    )
  )
)