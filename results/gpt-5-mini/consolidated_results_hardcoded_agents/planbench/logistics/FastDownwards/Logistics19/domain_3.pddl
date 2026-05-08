(define (domain transport_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package city location stage)

  (:predicates
    ;; vehicle and package locations
    (truck_at ?t - truck ?l - location)
    (airplane_at ?a - airplane ?l - location)
    (package_at ?p - package ?l - location)

    ;; containment
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)

    ;; city membership relation between locations (to be provided extensionally in :init)
    (same_city ?l1 - location ?l2 - location)

    ;; airport marker on locations (airport locations are also locations)
    (is_airport ?l - location)

    ;; explicit discrete stage progression to enforce ordering
    (current_stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; All actions advance the current_stage from a stage to its successor to enforce a strict,
  ;; contiguous ordering of actions. Each action requires the current stage and a succ link to
  ;; the next stage; effects remove the current_stage and set the next.

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
      ;; packages in the truck remain in_truck and thus remain associated with the truck identity.
      (not (current_stage ?s))
      (current_stage ?s2)
    )
  )

  ;; Airplane-agent actions
  (:action airplane_agent-load-into-airplane
    :parameters (?ap - airplane ?p - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (airplane_at ?ap ?loc)
      (is_airport ?loc)
      (package_at ?p ?loc)
      (current_stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (in_airplane ?p ?ap)
      (not (package_at ?p ?loc))
      (not (current_stage ?s))
      (current_stage ?s2)
    )
  )

  (:action airplane_agent-unload-from-airplane
    :parameters (?ap - airplane ?p - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (airplane_at ?ap ?loc)
      (is_airport ?loc)
      (in_airplane ?p ?ap)
      (current_stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (package_at ?p ?loc)
      (not (in_airplane ?p ?ap))
      (not (current_stage ?s))
      (current_stage ?s2)
    )
  )

  (:action airplane_agent-fly
    :parameters (?ap - airplane ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (airplane_at ?ap ?from)
      (is_airport ?from)
      (is_airport ?to)
      (not (same_city ?from ?to))
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