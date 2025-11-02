(define (domain trip-domain)
  (:requirements :strips :typing)
  (:types day city)

  (:predicates
    (at ?d - day ?c - city)
    (next ?d1 - day ?d2 - day)
    (direct ?c1 - city ?c2 - city)
    (allowed-workshop-day ?d - day)
    (attended-workshop)
  )

  (:action stay_agent-stay-london
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at ?d1 london) (next ?d1 ?d2))
    :effect (and
              (at ?d2 london)
              (not (at ?d2 bucharest))
              (not (at ?d2 riga))
            )
  )

  (:action stay_agent-stay-bucharest
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at ?d1 bucharest) (next ?d1 ?d2))
    :effect (and
              (at ?d2 bucharest)
              (not (at ?d2 london))
              (not (at ?d2 riga))
            )
  )

  (:action stay_agent-stay-riga
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at ?d1 riga) (next ?d1 ?d2))
    :effect (and
              (at ?d2 riga)
              (not (at ?d2 london))
              (not (at ?d2 bucharest))
            )
  )

  (:action flight_agent-fly-london-to-bucharest
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at ?d1 london) (next ?d1 ?d2) (direct london bucharest))
    :effect (and
              (at ?d2 bucharest)
              (not (at ?d2 london))
              (not (at ?d2 riga))
            )
  )

  (:action flight_agent-fly-bucharest-to-london
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at ?d1 bucharest) (next ?d1 ?d2) (direct bucharest london))
    :effect (and
              (at ?d2 london)
              (not (at ?d2 bucharest))
              (not (at ?d2 riga))
            )
  )

  (:action flight_agent-fly-bucharest-to-riga
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at ?d1 bucharest) (next ?d1 ?d2) (direct bucharest riga))
    :effect (and
              (at ?d2 riga)
              (not (at ?d2 london))
              (not (at ?d2 bucharest))
            )
  )

  (:action flight_agent-fly-riga-to-bucharest
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at ?d1 riga) (next ?d1 ?d2) (direct riga bucharest))
    :effect (and
              (at ?d2 bucharest)
              (not (at ?d2 london))
              (not (at ?d2 riga))
            )
  )

  (:action attend-workshop
    :parameters (?d - day)
    :precondition (and (at ?d riga) (allowed-workshop-day ?d))
    :effect (attended-workshop)
  )
)