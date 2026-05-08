(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    city - object
    location - object
    package - object
    vehicle - object
    truck - vehicle
    airplane - vehicle
  )
  (:predicates
    (package-at ?p - package ?l - location)
    (vehicle-at ?v - vehicle ?l - location)
    (in ?p - package ?v - vehicle)
    (loc-in-city ?l - location ?c - city)
    (is-airport ?l - location)
  )
  (:functions (total-cost))

  ;; Action: Drive Truck
  ;; Rule 5: Drive truck T from L1 to L2: T must be at L1, L1 and L2 must be in the same city. Effect: T is at L2, T is not at L1.
  (:action drive-truck
    :parameters (?t - truck ?l1 - location ?l2 - location ?c - city)
    :precondition (and
      (vehicle-at ?t ?l1)
      (loc-in-city ?l1 ?c)
      (loc-in-city ?l2 ?c)
    )
    :effect (and
      (not (vehicle-at ?t ?l1))
      (vehicle-at ?t ?l2)
      (increase (total-cost) 1)
    )
  )

  ;; Action: Load Package into Truck
  ;; Rule 3: Load package P into truck T at location L: P and T must be at L. Effect: P is in T, P is not at L.
  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (package-at ?p ?l)
      (vehicle-at ?t ?l)
    )
    :effect (and
      (not (package-at ?p ?l))
      (in ?p ?t)
      (increase (total-cost) 1)
    )
  )

  ;; Action: Unload Package from Truck
  ;; Rule 4: Unload package P from truck T at location L: P must be in T, T must be at L. Effect: P is at L, P is not in T.
  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in ?p ?t)
      (vehicle-at ?t ?l)
    )
    :effect (and
      (not (in ?p ?t))
      (package-at ?p ?l)
      (increase (total-cost) 1)
    )
  )

  ;; Action: Fly Airplane
  ;; Rule 8: Fly airplane A from L1 to L2: A must be at L1, L1 and L2 must be airports in different cities. Effect: A is at L2, A is not at L1.
  (:action fly-airplane
    :parameters (?a - airplane ?l1 - location ?l2 - location ?c1 - city ?c2 - city)
    :precondition (and
      (vehicle-at ?a ?l1)
      (is-airport ?l1)
      (is-airport ?l2)
      (loc-in-city ?l1 ?c1)
      (loc-in-city ?l2 ?c2)
      (not (= ?c1 ?c2))
    )
    :effect (and
      (not (vehicle-at ?a ?l1))
      (vehicle-at ?a ?l2)
      (increase (total-cost) 1)
    )
  )

  ;; Action: Load Package into Airplane
  ;; Rule 6: Load package P into airplane A at location L: P and A must be at L. Effect: P is in A, P is not at L.
  ;; Implied: Airplanes operate from airports.
  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (package-at ?p ?l)
      (vehicle-at ?a ?l)
      (is-airport ?l)
    )
    :effect (and
      (not (package-at ?p ?l))
      (in ?p ?a)
      (increase (total-cost) 1)
    )
  )

  ;; Action: Unload Package from Airplane
  ;; Rule 7: Unload package P from airplane A at location L: P must be in A, A must be at L. Effect: P is at L, P is not in A.
  ;; Implied: Airplanes operate from airports.
  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in ?p ?a)
      (vehicle-at ?a ?l)
      (is-airport ?l)
    )
    :effect (and
      (not (in ?p ?a))
      (package-at ?p ?l)
      (increase (total-cost) 1)
    )
  )
)