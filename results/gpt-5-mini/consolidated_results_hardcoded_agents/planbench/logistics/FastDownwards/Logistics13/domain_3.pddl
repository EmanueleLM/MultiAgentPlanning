(define (domain multi_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package)

  (:predicates
    ;; positions
    (at-truck ?t - truck ?l - location)
    (at-plane ?a - airplane ?l - location)
    (at-pkg ?p - package ?l - location)

    ;; containment
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)

    ;; static relations
    (loc-in-city ?l - location ?c - city)
    (city-airport ?c - city ?l - location)
    (truck-assigned ?t - truck ?c - city)

    ;; auxiliary distinctness predicates (no :equality requirement)
    (distinct-loc ?l1 - location ?l2 - location)
    (distinct-city ?c1 - city ?c2 - city)
  )

  ;; Truck actions (operations constrained inside a city to the truck's assigned city)
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
                   (at-truck ?t ?from)
                   (loc-in-city ?from ?c)
                   (loc-in-city ?to ?c)
                   (truck-assigned ?t ?c)
                   (distinct-loc ?from ?to)
                  )
    :effect (and
             (not (at-truck ?t ?from))
             (at-truck ?t ?to)
            )
  )

  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
                   (at-pkg ?p ?l)
                   (at-truck ?t ?l)
                   (loc-in-city ?l ?c)
                   (truck-assigned ?t ?c)
                  )
    :effect (and
             (not (at-pkg ?p ?l))
             (in-truck ?p ?t)
            )
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
                   (in-truck ?p ?t)
                   (at-truck ?t ?l)
                   (loc-in-city ?l ?c)
                   (truck-assigned ?t ?c)
                  )
    :effect (and
             (not (in-truck ?p ?t))
             (at-pkg ?p ?l)
            )
  )

  ;; Airplane actions (operate only between designated city airports; cities must differ)
  (:action fly-plane
    :parameters (?a - airplane ?from - location ?to - location ?cf - city ?ct - city)
    :precondition (and
                   (at-plane ?a ?from)
                   (city-airport ?cf ?from)
                   (city-airport ?ct ?to)
                   (distinct-city ?cf ?ct)
                   (distinct-loc ?from ?to)
                  )
    :effect (and
             (not (at-plane ?a ?from))
             (at-plane ?a ?to)
            )
  )

  (:action load-plane
    :parameters (?p - package ?a - airplane ?l - location ?c - city)
    :precondition (and
                   (at-pkg ?p ?l)
                   (at-plane ?a ?l)
                   (city-airport ?c ?l)
                  )
    :effect (and
             (not (at-pkg ?p ?l))
             (in-plane ?p ?a)
            )
  )

  (:action unload-plane
    :parameters (?p - package ?a - airplane ?l - location ?c - city)
    :precondition (and
                   (in-plane ?p ?a)
                   (at-plane ?a ?l)
                   (city-airport ?c ?l)
                  )
    :effect (and
             (not (in-plane ?p ?a))
             (at-pkg ?p ?l)
            )
  )
)