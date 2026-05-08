(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day token)

  (:predicates
    (assigned ?d - day)
    (at ?d - day ?c - city)
    (flight ?c1 - city ?c2 - city)
    (next ?d1 - day ?d2 - day)
    (first ?d - day)
    (token_unused ?t - token)
    (token_consumed ?t - token)
    (token_for ?t - token ?c - city)
    (attended_workshop)
    (workshop_day ?d - day)
  )

  ;; Assign a city to the first day, consuming one token for that city
  (:action assign_first_day
    :parameters (?d - day ?c - city ?t - token)
    :precondition (and (first ?d) (not (assigned ?d)) (token_for ?t ?c) (token_unused ?t))
    :effect (and (assigned ?d)
                 (at ?d ?c)
                 (not (token_unused ?t))
                 (token_consumed ?t))
  )

  ;; Stay in the same city on the next day, consuming a token for that city
  (:action assign_next_day_stay
    :parameters (?dprev - day ?dcurr - day ?c - city ?t - token)
    :precondition (and (assigned ?dprev) (at ?dprev ?c) (next ?dprev ?dcurr) (not (assigned ?dcurr))
                       (token_for ?t ?c) (token_unused ?t))
    :effect (and (assigned ?dcurr)
                 (at ?dcurr ?c)
                 (not (token_unused ?t))
                 (token_consumed ?t))
  )

  ;; Fly from one city to another on the next day, consumes a token for destination city.
  ;; Uses direct flight connectivity.
  (:action assign_next_day_fly
    :parameters (?dprev - day ?dcurr - day ?pc - city ?cc - city ?t - token)
    :precondition (and (assigned ?dprev) (at ?dprev ?pc) (next ?dprev ?dcurr) (not (assigned ?dcurr))
                       (flight ?pc ?cc) (token_for ?t ?cc) (token_unused ?t))
    :effect (and (assigned ?dcurr)
                 (at ?dcurr ?cc)
                 (not (token_unused ?t))
                 (token_consumed ?t))
  )

  ;; Mark that the workshop was attended if on a workshop day in Riga.
  (:action mark_workshop
    :parameters (?d - day)
    :precondition (and (assigned ?d) (at ?d riga) (workshop_day ?d) (not (attended_workshop)))
    :effect (attended_workshop)
  )
)