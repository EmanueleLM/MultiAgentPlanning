(define (domain traveler)
  (:requirements :strips :typing)
  
  (:types
    city hotel person
  )
      
  (:predicates
    (connected ?from ?to - city)
    (at ?person - person ?place - city)
    (in-stay ?person - person ?hotel - hotel)
    (flight-available ?from ?to - city ?day - day)
    (day ?day - day)
    (next-day ?current ?next - day)
    (hotel-available ?hotel - hotel ?city - city ?day - day)
    (can-stay ?hotel - hotel ?from-day ?to-day - day ?person - person)
  )
  
  (:action book-flight
    :parameters (?person - person ?from ?to - city ?day - day)
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
    :parameters (?person - person ?hotel - hotel ?city - city ?checkin-day ?checkout-day - day)
    :precondition (and 
      (at ?person ?city)
      (hotel-available ?hotel ?city ?checkin-day)
      (can-stay ?hotel ?checkin-day ?checkout-day ?person)
    )
    :effect (in-stay ?person ?hotel)
  )

  (:action advance-day
    :parameters (?current ?next - day)
    :precondition (next-day ?current ?next)
    :effect (and 
      (not (day ?current))
      (day ?next)
    )
  )
)