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
  )

  ;; driver_0 actions (truck_0 in city_0)
  (:action drive_truck_0
    :parameters (?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (truck-at truck_0 ?from)
      (loc-in-city ?from city_0)
      (loc-in-city ?to city_0)
    )
    :effect (and
      (not (truck-at truck_0 ?from))
      (truck-at truck_0 ?to)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action load_truck_0
    :parameters (?p - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (truck-at truck_0 ?loc)
      (pkg-at ?p ?loc)
      (not (in-truck ?p truck_0))
      (not (in-truck ?p truck_1))
      (not (in-plane ?p airplane_0))
      (not (in-plane ?p airplane_1))
    )
    :effect (and
      (not (pkg-at ?p ?loc))
      (in-truck ?p truck_0)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action unload_truck_0
    :parameters (?p - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (truck-at truck_0 ?loc)
      (in-truck ?p truck_0)
    )
    :effect (and
      (not (in-truck ?p truck_0))
      (pkg-at ?p ?loc)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; driver_1 actions (truck_1 in city_1)
  (:action drive_truck_1
    :parameters (?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (truck-at truck_1 ?from)
      (loc-in-city ?from city_1)
      (loc-in-city ?to city_1)
    )
    :effect (and
      (not (truck-at truck_1 ?from))
      (truck-at truck_1 ?to)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action load_truck_1
    :parameters (?p - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (truck-at truck_1 ?loc)
      (pkg-at ?p ?loc)
      (not (in-truck ?p truck_0))
      (not (in-truck ?p truck_1))
      (not (in-plane ?p airplane_0))
      (not (in-plane ?p airplane_1))
    )
    :effect (and
      (not (pkg-at ?p ?loc))
      (in-truck ?p truck_1)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action unload_truck_1
    :parameters (?p - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (truck-at truck_1 ?loc)
      (in-truck ?p truck_1)
    )
    :effect (and
      (not (in-truck ?p truck_1))
      (pkg-at ?p ?loc)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; pilot_0 actions (airplane_0 moves between airports)
  (:action fly_airplane_0
    :parameters (?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (plane-at airplane_0 ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (plane-at airplane_0 ?from))
      (plane-at airplane_0 ?to)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action load_airplane_0
    :parameters (?p - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (plane-at airplane_0 ?loc)
      (airport ?loc)
      (pkg-at ?p ?loc)
      (not (in-plane ?p airplane_0))
      (not (in-plane ?p airplane_1))
      (not (in-truck ?p truck_0))
      (not (in-truck ?p truck_1))
    )
    :effect (and
      (not (pkg-at ?p ?loc))
      (in-plane ?p airplane_0)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action unload_airplane_0
    :parameters (?p - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (plane-at airplane_0 ?loc)
      (airport ?loc)
      (in-plane ?p airplane_0)
    )
    :effect (and
      (not (in-plane ?p airplane_0))
      (pkg-at ?p ?loc)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; pilot_1 actions (airplane_1)
  (:action fly_airplane_1
    :parameters (?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (plane-at airplane_1 ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (plane-at airplane_1 ?from))
      (plane-at airplane_1 ?to)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action load_airplane_1
    :parameters (?p - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (plane-at airplane_1 ?loc)
      (airport ?loc)
      (pkg-at ?p ?loc)
      (not (in-plane ?p airplane_0))
      (not (in-plane ?p airplane_1))
      (not (in-truck ?p truck_0))
      (not (in-truck ?p truck_1))
    )
    :effect (and
      (not (pkg-at ?p ?loc))
      (in-plane ?p airplane_1)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action unload_airplane_1
    :parameters (?p - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (plane-at airplane_1 ?loc)
      (airport ?loc)
      (in-plane ?p airplane_1)
    )
    :effect (and
      (not (in-plane ?p airplane_1))
      (pkg-at ?p ?loc)
      (not (current ?s))
      (current ?s2)
    )
  )
)