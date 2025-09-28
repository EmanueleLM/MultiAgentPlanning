(define (domain trip-domain)
  (:requirements :strips :typing)
  (:types day city)

  (:predicates
    (at ?d - day ?c - city)                 ; traveler is in city on day
    (next ?d1 - day ?d2 - day)             ; ordering of days
    (direct ?c1 - city ?c2 - city)         ; direct flight exists between cities
    (allowed-workshop-day ?d - day)        ; day is allowed for Riga workshop (days 5..8)
    (attended-workshop)                    ; workshop attendance achieved
  )

  ; Stay actions (stay-agent actions)
  (:action stay_agent-stay-london
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at ?d1 London) (next ?d1 ?d2))
    :effect (and
              (at ?d2 London)
              (not (at ?d2 Bucharest))
              (not (at ?d2 Riga))
            )
  )

  (:action stay_agent-stay-bucharest
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at ?d1 Bucharest) (next ?d1 ?d2))
    :effect (and
              (at ?d2 Bucharest)
              (not (at ?d2 London))
              (not (at ?d2 Riga))
            )
  )

  (:action stay_agent-stay-riga
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at ?d1 Riga) (next ?d1 ?d2))
    :effect (and
              (at ?d2 Riga)
              (not (at ?d2 London))
              (not (at ?d2 Bucharest))
            )
  )

  ; Flight actions (flight-agent actions) - only direct legs allowed
  (:action flight_agent-fly-london-to-bucharest
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at ?d1 London) (next ?d1 ?d2) (direct London Bucharest))
    :effect (and
              (at ?d2 Bucharest)
              (not (at ?d2 London))
              (not (at ?d2 Riga))
            )
  )

  (:action flight_agent-fly-bucharest-to-london
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at ?d1 Bucharest) (next ?d1 ?d2) (direct Bucharest London))
    :effect (and
              (at ?d2 London)
              (not (at ?d2 Bucharest))
              (not (at ?d2 Riga))
            )
  )

  (:action flight_agent-fly-bucharest-to-riga
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at ?d1 Bucharest) (next ?d1 ?d2) (direct Bucharest Riga))
    :effect (and
              (at ?d2 Riga)
              (not (at ?d2 London))
              (not (at ?d2 Bucharest))
            )
  )

  (:action flight_agent-fly-riga-to-bucharest
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at ?d1 Riga) (next ?d1 ?d2) (direct Riga Bucharest))
    :effect (and
              (at ?d2 Bucharest)
              (not (at ?d2 London))
              (not (at ?d2 Riga))
            )
  )

  ; Attend workshop action (can be executed only on allowed days while in Riga)
  (:action attend-workshop
    :parameters (?d - day)
    :precondition (and (at ?d Riga) (allowed-workshop-day ?d))
    :effect (attended-workshop)
  )
)