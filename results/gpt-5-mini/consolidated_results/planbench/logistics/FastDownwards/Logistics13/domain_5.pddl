(define (domain multi_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package stage)

  (:predicates
    (at-truck ?t - truck ?l - location)
    (at-plane ?a - airplane ?l - location)
    (at-pkg ?p - package ?l - location)

    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)

    (loc-in-city ?l - location ?c - city)
    (city-airport ?c - city ?l - location)
    (truck-assigned ?t - truck ?c - city)

    (stage-now ?s - stage)
    (next ?s1 - stage ?s2 - stage)

    (distinct-loc ?l1 - location ?l2 - location)
    (distinct-city ?c1 - city ?c2 - city)
  )

  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
                   (stage-now ?s)
                   (next ?s ?s2)
                   (at-truck ?t ?from)
                   (loc-in-city ?from ?c)
                   (loc-in-city ?to ?c)
                   (truck-assigned ?t ?c)
                   (distinct-loc ?from ?to)
                  )
    :effect (and
             (not (at-truck ?t ?from))
             (at-truck ?t ?to)
             (not (stage-now ?s))
             (stage-now ?s2)
            )
  )

  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
                   (stage-now ?s)
                   (next ?s ?s2)
                   (at-pkg ?p ?l)
                   (at-truck ?t ?l)
                   (loc-in-city ?l ?c)
                   (truck-assigned ?t ?c)
                  )
    :effect (and
             (not (at-pkg ?p ?l))
             (in-truck ?p ?t)
             (not (stage-now ?s))
             (stage-now ?s2)
            )
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
                   (stage-now ?s)
                   (next ?s ?s2)
                   (in-truck ?p ?t)
                   (at-truck ?t ?l)
                   (loc-in-city ?l ?c)
                   (truck-assigned ?t ?c)
                  )
    :effect (and
             (not (in-truck ?p ?t))
             (at-pkg ?p ?l)
             (not (stage-now ?s))
             (stage-now ?s2)
            )
  )

  (:action fly-plane
    :parameters (?a - airplane ?from - location ?to - location ?cf - city ?ct - city ?s - stage ?s2 - stage)
    :precondition (and
                   (stage-now ?s)
                   (next ?s ?s2)
                   (at-plane ?a ?from)
                   (city-airport ?cf ?from)
                   (city-airport ?ct ?to)
                   (distinct-city ?cf ?ct)
                   (distinct-loc ?from ?to)
                  )
    :effect (and
             (not (at-plane ?a ?from))
             (at-plane ?a ?to)
             (not (stage-now ?s))
             (stage-now ?s2)
            )
  )

  (:action load-plane
    :parameters (?p - package ?a - airplane ?l - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
                   (stage-now ?s)
                   (next ?s ?s2)
                   (at-pkg ?p ?l)
                   (at-plane ?a ?l)
                   (city-airport ?c ?l)
                  )
    :effect (and
             (not (at-pkg ?p ?l))
             (in-plane ?p ?a)
             (not (stage-now ?s))
             (stage-now ?s2)
            )
  )

  (:action unload-plane
    :parameters (?p - package ?a - airplane ?l - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
                   (stage-now ?s)
                   (next ?s ?s2)
                   (in-plane ?p ?a)
                   (at-plane ?a ?l)
                   (city-airport ?c ?l)
                  )
    :effect (and
             (not (in-plane ?p ?a))
             (at-pkg ?p ?l)
             (not (stage-now ?s))
             (stage-now ?s2)
            )
  )
)