(define (domain itinerary)
  (:requirements :strips :typing)
  (:types agent city day)
  (:predicates
    (at ?a - agent ?c - city ?d - day)        ; agent is at city on day
    (next ?d1 - day ?d2 - day)               ; day successor relation
    (direct ?c1 - city ?c2 - city)           ; direct flight exists between cities
    (visited ?c - city)                      ; city has been visited (optional marker)
    (met ?d - day)                           ; meeting happened on a specific day
  )

  ;; Traveler stays in a city from day d to day d2 (where next d d2).
  (:action traveler-stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at traveler ?c ?d) (next ?d ?d2))
    :effect (and (at traveler ?c ?d2) (visited ?c))
  )

  ;; Traveler flies from Berlin to Warsaw using a direct flight, consuming one day.
  (:action traveler-fly-berlin-warsaw
    :parameters (?d - day ?d2 - day)
    :precondition (and (at traveler berlin ?d) (next ?d ?d2) (direct berlin warsaw))
    :effect (and (at traveler warsaw ?d2) (visited warsaw))
  )

  ;; Traveler flies from Warsaw to Bucharest using a direct flight, consuming one day.
  (:action traveler-fly-warsaw-bucharest
    :parameters (?d - day ?d2 - day)
    :precondition (and (at traveler warsaw ?d) (next ?d ?d2) (direct warsaw bucharest))
    :effect (and (at traveler bucharest ?d2) (visited bucharest))
  )

  ;; Meeting actions restricted to allowed meeting days (day5 or day6).
  (:action traveler-meet-day5
    :parameters ()
    :precondition (and (at traveler bucharest day5))
    :effect (and (met day5))
  )

  (:action traveler-meet-day6
    :parameters ()
    :precondition (and (at traveler bucharest day6))
    :effect (and (met day6))
  )
)