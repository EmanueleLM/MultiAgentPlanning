(define (domain integrated-travel)
  (:requirements :typing :fluents :disjunctive-preconditions :equality :conditional-effects :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)             ; located in city on a given day
    (flight ?from ?to - city)           ; direct flight exists from -> to
    (next ?d1 ?d2 - day)                ; successor day relation
    (visited ?c - city)                 ; city has been visited at least once
    (meet_allowed ?d - day)             ; meeting allowed on this day (days 9..15)
    (is_tallinn ?c - city)              ; marks the Tallinn city constant
    (metfriend)                         ; friend has been met in Tallinn (goal)
    (assigned ?d - day)                 ; day ?d location has been assigned (schedule)
  )

  (:functions
    (amsterdam-days)                    ; numeric counter of days spent in Amsterdam
  )

  ;; ------- Actions from the Valencia agent (prefixed val_) -------
  ;; Stay in the same city from day d to its successor d2 (assigns d2)
  (:action val_stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2) (not (assigned ?d2)))
    :effect (and
      (assigned ?d2)
      (at ?c ?d2)
      (visited ?c)
      (when (= ?c amsterdam) (increase (amsterdam-days) 1))
    )
  )

  ;; Fly on a direct flight from city 'from' on day d to 'to' on day d2
  (:action val_fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (flight ?from ?to) (next ?d ?d2) (not (assigned ?d2)))
    :effect (and
      (assigned ?d2)
      (at ?to ?d2)
      (visited ?to)
      (when (= ?to amsterdam) (increase (amsterdam-days) 1))
    )
  )

  ;; Meet friend in Tallinn on an allowed day
  (:action val_meet
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (is_tallinn ?c) (meet_allowed ?d))
    :effect (metfriend)
  )

  ;; ------- Actions from the Amsterdam agent (prefixed ams_) -------
  ;; Alternative initializer for day1 (kept distinct; will be disabled by init if day1 already assigned)
  (:action ams_start_day1
    :parameters (?c - city)
    :precondition (not (assigned day1))
    :effect (and
      (assigned day1)
      (at ?c day1)
      (visited ?c)
      (when (= ?c amsterdam) (increase (amsterdam-days) 1))
    )
  )

  ;; Advance from day d to next day d2, either staying or flying directly (assigns d2)
  (:action ams_advance_day
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (at ?from ?d)
      (next ?d ?d2)
      (not (assigned ?d2))
      (or (= ?from ?to) (flight ?from ?to))
    )
    :effect (and
      (assigned ?d2)
      (at ?to ?d2)
      (visited ?to)
      (when (= ?to amsterdam) (increase (amsterdam-days) 1))
    )
  )
)