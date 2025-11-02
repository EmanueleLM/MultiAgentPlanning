(define (domain integrated-travel)
  (:requirements :typing :disjunctive-preconditions :equality :conditional-effects :negative-preconditions :fluents :action-costs)
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

    ;; symbolic counters for days spent in Amsterdam (exactly one of these should hold)
    (ams_count_0) (ams_count_1) (ams_count_2) (ams_count_3) (ams_count_4) (ams_count_5)
  )

  (:functions
    (total-cost)
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

      ;; conditional symbolic increment for Amsterdam-day counter when staying in Amsterdam
      (when (and (= ?c amsterdam) (ams_count_0)) (and (ams_count_1) (not (ams_count_0))))
      (when (and (= ?c amsterdam) (ams_count_1)) (and (ams_count_2) (not (ams_count_1))))
      (when (and (= ?c amsterdam) (ams_count_2)) (and (ams_count_3) (not (ams_count_2))))
      (when (and (= ?c amsterdam) (ams_count_3)) (and (ams_count_4) (not (ams_count_3))))
      (when (and (= ?c amsterdam) (ams_count_4)) (and (ams_count_5) (not (ams_count_4))))
      ;; if already ams_count_5 and staying in Amsterdam, keep it (no change)

      ;; cost: each day assignment/stay consumes one unit of cost
      (increase (total-cost) 1)
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

      ;; conditional symbolic increment for Amsterdam-day counter when arriving in Amsterdam
      (when (and (= ?to amsterdam) (ams_count_0)) (and (ams_count_1) (not (ams_count_0))))
      (when (and (= ?to amsterdam) (ams_count_1)) (and (ams_count_2) (not (ams_count_1))))
      (when (and (= ?to amsterdam) (ams_count_2)) (and (ams_count_3) (not (ams_count_2))))
      (when (and (= ?to amsterdam) (ams_count_3)) (and (ams_count_4) (not (ams_count_3))))
      (when (and (= ?to amsterdam) (ams_count_4)) (and (ams_count_5) (not (ams_count_4))))
      ;; if already ams_count_5 and flying to Amsterdam, keep it (no change)

      ;; cost: flying consumes one day unit (counts toward total-cost)
      (increase (total-cost) 1)
    )
  )

  ;; Meet friend in Tallinn on an allowed day
  (:action val_meet
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (is_tallinn ?c) (meet_allowed ?d))
    :effect (and
      (metfriend)
      ;; meeting considered zero extra cost beyond being on that day
    )
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

      ;; conditional symbolic increment for Amsterdam-day counter when starting in Amsterdam
      (when (and (= ?c amsterdam) (ams_count_0)) (and (ams_count_1) (not (ams_count_0))))
      (when (and (= ?c amsterdam) (ams_count_1)) (and (ams_count_2) (not (ams_count_1))))
      (when (and (= ?c amsterdam) (ams_count_2)) (and (ams_count_3) (not (ams_count_2))))
      (when (and (= ?c amsterdam) (ams_count_3)) (and (ams_count_4) (not (ams_count_3))))
      (when (and (= ?c amsterdam) (ams_count_4)) (and (ams_count_5) (not (ams_count_4))))

      ;; starting day considered zero cost
    )
  )

  ;; Advance from day d to next day d2, either staying or flying directly (assigns d2)
  (:action ams_advance_day
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (at ?from ?d)
      (next ?d ?d2)
      (not (assigned ?d2)
      )
      (or (= ?from ?to) (flight ?from ?to))
    )
    :effect (and
      (assigned ?d2)
      (at ?to ?d2)
      (visited ?to)

      ;; conditional symbolic increment for Amsterdam-day counter when arriving at Amsterdam
      (when (and (= ?to amsterdam) (ams_count_0)) (and (ams_count_1) (not (ams_count_0))))
      (when (and (= ?to amsterdam) (ams_count_1)) (and (ams_count_2) (not (ams_count_1))))
      (when (and (= ?to amsterdam) (ams_count_2)) (and (ams_count_3) (not (ams_count_2))))
      (when (and (= ?to amsterdam) (ams_count_3)) (and (ams_count_4) (not (ams_count_3))))
      (when (and (= ?to amsterdam) (ams_count_4)) (and (ams_count_5) (not (ams_count_4))))

      ;; cost per day advanced (stay or fly)
      (increase (total-cost) 1)
    )
  )
)