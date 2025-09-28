(define (domain trip-scheduling)
  (:requirements :typing)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)                ; traveler is in city at the start of day
    (next ?d1 - day ?d2 - day)            ; discrete day successor relation
    (allowed-flight ?from - city ?to - city) ; static allowed direct flight links
    (attended ?d - day)                   ; conference attended on this day
  )

  ;; Event actions (conference attendance in Copenhagen).
  ;; Attending consumes the day (moves from day d to d2) and marks attended(d).
  (:action attend-copenhagen
    :parameters (?d - day ?d2 - day)
    :precondition (and (at copenhagen ?d) (next ?d ?d2))
    :effect (and
              (not (at copenhagen ?d))
              (at copenhagen ?d2)
              (attended ?d)
            )
  )

  ;; Stay actions for each city (consume a day and remain in same city).
  (:action stay-in-copenhagen
    :parameters (?d - day ?d2 - day)
    :precondition (and (at copenhagen ?d) (next ?d ?d2))
    :effect (and
              (not (at copenhagen ?d))
              (at copenhagen ?d2)
            )
  )

  (:action stay-in-vienna
    :parameters (?d - day ?d2 - day)
    :precondition (and (at vienna ?d) (next ?d ?d2))
    :effect (and
              (not (at vienna ?d))
              (at vienna ?d2)
            )
  )

  (:action stay-in-lyon
    :parameters (?d - day ?d2 - day)
    :precondition (and (at lyon ?d) (next ?d ?d2))
    :effect (and
              (not (at lyon ?d))
              (at lyon ?d2)
            )
  )

  ;; Flight actions — only direct allowed connections are provided and enforced
  ;; by preconditions referencing allowed-flight and the concrete city names.
  (:action fly-copenhagen-to-vienna
    :parameters (?d - day ?d2 - day)
    :precondition (and (at copenhagen ?d) (next ?d ?d2) (allowed-flight copenhagen vienna))
    :effect (and
              (not (at copenhagen ?d))
              (at vienna ?d2)
            )
  )

  (:action fly-vienna-to-copenhagen
    :parameters (?d - day ?d2 - day)
    :precondition (and (at vienna ?d) (next ?d ?d2) (allowed-flight vienna copenhagen))
    :effect (and
              (not (at vienna ?d))
              (at copenhagen ?d2)
            )
  )

  (:action fly-vienna-to-lyon
    :parameters (?d - day ?d2 - day)
    :precondition (and (at vienna ?d) (next ?d ?d2) (allowed-flight vienna lyon))
    :effect (and
              (not (at vienna ?d))
              (at lyon ?d2)
            )
  )

  (:action fly-lyon-to-vienna
    :parameters (?d - day ?d2 - day)
    :precondition (and (at lyon ?d) (next ?d ?d2) (allowed-flight lyon vienna))
    :effect (and
              (not (at lyon ?d))
              (at vienna ?d2)
            )
  )
)