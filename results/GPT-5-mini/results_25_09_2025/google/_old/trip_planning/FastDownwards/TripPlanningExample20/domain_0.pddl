(define (domain integrated-travel)
  ;; Integrated domain merging "traveler" and "flight_checker" agents.
  ;; Actions belonging to different agents are kept distinct (start-at, fly_checker-fly, fly_traveler, visit-...).
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types city)
  (:predicates
    (at ?c - city)
    (visited ?c - city)
    (flight ?from - city ?to - city)   ;; predicate used by the traveler agent
    (direct ?from - city ?to - city)   ;; predicate used by the flight_checker agent
  )
  (:functions
    (days-left)
  )

  ;; start-at action (from flight_checker). Allows picking any starting city; marks it visited.
  (:action start-at
    :parameters (?c - city)
    :precondition ()
    :effect (and
              (at ?c)
              (visited ?c)
            )
  )

  ;; fly action for the flight_checker agent: uses explicit direct flights and marks the destination visited.
  (:action fly_checker-fly
    :parameters (?from - city ?to - city)
    :precondition (and
                    (at ?from)
                    (direct ?from ?to)
                  )
    :effect (and
              (not (at ?from))
              (at ?to)
              (visited ?to)
            )
  )

  ;; fly action for the traveler agent: uses the 'flight' predicate (kept separate for compatibility).
  ;; In the integrated problem we will assert matching flight facts for all direct flights so this action
  ;; will only be possible when a corresponding direct flight exists as well.
  (:action fly_traveler
    :parameters (?from - city ?to - city)
    :precondition (and
                    (at ?from)
                    (flight ?from ?to)
                  )
    :effect (and
              (not (at ?from))
              (at ?to)
            )
  )

  ;; Visit actions from the traveler agent. Each consumes days-left according to private preferences.
  ;; They require being at the city and that the city has not been visited yet.
  (:action visit-istanbul
    :parameters ()
    :precondition (and
                    (at istanbul)
                    (not (visited istanbul))
                    (>= (days-left) 5)
                  )
    :effect (and
              (visited istanbul)
              (decrease (days-left) 5)
            )
  )

  (:action visit-budapest
    :parameters ()
    :precondition (and
                    (at budapest)
                    (not (visited budapest))
                    (>= (days-left) 6)
                  )
    :effect (and
              (visited budapest)
              (decrease (days-left) 6)
            )
  )

  (:action visit-dubrovnik
    :parameters ()
    :precondition (and
                    (at dubrovnik)
                    (not (visited dubrovnik))
                    (>= (days-left) 3)
                  )
    :effect (and
              (visited dubrovnik)
              (decrease (days-left) 3)
            )
  )
)