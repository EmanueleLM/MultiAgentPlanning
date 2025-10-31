(define (domain TripPlanning)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types city day token)
  (:predicates
    (day-available ?d - day)
    (prev-done ?d - day)
    (next ?d1 - day ?d2 - day)
    (stayed ?d - day)
    (visited ?c - city ?d - day)
    (current-location ?c - city)
    (start-unset)
    (adjacent ?c1 - city ?c2 - city)
    (pref-token ?t - token ?c - city)
  )
  (:functions (total-cost))

  (:action start
    :parameters (?c - city)
    :precondition (start-unset)
    :effect (and (not (start-unset)) (current-location ?c))
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and (adjacent ?from ?to) (current-location ?from))
    :effect (and (not (current-location ?from)) (current-location ?to))
  )

  (:action stay-with-pref-nonlast
    :parameters (?d - day ?nd - day ?c - city ?t - token)
    :precondition (and (day-available ?d) (prev-done ?d) (current-location ?c) (pref-token ?t ?c) (next ?d ?nd))
    :effect (and
      (not (day-available ?d))
      (stayed ?d)
      (visited ?c ?d)
      (not (pref-token ?t ?c))
      (not (prev-done ?d))
      (prev-done ?nd)
    )
  )

  (:action stay-with-pref-last
    :parameters (?d - day ?c - city ?t - token)
    :precondition (and (day-available ?d) (prev-done ?d) (current-location ?c) (pref-token ?t ?c))
    :effect (and
      (not (day-available ?d))
      (stayed ?d)
      (visited ?c ?d)
      (not (pref-token ?t ?c))
      (not (prev-done ?d))
    )
  )

  (:action stay-no-pref-nonlast
    :parameters (?d - day ?nd - day ?c - city)
    :precondition (and (day-available ?d) (prev-done ?d) (current-location ?c) (next ?d ?nd))
    :effect (and
      (not (day-available ?d))
      (stayed ?d)
      (visited ?c ?d)
      (not (prev-done ?d))
      (prev-done ?nd)
      (increase (total-cost) 1)
    )
  )

  (:action stay-no-pref-last
    :parameters (?d - day ?c - city)
    :precondition (and (day-available ?d) (prev-done ?d) (current-location ?c))
    :effect (and
      (not (day-available ?d))
      (stayed ?d)
      (visited ?c ?d)
      (not (prev-done ?d))
      (increase (total-cost) 1)
    )
  )
)