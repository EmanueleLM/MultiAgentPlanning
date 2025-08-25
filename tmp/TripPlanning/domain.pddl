(define (domain travel-itinerary)
  (:requirements :strips :typing)

  (:types
    location day traveler
  )

  (:predicates
    (at ?person - traveler ?city - location ?day - day)
    (next-day ?d1 - day ?d2 - day)
    (visited ?city - location)
    (met-friend ?person - traveler ?day - day)
  )

  (:action travel
    :parameters (?person - traveler ?from - location ?to - location ?current - day ?next - day)
    :precondition (and
      (at ?person ?from ?current)
      (next-day ?current ?next))
    :effect (and
      (not (at ?person ?from ?current))
      (at ?person ?to ?next)
      (visited ?to))
  )

  (:action meet-friend
    :parameters (?person - traveler ?day - day)
    :precondition (at ?person Bucharest ?day)
    :effect (met-friend ?person ?day)
  )
)