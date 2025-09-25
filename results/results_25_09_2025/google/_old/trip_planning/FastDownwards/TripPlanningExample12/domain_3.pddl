(define (domain integrated-travel)
  (:requirements :typing :disjunctive-preconditions :equality :conditional-effects :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (visited ?c - city)
    (meet_allowed ?d - day)
    (is_tallinn ?c - city)
    (is_amsterdam ?c - city)
    (metfriend)
    (assigned ?d - day)
    (ams_count_0) (ams_count_1) (ams_count_2) (ams_count_3) (ams_count_4) (ams_count_5)
  )

  (:action val_stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2) (not (assigned ?d2)))
    :effect (and
      (assigned ?d2)
      (at ?c ?d2)
      (visited ?c)
      (when (and (is_amsterdam ?c) (ams_count_0)) (and (ams_count_1) (not (ams_count_0))))
      (when (and (is_amsterdam ?c) (ams_count_1)) (and (ams_count_2) (not (ams_count_1))))
      (when (and (is_amsterdam ?c) (ams_count_2)) (and (ams_count_3) (not (ams_count_2))))
      (when (and (is_amsterdam ?c) (ams_count_3)) (and (ams_count_4) (not (ams_count_3))))
      (when (and (is_amsterdam ?c) (ams_count_4)) (and (ams_count_5) (not (ams_count_4))))
    )
  )

  (:action val_fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (flight ?from ?to) (next ?d ?d2) (not (assigned ?d2)))
    :effect (and
      (assigned ?d2)
      (at ?to ?d2)
      (visited ?to)
      (when (and (is_amsterdam ?to) (ams_count_0)) (and (ams_count_1) (not (ams_count_0))))
      (when (and (is_amsterdam ?to) (ams_count_1)) (and (ams_count_2) (not (ams_count_1))))
      (when (and (is_amsterdam ?to) (ams_count_2)) (and (ams_count_3) (not (ams_count_2))))
      (when (and (is_amsterdam ?to) (ams_count_3)) (and (ams_count_4) (not (ams_count_3))))
      (when (and (is_amsterdam ?to) (ams_count_4)) (and (ams_count_5) (not (ams_count_4))))
    )
  )

  (:action val_meet
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (is_tallinn ?c) (meet_allowed ?d))
    :effect (and
      (metfriend)
    )
  )

  (:action ams_start
    :parameters (?d - day ?c - city)
    :precondition (not (assigned ?d))
    :effect (and
      (assigned ?d)
      (at ?c ?d)
      (visited ?c)
      (when (and (is_amsterdam ?c) (ams_count_0)) (and (ams_count_1) (not (ams_count_0))))
      (when (and (is_amsterdam ?c) (ams_count_1)) (and (ams_count_2) (not (ams_count_1))))
      (when (and (is_amsterdam ?c) (ams_count_2)) (and (ams_count_3) (not (ams_count_2))))
      (when (and (is_amsterdam ?c) (ams_count_3)) (and (ams_count_4) (not (ams_count_3))))
      (when (and (is_amsterdam ?c) (ams_count_4)) (and (ams_count_5) (not (ams_count_4))))
    )
  )

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
      (when (and (is_amsterdam ?to) (ams_count_0)) (and (ams_count_1) (not (ams_count_0))))
      (when (and (is_amsterdam ?to) (ams_count_1)) (and (ams_count_2) (not (ams_count_1))))
      (when (and (is_amsterdam ?to) (ams_count_2)) (and (ams_count_3) (not (ams_count_2))))
      (when (and (is_amsterdam ?to) (ams_count_3)) (and (ams_count_4) (not (ams_count_3))))
      (when (and (is_amsterdam ?to) (ams_count_4)) (and (ams_count_5) (not (ams_count_4))))
    )
  )
)