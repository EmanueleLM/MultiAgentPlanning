(define (domain multi-agent-itinerary)
  (:requirements :strips :typing :negative-preconditions :fluents :numeric-fluents)
  (:types city day)

  ;; Predicates
  (:predicates
    (at ?c - city ?d - day)            ; traveler is in city ?c on day ?d
    (assigned ?d - day)               ; day ?d has been assigned to a city
    (direct-flight ?from - city ?to - city) ; connectivity (direct flights)
    (next ?d1 - day ?d2 - day)        ; successor day relation
    (workshop-allowed ?d - day)       ; day is allowed for the workshop (days 1..4)
    (workshop-attended)               ; workshop has been attended
  )

  ;; Numeric functions to count days per city
  (:functions
    (days-in ?c - city)
  )

  ;; Traveler actions: start the trip in a city on day1, stay in same city next day, attend workshop
  (:action traveler-start-stay
    :parameters (?c - city ?d - day)
    :precondition (and (not (assigned ?d)))
    :effect (and
      (at ?c ?d)
      (assigned ?d)
      (increase (days-in ?c) 1)
    )
  )

  (:action traveler-stay
    :parameters (?c - city ?dprev - day ?dnext - day)
    :precondition (and
      (at ?c ?dprev)
      (next ?dprev ?dnext)
      (not (assigned ?dnext))
    )
    :effect (and
      (at ?c ?dnext)
      (assigned ?dnext)
      (increase (days-in ?c) 1)
    )
  )

  (:action traveler-attend-workshop
    :parameters (?d - day)
    :precondition (and
      (at florence ?d)
      (workshop-allowed ?d)
      (not (workshop-attended))
    )
    :effect (workshop-attended)
  )

  ;; Flight planner action: perform a direct flight between cities to change location next day
  (:action flight_planner-fly
    :parameters (?from - city ?to - city ?dprev - day ?dnext - day)
    :precondition (and
      (direct-flight ?from ?to)
      (at ?from ?dprev)
      (next ?dprev ?dnext)
      (not (assigned ?dnext))
    )
    :effect (and
      (at ?to ?dnext)
      (assigned ?dnext)
      (increase (days-in ?to) 1)
    )
  )
)