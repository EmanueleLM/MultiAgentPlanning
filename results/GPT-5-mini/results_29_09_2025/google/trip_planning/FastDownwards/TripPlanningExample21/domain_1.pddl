(define (domain trip-planning)
  (:requirements :typing :adl :negative-preconditions :disjunctive-preconditions :existential-preconditions :universal-preconditions :quantified-preconditions :conditional-effects :fluents :equality)
  (:types city day)

  (:predicates
    (in ?c - city ?d - day)
    (flight ?c1 - city ?c2 - city)
    (prev ?d1 - day ?d2 - day)
    (is-venice ?c - city)
    (is-workshop-day ?d - day)
    (workshop-attended)
  )

  (:functions
    (allocated-days ?c - city)
    (required-days ?c - city)
    (total-allocated)
  )

  (:action start-in
    :parameters (?c - city ?d - day)
    :precondition (and
      (= ?d d1)
      (not (exists (?other - city) (in ?other ?d)))
    )
    :effect (and
      (in ?c ?d)
      (increase (allocated-days ?c) 1)
      (increase (total-allocated) 1)
      (when (and (is-workshop-day ?d) (is-venice ?c)) (workshop-attended))
    )
  )

  (:action occupy
    :parameters (?c - city ?d - day ?cprev - city ?dprev - day)
    :precondition (and
      (prev ?dprev ?d)
      (in ?cprev ?dprev)
      (not (exists (?other - city) (in ?other ?d)))
      (or (= ?cprev ?c) (flight ?cprev ?c))
    )
    :effect (and
      (in ?c ?d)
      (increase (allocated-days ?c) 1)
      (increase (total-allocated) 1)
      (when (and (is-workshop-day ?d) (is-venice ?c)) (workshop-attended))
    )
  )

  (:action reduce-required
    :parameters (?c - city)
    :precondition (>= (required-days ?c) 1)
    :effect (decrease (required-days ?c) 1)
  )
)