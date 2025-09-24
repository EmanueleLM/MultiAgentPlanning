(define (domain integrated-travel)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    ;; Traveler-agent predicates (day-indexed location)
    (not-started)
    (at-day ?c - city ?d - day)     ; traveler: at city on a specific day
    (used-day ?d - day)             ; traveler: day has been used in traveler's timeline
    (first ?d - day)
    (workshop-day ?d - day)         ; traveler: workshop-allowed days
    (workshop-held)                 ; traveler: workshop held flag

    ;; Flights-agent predicates (current location + day)
    (at ?c - city)                  ; flights agent: current location (no day)
    (current-day ?d - day)          ; flights agent: current day marker
    (between1and3 ?d - day)         ; flights agent: workshop time window
    (workshop-done)                 ; flights agent: workshop attended flag
    (is-prague ?c - city)           ; marks which city is Prague

    ;; Shared/static predicates
    (visited ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
  )

  ;; -----------------------
  ;; Traveler-agent actions
  ;; -----------------------

  ;; Start the traveler's timeline in some city on the designated first day.
  (:action start-in
    :parameters (?c - city ?d - day)
    :precondition (and (not-started) (first ?d))
    :effect (and
      (not (not-started))
      (at-day ?c ?d)
      (visited ?c)
      (used-day ?d)
    )
  )

  ;; Stay for the traveler from day d1 to next day d2 (day-indexed representation).
  (:action traveler-stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at-day ?c ?d1) (next ?d1 ?d2))
    :effect (and
      (not (at-day ?c ?d1))
      (at-day ?c ?d2)
      (visited ?c)
      (used-day ?d2)
    )
  )

  ;; Fly for the traveler using a direct connection (advances traveler's day index).
  (:action traveler-fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at-day ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (and
      (not (at-day ?from ?d1))
      (at-day ?to ?d2)
      (visited ?to)
      (used-day ?d2)
    )
  )

  ;; Hold the workshop in Prague according to the traveler's day-indexed location.
  (:action hold-workshop
    :parameters (?d - day)
    :precondition (and (at-day prague ?d) (workshop-day ?d))
    :effect (workshop-held)
  )

  ;; -----------------------
  ;; Flights-agent actions
  ;; -----------------------

  ;; Move using a direct flight: advances current-day and moves the flights-agent location.
  (:action move
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (current-day ?d1)
      (next ?d1 ?d2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current-day ?d1))
      (current-day ?d2)
      (visited ?to)
    )
  )

  ;; Flights-agent stays in the same city and advances current-day.
  (:action flights-stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current-day ?d1)
      (next ?d1 ?d2)
    )
    :effect (and
      (not (current-day ?d1))
      (current-day ?d2)
      (visited ?c)
    )
  )

  ;; Attend the workshop in Prague (flights-agent representation).
  (:action attend-workshop
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c)
      (current-day ?d)
      (between1and3 ?d)
      (is-prague ?c)
    )
    :effect (workshop-done)
  )
)