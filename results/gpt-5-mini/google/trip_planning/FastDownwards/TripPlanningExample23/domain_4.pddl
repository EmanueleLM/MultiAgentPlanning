(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day token)

  (:predicates
    ;; day bookkeeping
    (assigned ?d - day)            ; day has been assigned a city
    (at ?d - day ?c - city)        ; day d is spent in city c
    (next ?d1 - day ?d2 - day)     ; day ordering
    (first ?d - day)               ; first calendar day

    ;; connectivity
    (flight ?c1 - city ?c2 - city) ; direct flight exists between cities

    ;; stay-count tokens: encode requested number of days in each city
    (token_for ?t - token ?c - city)
    (token_unused ?t - token)
    (token_consumed ?t - token)

    ;; workshop attendance
    (workshop_day ?d - day)        ; day on which the workshop may be attended
    (attended_workshop)            ; workshop has been attended (in Riga on a workshop_day)
  )

  ;; assign a city to the first day, consuming one stay-token for that city
  (:action assign_first_day
    :parameters (?d - day ?c - city ?t - token)
    :precondition (and (first ?d) (not (assigned ?d)) (token_for ?t ?c) (token_unused ?t))
    :effect (and
              (assigned ?d)
              (at ?d ?c)
              (not (token_unused ?t))
              (token_consumed ?t))
  )

  ;; stay in the same city on the next day, consuming a token for that city
  (:action assign_next_day_stay
    :parameters (?dprev - day ?dcurr - day ?c - city ?t - token)
    :precondition (and (assigned ?dprev) (at ?dprev ?c) (next ?dprev ?dcurr) (not (assigned ?dcurr))
                       (token_for ?t ?c) (token_unused ?t))
    :effect (and
              (assigned ?dcurr)
              (at ?dcurr ?c)
              (not (token_unused ?t))
              (token_consumed ?t))
  )

  ;; fly from one city to another on the next day, consumes a token for destination city.
  ;; Requires a direct flight between the cities.
  (:action assign_next_day_fly
    :parameters (?dprev - day ?dcurr - day ?pc - city ?cc - city ?t - token)
    :precondition (and (assigned ?dprev) (at ?dprev ?pc) (next ?dprev ?dcurr) (not (assigned ?dcurr))
                       (flight ?pc ?cc) (token_for ?t ?cc) (token_unused ?t))
    :effect (and
              (assigned ?dcurr)
              (at ?dcurr ?cc)
              (not (token_unused ?t))
              (token_consumed ?t))
  )

  ;; mark that the workshop was attended if on a workshop day while being in Riga.
  (:action mark_workshop
    :parameters (?d - day)
    :precondition (and (assigned ?d) (at ?d riga) (workshop_day ?d) (not (attended_workshop)))
    :effect (and (attended_workshop))
  )
)