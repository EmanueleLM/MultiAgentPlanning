(define (domain orchestrator_combined)
  ;; Integrated domain combining Tallinn-agent, Seville-agent, and Munich-agent.
  ;; Requirements: numeric fluents and ADL for numeric preconditions and conditional effects.
  (:requirements :typing :fluents :adl)
  (:types city day)

  (:predicates
    (flight ?from - city ?to - city)        ; direct flight available from -> to
    (in ?c - city ?d - day)                 ; traveler is in city c on day d (day-indexed)
    (succ ?d1 - day ?d2 - day)              ; d2 is the day immediately after d1
    (allowed-meet ?d - day)                 ; meeting is allowed on this day
    (met ?d - day)                          ; meeting happened on day d
  )

  (:functions
    (remaining-days)   ; days remaining to allocate (starts at 12)
    (seville-days)     ; days spent in Seville (must reach 7)
    (munich-days)      ; days spent in Munich (reconciled to 3)
  )

  ;; -------------------------
  ;; Tallinn agent actions (kept distinct; names preserved with tallinn- prefix)
  ;; -------------------------
  (:action tallinn-fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (flight ?from ?to) (in ?from ?d1) (succ ?d1 ?d2) (>= (remaining-days) 1))
    :effect (and
             (not (in ?from ?d1))
             (in ?to ?d2)
             (decrease (remaining-days) 1)
            )
  )

  (:action tallinn-stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (in ?c ?d1) (succ ?d1 ?d2) (>= (remaining-days) 1))
    :effect (and
             (not (in ?c ?d1))
             (in ?c ?d2)
             (decrease (remaining-days) 1)
            )
  )

  (:action tallinn-meet
    :parameters (?d - day)
    :precondition (and (in tallinn ?d) (allowed-meet ?d))
    :effect (met ?d)
  )

  ;; -------------------------
  ;; Seville agent actions (kept distinct; names preserved with seville- prefix)
  ;; The original seville fragment used numeric remaining-days and seville-days.
  ;; Here we require being in Seville for a day to spend that day and increment seville-days.
  ;; -------------------------
  (:action seville-fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (flight ?from ?to) (in ?from ?d1) (succ ?d1 ?d2) (>= (remaining-days) 1))
    :effect (and
             (not (in ?from ?d1))
             (in ?to ?d2)
             (decrease (remaining-days) 1)
            )
  )

  (:action stay-seville
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (in seville ?d1) (succ ?d1 ?d2) (>= (remaining-days) 1))
    :effect (and
             (not (in seville ?d1))
             (in seville ?d2)
             (decrease (remaining-days) 1)
             (increase (seville-days) 1)
            )
  )

  ;; -------------------------
  ;; Munich agent actions (kept distinct; names preserved with munich- prefix)
  ;; The original munich fragment used an (at) predicate and a numeric day counter.
  ;; For integration we use the (in ?c ?d) day-based model and a munich-days counter.
  ;; -------------------------
  (:action munich-fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (flight ?from ?to) (in ?from ?d1) (succ ?d1 ?d2) (>= (remaining-days) 1))
    :effect (and
             (not (in ?from ?d1))
             (in ?to ?d2)
             (decrease (remaining-days) 1)
            )
  )

  (:action munich-stay-one-day
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (in munich ?d1) (succ ?d1 ?d2) (>= (remaining-days) 1))
    :effect (and
             (not (in munich ?d1))
             (in munich ?d2)
             (decrease (remaining-days) 1)
             (increase (munich-days) 1)
            )
  )
)