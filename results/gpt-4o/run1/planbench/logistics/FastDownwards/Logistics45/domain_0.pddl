(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city location truck airplane package
  )
  (:predicates
    (at ?vehicle - (truck airplane) ?location - location)
    (in ?package - package ?vehicle - (truck airplane))
    (at ?package - package ?location - location)
    (airport ?location - location)
    (in-city ?location - location ?city - city)
  )
  (:action load-truck
    :parameters (?package - package ?truck - truck ?location - location)
    :precondition (and
      (at ?truck ?location)
      (at ?package ?location)
    )
    :effect (and
      (not (at ?package ?location))
      (in ?package ?truck)
    )
  )
  (:action unload-truck
    :parameters (?package - package ?truck - truck ?location - location)
    :precondition (and
      (in ?package ?truck)
      (at ?truck ?location)
    )
    :effect (and
      (not (in ?package ?truck))
      (at ?package ?location)
    )
  )
  (:action load-airplane
    :parameters (?package - package ?airplane - airplane ?location - location)
    :precondition (and
      (airport ?location)
      (at ?airplane ?location)
      (at ?package ?location)
    )
    :effect (and
      (not (at ?package ?location))
      (in ?package ?airplane)
    )
  )
  (:action unload-airplane
    :parameters (?package - package ?airplane - airplane ?location - location)
    :precondition (and
      (in ?package ?airplane)
      (at ?airplane ?location)
    )
    :effect (and
      (not (in ?package ?airplane))
      (at ?package ?location)
    )
  )
  (:action drive-truck
    :parameters (?truck - truck ?from - location ?to - location ?city - city)
    :precondition (and
      (at ?truck ?from)
      (in-city ?from ?city)
      (in-city ?to ?city)
    )
    :effect (and
      (not (at ?truck ?from))
      (at ?truck ?to)
    )
  )
  (:action fly-airplane
    :parameters (?airplane - airplane ?from - location ?to - location)
    :precondition (and
      (airport ?from)
      (airport ?to)
      (at ?airplane ?from)
    )
    :effect (and
      (not (at ?airplane ?from))
      (at ?airplane ?to)
    )
  )
)