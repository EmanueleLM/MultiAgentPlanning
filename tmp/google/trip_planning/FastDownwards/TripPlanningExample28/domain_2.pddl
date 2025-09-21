(define (domain integrated-euro-itinerary)
  (:requirements :strips :typing :negative-preconditions :conditional-effects :equality)
  (:types city agent day)

  (:predicates
    (at ?c - city)
    (at_agent ?a - agent ?c - city)
    (visited ?c - city)
    (direct ?from - city ?to - city)
    (direct-flight ?from - city ?to - city)
    (is-venice ?c - city)
    (current-day ?d - day)
    (consumes1 ?from - day ?to - day)
    (consumes2 ?from - day ?to - day)
  )

  (:action fly_agent1
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct ?from ?to))
    :effect (and
              (not (at ?from))
              (at ?to)
            )
  )

  (:action stay_in_venice_agent1
    :parameters (?c - city ?fromd - day ?tod - day)
    :precondition (and (at ?c) (is-venice ?c) (current-day ?fromd) (consumes1 ?fromd ?tod))
    :effect (and
             (not (current-day ?fromd))
             (current-day ?tod)
             (when (not (visited ?c)) (visited ?c))
            )
  )

  (:action stay_other_agent1
    :parameters (?c - city ?fromd - day ?tod - day)
    :precondition (and (at ?c) (not (is-venice ?c)) (current-day ?fromd) (consumes1 ?fromd ?tod))
    :effect (and
             (not (current-day ?fromd))
             (current-day ?tod)
             (when (not (visited ?c)) (visited ?c))
            )
  )

  (:action fly_agent2
    :parameters (?a - agent ?from - city ?to - city)
    :precondition (and (at_agent ?a ?from) (direct ?from ?to))
    :effect (and
              (not (at_agent ?a ?from))
              (at_agent ?a ?to)
            )
  )

  (:action spend_day_agent2
    :parameters (?a - agent ?c - city ?fromd - day ?tod - day)
    :precondition (and (at_agent ?a ?c) (current-day ?fromd) (consumes1 ?fromd ?tod))
    :effect (and
             (not (current-day ?fromd))
             (current-day ?tod)
             (when (not (visited ?c)) (visited ?c))
            )
  )

  (:action fly_agent3
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct-flight ?from ?to))
    :effect (and
              (not (at ?from))
              (at ?to)
            )
  )

  (:action stay_agent3
    :parameters (?c - city ?fromd - day ?tod - day)
    :precondition (and (at ?c) (not (visited ?c)) (current-day ?fromd) (consumes2 ?fromd ?tod))
    :effect (and
             (not (current-day ?fromd))
             (current-day ?tod)
             (visited ?c)
            )
  )
)