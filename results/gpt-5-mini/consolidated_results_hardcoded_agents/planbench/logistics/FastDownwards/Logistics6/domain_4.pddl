(define (domain transport_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city stage)

  (:predicates
    (pkg-at ?p - package ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?pl - airplane)
    (truck-at ?t - truck ?l - location)
    (plane-at ?pl - airplane ?l - location)
    (airport ?l - location)
    (loc-in-city ?l - location ?c - city)
    (succ ?s1 - stage ?s2 - stage)
    (current ?s - stage)
    ;; identity markers to scope namespaced actions to specific vehicles
    (is-truck0 ?t - truck)
    (is-truck1 ?t - truck)
    (is-plane0 ?pl - airplane)
    (is-plane1 ?pl - airplane)
  )

  ;; driver_0 actions (operate the truck identified as truck_0; moves only within city_0)
  (:action drive_truck_0
    :parameters (?t - truck ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (is-truck0 ?t)
      (truck-at ?t ?from)
      (loc-in-city ?from city_0)
      (loc-in-city ?to city_0)
    )
    :effect (and
      (not (truck-at ?t ?from))
      (truck-at ?t ?to)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action load_truck_0
    :parameters (?p - package ?t - truck ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (is-truck0 ?t)
      (truck-at ?t ?loc)
      (pkg-at ?p ?loc)
      (not (in-truck ?p ?t))
      (not (in-plane ?p ?pl)) ; prevents loading if in any plane (variable ?pl is implicit but negation checks any binding)
    )
    :effect (and
      (not (pkg-at ?p ?loc))
      (in-truck ?p ?t)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action unload_truck_0
    :parameters (?p - package ?t - truck ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (is-truck0 ?t)
      (truck-at ?t ?loc)
      (in-truck ?p ?t)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (pkg-at ?p ?loc)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; driver_1 actions (operate the truck identified as truck_1; moves only within city_1)
  (:action drive_truck_1
    :parameters (?t - truck ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (is-truck1 ?t)
      (truck-at ?t ?from)
      (loc-in-city ?from city_1)
      (loc-in-city ?to city_1)
    )
    :effect (and
      (not (truck-at ?t ?from))
      (truck-at ?t ?to)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action load_truck_1
    :parameters (?p - package ?t - truck ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (is-truck1 ?t)
      (truck-at ?t ?loc)
      (pkg-at ?p ?loc)
      (not (in-truck ?p ?t))
      (not (in-plane ?p ?pl))
    )
    :effect (and
      (not (pkg-at ?p ?loc))
      (in-truck ?p ?t)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action unload_truck_1
    :parameters (?p - package ?t - truck ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (is-truck1 ?t)
      (truck-at ?t ?loc)
      (in-truck ?p ?t)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (pkg-at ?p ?loc)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; pilot_0 actions (operate airplane_0 between airports)
  (:action fly_airplane_0
    :parameters (?pl - airplane ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (is-plane0 ?pl)
      (plane-at ?pl ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (plane-at ?pl ?from))
      (plane-at ?pl ?to)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action load_airplane_0
    :parameters (?p - package ?pl - airplane ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (is-plane0 ?pl)
      (plane-at ?pl ?loc)
      (airport ?loc)
      (pkg-at ?p ?loc)
      (not (in-plane ?p ?pl))
      (not (in-truck ?p ?t))
    )
    :effect (and
      (not (pkg-at ?p ?loc))
      (in-plane ?p ?pl)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action unload_airplane_0
    :parameters (?p - package ?pl - airplane ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (is-plane0 ?pl)
      (plane-at ?pl ?loc)
      (airport ?loc)
      (in-plane ?p ?pl)
    )
    :effect (and
      (not (in-plane ?p ?pl))
      (pkg-at ?p ?loc)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; pilot_1 actions (operate airplane_1 between airports)
  (:action fly_airplane_1
    :parameters (?pl - airplane ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (is-plane1 ?pl)
      (plane-at ?pl ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (plane-at ?pl ?from))
      (plane-at ?pl ?to)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action load_airplane_1
    :parameters (?p - package ?pl - airplane ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (is-plane1 ?pl)
      (plane-at ?pl ?loc)
      (airport ?loc)
      (pkg-at ?p ?loc)
      (not (in-plane ?p ?pl))
      (not (in-truck ?p ?t))
    )
    :effect (and
      (not (pkg-at ?p ?loc))
      (in-plane ?p ?pl)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action unload_airplane_1
    :parameters (?p - package ?pl - airplane ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (is-plane1 ?pl)
      (plane-at ?pl ?loc)
      (airport ?loc)
      (in-plane ?p ?pl)
    )
    :effect (and
      (not (in-plane ?p ?pl))
      (pkg-at ?p ?loc)
      (not (current ?s))
      (current ?s2)
    )
  )
)