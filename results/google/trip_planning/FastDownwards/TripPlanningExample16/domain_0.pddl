(define (domain trip-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day token)

  (:predicates
    (day-available ?d - day)           ; a day not yet assigned
    (in ?c - city ?d - day)            ; day ?d is spent in city ?c
    (token-available ?t - token)      ; a token (one unit of required stay) is available
    (token-for ?t - token ?c - city)  ; token ?t belongs to city ?c
    (flight ?c1 - city ?c2 - city)     ; direct flight exists between c1 and c2
    (workshop-done)                    ; workshop in Prague has been attended
  )

  ;; Traveler actions (traveler agent)
  (:action traveler-start
    :parameters (?c - city ?t - token ?d - day)
    :precondition (and (day-available ?d) (token-available ?t) (token-for ?t ?c))
    :effect (and
      (not (day-available ?d))
      (not (token-available ?t))
      (in ?c ?d)
    )
  )

  (:action traveler-stay
    :parameters (?c - city ?d - day ?dnext - day ?t - token)
    :precondition (and (in ?c ?d) (day-available ?dnext) (token-available ?t) (token-for ?t ?c))
    :effect (and
      (not (day-available ?dnext))
      (not (token-available ?t))
      (in ?c ?dnext)
    )
  )

  ;; Flights agent actions (flights_agent). They model direct overnight flights between days.
  (:action flights_agent-fly
    :parameters (?from - city ?to - city ?d - day ?dnext - day ?t - token)
    :precondition (and (in ?from ?d) (day-available ?dnext) (flight ?from ?to) (token-available ?t) (token-for ?t ?to))
    :effect (and
      (not (day-available ?dnext))
      (not (token-available ?t))
      (in ?to ?dnext)
    )
  )

  ;; Traveler must attend the Prague workshop on one of days 1..3.
  (:action traveler-attend-workshop-d1
    :parameters ()
    :precondition (in prague d1)
    :effect (workshop-done)
  )
  (:action traveler-attend-workshop-d2
    :parameters ()
    :precondition (in prague d2)
    :effect (workshop-done)
  )
  (:action traveler-attend-workshop-d3
    :parameters ()
    :precondition (in prague d3)
    :effect (workshop-done)
  )
)