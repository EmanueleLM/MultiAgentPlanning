(define (domain transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city location vehicle - object
    truck airplane - vehicle
    package - object
  )
  (:predicates
    (at ?obj - object ?loc - location)
    (in-city ?loc - location ?city - city)
    (airport ?loc - location)
    (in ?pkg - package ?vehicle - vehicle)
  )
  
  (:action load-package-into-truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and
      (at ?pkg ?loc)
      (at ?truck ?loc)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in ?pkg ?truck)
    )
  )
  
  (:action unload-package-from-truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and
      (in ?pkg ?truck)
      (at ?truck ?loc)
    )
    :effect (and
      (at ?pkg ?loc)
      (not (in ?pkg ?truck))
    )
  )
  
  (:action load-package-into-airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and
      (at ?pkg ?loc)
      (at ?airplane ?loc)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in ?pkg ?airplane)
    )
  )
  
  (:action unload-package-from-airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and
      (in ?pkg ?airplane)
      (at ?airplane ?loc)
    )
    :effect (and
      (at ?pkg ?loc)
      (not (in ?pkg ?airplane))
    )
  )
  
  (:action drive-truck
    :parameters (?truck - truck ?from ?to - location ?city - city)
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
    :parameters (?airplane - airplane ?from ?to - location)
    :precondition (and
      (at ?airplane ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at ?airplane ?from))
      (at ?airplane ?to)
    )
  )
)