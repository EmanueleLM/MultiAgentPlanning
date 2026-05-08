(define (domain logistics37)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package truck airplane location city
  )
  (:predicates
    (at ?obj - (either package truck airplane) ?loc - location)
    (in ?pkg - package ?veh - (either truck airplane))
    (is-airport ?loc - location)
    (in-city ?loc - location ?cty - city)
  )

  (:action load-package-truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and
      (at ?pkg ?loc)
      (at ?trk ?loc)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in ?pkg ?trk)
    )
  )

  (:action load-package-airplane
    :parameters (?pkg - package ?apn - airplane ?loc - location)
    :precondition (and
      (at ?pkg ?loc)
      (at ?apn ?loc)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in ?pkg ?apn)
    )
  )

  (:action unload-package-truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and
      (in ?pkg ?trk)
      (at ?trk ?loc)
    )
    :effect (and
      (not (in ?pkg ?trk))
      (at ?pkg ?loc)
    )
  )

  (:action unload-package-airplane
    :parameters (?pkg - package ?apn - airplane ?loc - location)
    :precondition (and
      (in ?pkg ?apn)
      (at ?apn ?loc)
    )
    :effect (and
      (not (in ?pkg ?apn))
      (at ?pkg ?loc)
    )
  )

  (:action drive-truck
    :parameters (?trk - truck ?from - location ?to - location ?cty - city)
    :precondition (and
      (at ?trk ?from)
      (in-city ?from ?cty)
      (in-city ?to ?cty)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?trk ?from))
      (at ?trk ?to)
    )
  )

  (:action fly-airplane
    :parameters (?apn - airplane ?from - location ?to - location ?from_city - city ?to_city - city)
    :precondition (and
      (at ?apn ?from)
      (is-airport ?from)
      (is-airport ?to)
      (in-city ?from ?from_city)
      (in-city ?to ?to_city)
      (not (= ?from_city ?to_city))
    )
    :effect (and
      (not (at ?apn ?from))
      (at ?apn ?to)
    )
  )
)