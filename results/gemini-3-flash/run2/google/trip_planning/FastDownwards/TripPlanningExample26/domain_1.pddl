(define (domain trip_planning_example_26)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (next ?d1 ?d2 - day)
    (connected ?c1 ?c2 - city)
    (friend_at ?c - city ?d - day)
    (met_friend)
  )

  ;; Stay in the same city and progress to the next day
  (:action stay
    :parameters (?c - city ?d_from ?d_to - day)
    :precondition (and (at ?c ?d_from) (next ?d_from ?d_to))
    :effect (and (at ?c ?d_to) (visited ?c ?d_to) (not (at ?c ?d_from)))
  )

  ;; Fly between cities on the same day (overlap day)
  (:action fly
    :parameters (?from ?to - city ?d - day)
    :precondition (and (at ?from ?d) (connected ?from ?to))
    :effect (and (at ?to ?d) (visited ?to ?d) (not (at ?from ?d)))
  )

  ;; Meet a friend in a city on a specific day
  (:action meet_friend
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (friend_at ?c ?d))
    :effect (met_friend)
  )
)