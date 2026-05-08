(define (domain logistics20)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    city
    location
    package
    truck
    airplane
    vehicle - (either truck airplane)
  )
  (:predicates
    (at ?obj - (either package vehicle) ?loc - location)
    (in ?p - package ?v - vehicle)
    (in-city ?loc - location ?c - city)
    (airport ?loc - location)
  )
  
  (:functions
    (total-cost)
  )

  ; 1. Load Package onto Truck
  (:action load-package-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and 
      (at ?p ?l) 
      (at ?t ?l)
    )
    :effect (and 
      (in ?p ?t) 
      (not (at ?p ?l))
      (increase (total-cost) 1)
    )
  )

  ; 2. Unload Package from Truck
  (:action unload-package-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and 
      (in ?p ?t) 
      (at ?t ?l)
    )
    :effect (and 
      (at ?p ?l) 
      (not (in ?p ?t))
      (increase (total-cost) 1)
    )
  )

  ; 3. Drive Truck (within the same city)
  (:action drive-truck
    :parameters (?t - truck ?l1 - location ?l2 - location ?c - city)
    :precondition (and 
      (at ?t ?l1) 
      (in-city ?l1 ?c) 
      (in-city ?l2 ?c)
      (not (= ?l1 ?l2))
    )
    :effect (and 
      (at ?t ?l2) 
      (not (at ?t ?l1))
      (increase (total-cost) 1)
    )
  )

  ; 4. Load Package onto Plane
  (:action load-package-plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and 
      (at ?p ?l) 
      (at ?a ?l)
    )
    :effect (and 
      (in ?p ?a) 
      (not (at ?p ?l))
      (increase (total-cost) 1)
    )
  )

  ; 5. Unload Package from Plane
  (:action unload-package-plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and 
      (in ?p ?a) 
      (at ?a ?l)
    )
    :effect (and 
      (at ?p ?l) 
      (not (in ?p ?a))
      (increase (total-cost) 1)
    )
  )

  ; 6. Fly Plane (between airports)
  (:action fly-plane
    :parameters (?a - airplane ?l1 - location ?l2 - location)
    :precondition (and 
      (at ?a ?l1) 
      (airport ?l1) 
      (airport ?l2)
      (not (= ?l1 ?l2))
    )
    :effect (and 
      (at ?a ?l2) 
      (not (at ?a ?l1))
      (increase (total-cost) 1)
    )
  )
)