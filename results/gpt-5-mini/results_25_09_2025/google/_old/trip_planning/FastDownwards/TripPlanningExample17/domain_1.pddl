(define (domain integrated-trip-domain)
  (:requirements :strips :typing :negative-preconditions :equality :adl :action-costs)
  (:types city day number)

  (:predicates
    ; Flight network (direct flights available)
    (direct ?from - city ?to - city)

    ; Time-stamped location: traveler is at ?city on ?day
    (at ?city - city ?day - day)

    ; Current day marker (exactly one day holds as "today")
    (day ?d - day)

    ; Day succession relation
    (next ?d - day ?d2 - day)

    ; Conference attendance flags (traveler-level goals)
    (attended1)
    (attended5)

    ; Per-day "counted" marker to avoid counting a single day multiple times
    (counted ?d - day)

    ; Discrete numeric counters encoded as symbolic numbers
    (spent-cph ?n - number)
    (spent-vie ?n - number)
    (spent-lys ?n - number)

    ; Successor relation for numbers
    (nextnum ?n - number ?n2 - number)
  )

  ;-------------------------
  ; Flight-planner agent actions
  ;-------------------------
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (direct ?from ?to) (at ?from ?d) (next ?d ?d2))
    :effect (and
              (not (at ?from ?d))
              (at ?to ?d2)
            )
  )

  (:action stay
    :parameters (?city - city ?d - day ?d2 - day)
    :precondition (and (at ?city ?d) (next ?d ?d2))
    :effect (and
              (not (at ?city ?d))
              (at ?city ?d2)
            )
  )

  ;-------------------------
  ; Traveler agent actions (kept distinct)
  ; These traveler actions also advance the "current day" marker
  ;-------------------------
  (:action advance-day-copenhagen
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (day ?d1) (next ?d1 ?d2) (at copenhagen ?d1))
    :effect (and
              (not (day ?d1)) (day ?d2)
              (not (at copenhagen ?d1)) (at copenhagen ?d2)
            )
  )

  (:action advance-day-vienna
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (day ?d1) (next ?d1 ?d2) (at vienna ?d1))
    :effect (and
              (not (day ?d1)) (day ?d2)
              (not (at vienna ?d1)) (at vienna ?d2)
            )
  )

  (:action advance-day-lyon
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (day ?d1) (next ?d1 ?d2) (at lyon ?d1))
    :effect (and
              (not (day ?d1)) (day ?d2)
              (not (at lyon ?d1)) (at lyon ?d2)
            )
  )

  (:action fly-cph-to-vie-traveler
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (day ?d1) (next ?d1 ?d2) (at copenhagen ?d1) (direct copenhagen vienna))
    :effect (and
              (not (day ?d1)) (day ?d2)
              (not (at copenhagen ?d1)) (at vienna ?d2)
            )
  )

  (:action fly-vie-to-cph-traveler
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (day ?d1) (next ?d1 ?d2) (at vienna ?d1) (direct vienna copenhagen))
    :effect (and
              (not (day ?d1)) (day ?d2)
              (not (at vienna ?d1)) (at copenhagen ?d2)
            )
  )

  (:action fly-vie-to-lyon-traveler
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (day ?d1) (next ?d1 ?d2) (at vienna ?d1) (direct vienna lyon))
    :effect (and
              (not (day ?d1)) (day ?d2)
              (not (at vienna ?d1)) (at lyon ?d2)
            )
  )

  (:action fly-lyon-to-vie-traveler
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (day ?d1) (next ?d1 ?d2) (at lyon ?d1) (direct lyon vienna))
    :effect (and
              (not (day ?d1)) (day ?d2)
              (not (at lyon ?d1)) (at vienna ?d2)
            )
  )

  ;-------------------------
  ; Mark/count a day's presence in a city (one-time per day)
  ; These actions advance the symbolic numeric counter by one using nextnum.
  ;-------------------------
  (:action mark-spent-copenhagen
    :parameters (?d - day ?n - number ?n2 - number)
    :precondition (and (day ?d) (at copenhagen ?d) (not (counted ?d)) (spent-cph ?n) (nextnum ?n ?n2))
    :effect (and (not (spent-cph ?n)) (spent-cph ?n2) (counted ?d))
  )

  (:action mark-spent-vienna
    :parameters (?d - day ?n - number ?n2 - number)
    :precondition (and (day ?d) (at vienna ?d) (not (counted ?d)) (spent-vie ?n) (nextnum ?n ?n2))
    :effect (and (not (spent-vie ?n)) (spent-vie ?n2) (counted ?d))
  )

  (:action mark-spent-lyon
    :parameters (?d - day ?n - number ?n2 - number)
    :precondition (and (day ?d) (at lyon ?d) (not (counted ?d)) (spent-lys ?n) (nextnum ?n ?n2))
    :effect (and (not (spent-lys ?n)) (spent-lys ?n2) (counted ?d))
  )

  ;-------------------------
  ; Attend conference actions (traveler-level)
  ;-------------------------
  (:action attend-conference-day1
    :parameters ()
    :precondition (and (day day1) (at copenhagen day1))
    :effect (attended1)
  )

  (:action attend-conference-day5
    :parameters ()
    :precondition (and (day day5) (at copenhagen day5))
    :effect (attended5)
  )
)