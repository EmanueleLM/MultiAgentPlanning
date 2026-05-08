(define (domain trip-scheduling)
  (:requirements :typing)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (attended-conference ?d - day)
  )

  ;; Stay actions: spend one whole day in the same city (advance one day)
  (:action stay-copenhagen
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at copenhagen ?d1) (next ?d1 ?d2))
    :effect (and (at copenhagen ?d2))
  )

  (:action stay-vienna
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at vienna ?d1) (next ?d1 ?d2))
    :effect (and (at vienna ?d2))
  )

  (:action stay-lyon
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at lyon ?d1) (next ?d1 ?d2))
    :effect (and (at lyon ?d2))
  )

  ;; Flight actions: only the allowed direct connections
  (:action fly-copenhagen-to-vienna
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at copenhagen ?d1) (next ?d1 ?d2))
    :effect (and (at vienna ?d2))
  )

  (:action fly-vienna-to-copenhagen
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at vienna ?d1) (next ?d1 ?d2))
    :effect (and (at copenhagen ?d2))
  )

  (:action fly-vienna-to-lyon
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at vienna ?d1) (next ?d1 ?d2))
    :effect (and (at lyon ?d2))
  )

  (:action fly-lyon-to-vienna
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at lyon ?d1) (next ?d1 ?d2))
    :effect (and (at vienna ?d2))
  )

  ;; Event actions: attending the required conference in Copenhagen.
  ;; Attending consumes the day (advances one day) and records attendance for that day.
  (:action attend-conference-copenhagen
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at copenhagen ?d1) (next ?d1 ?d2))
    :effect (and (at copenhagen ?d2) (attended-conference ?d1))
  )
)