(define (domain multiagent-travel)
  (:requirements :strips :typing)
  (:types agent city day)

  (:predicates
    (at ?a - agent ?c - city ?d - day)        ; agent ?a is at city ?c on day ?d (represents current position at that day)
    (direct ?c1 - city ?c2 - city)           ; direct flight exists between two cities
    (next ?d1 - day ?d2 - day)               ; day successor relation
    (need-attend ?d - day)                   ; a conference must be attended on this day (in Copenhagen)
    (attended ?d - day)                      ; conference attended on this day
    (visited ?c - city)                      ; city has been visited at least once
  )

  ;; Traveler actions (prefix traveler- to keep actions distinct)
  (:action traveler-stay
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and (at traveler ?c ?d) (next ?d ?d2))
    :effect (and
              (not (at traveler ?c ?d))
              (at traveler ?c ?d2)
              (visited ?c)
            )
  )

  (:action traveler-attend-conference
    :parameters (?d - day)
    :precondition (and (at traveler copenhagen ?d) (need-attend ?d))
    :effect (and
              (attended ?d)
              (visited copenhagen)
            )
  )

  ;; Flight planner actions (prefix flight-planner-). These represent using direct flights to move the traveler.
  (:action flight-planner-fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at traveler ?from ?d) (direct ?from ?to) (next ?d ?d2))
    :effect (and
              (not (at traveler ?from ?d))
              (at traveler ?to ?d2)
              (visited ?to)
            )
  )

)