(define (domain integrated-euro-itinerary)
  (:requirements :strips :typing :equality)
  (:types city day agent)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current-day ?d - day)
    (consumes ?from - day ?to - day)
    (day-at ?d - day ?c - city)
  )

  (:action fly_venice_agent
    :parameters (?to - city)
    :precondition (and (at venice) (direct venice ?to))
    :effect (and
              (not (at venice))
              (at ?to)
            )
  )

  (:action fly_zurich_agent
    :parameters (?to - city)
    :precondition (and (at zurich) (direct zurich ?to))
    :effect (and
              (not (at zurich))
              (at ?to)
            )
  )

  (:action fly_florence_agent
    :parameters (?to - city)
    :precondition (and (at florence) (direct florence ?to))
    :effect (and
              (not (at florence))
              (at ?to)
            )
  )

  (:action stay_venice_agent
    :parameters (?d - day ?dnext - day)
    :precondition (and (at venice) (current-day ?d) (consumes ?d ?dnext))
    :effect (and
             (not (current-day ?d))
             (current-day ?dnext)
             (day-at ?d venice)
            )
  )

  (:action stay_zurich_agent
    :parameters (?d - day ?dnext - day)
    :precondition (and (at zurich) (current-day ?d) (consumes ?d ?dnext))
    :effect (and
             (not (current-day ?d))
             (current-day ?dnext)
             (day-at ?d zurich)
            )
  )

  (:action stay_florence_agent
    :parameters (?d - day ?dnext - day)
    :precondition (and (at florence) (current-day ?d) (consumes ?d ?dnext))
    :effect (and
             (not (current-day ?d))
             (current-day ?dnext)
             (day-at ?d florence)
            )
  )
)