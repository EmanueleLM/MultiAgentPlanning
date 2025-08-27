(define (domain traveler)
  (:requirements :strips :typing)

  (:types
    city hotel
  )

  (:predicates
    (connected ?from ?to)
    (at ?person ?place)
    (in-stay ?person ?hotel)
    (flight-available ?from ?to ?day)
    (day ?day)
    (next-day ?current ?next)
    (hotel-available ?hotel ?city ?day)
    (can-stay ?hotel ?from-day ?to-day ?person)
  )

  (:action book-flight
    :parameters (?person ?from ?to ?day)
    :precondition (and
      (at ?person ?from)
      (connected ?from ?to)
      (flight-available ?from ?to ?day)
    )
    :effect (and
      (at ?person ?to)
      (not (at ?person ?from))
    )
  )

  (:action check-in-hotel
    :parameters (?person ?hotel ?city ?checkin-day ?checkout-day)
    :precondition (and
      (at ?person ?city)
      (hotel-available ?hotel ?city ?checkin-day)
      (can-stay ?hotel ?checkin-day ?checkout-day ?person)
    )
    :effect (in-stay ?person ?hotel)
  )

  (:action advance-day
    :parameters (?current ?next)
    :precondition (next-day ?current ?next)
    :effect (and
      (not (day ?current))
      (day ?next)
    )
  )
)