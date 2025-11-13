(define (domain trip9)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types city day token)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (today ?d - day)
    (last ?d - day)
    (edge ?c1 - city ?c2 - city)
    (oslo-token ?t - token)
    (dublin-token ?t - token)
    (unused ?t - token)
    (used ?t - token)
  )
  (:functions (total-cost))

  (:action advance-stay-oslo-free
    :parameters (?d - day ?d2 - day ?t - token)
    :precondition (and (today ?d) (next ?d ?d2) (at oslo ?d) (oslo-token ?t) (unused ?t))
    :effect (and (not (today ?d)) (today ?d2) (at oslo ?d2) (not (unused ?t)) (used ?t))
  )

  (:action advance-stay-oslo-paid
    :parameters (?d - day ?d2 - day)
    :precondition (and (today ?d) (next ?d ?d2) (at oslo ?d))
    :effect (and (not (today ?d)) (today ?d2) (at oslo ?d2) (increase (total-cost) 1))
  )

  (:action advance-fly-to-oslo-free
    :parameters (?from - city ?d - day ?d2 - day ?t - token)
    :precondition (and (today ?d) (next ?d ?d2) (at ?from ?d) (edge ?from oslo) (oslo-token ?t) (unused ?t))
    :effect (and (not (today ?d)) (today ?d2) (at oslo ?d2) (not (unused ?t)) (used ?t))
  )

  (:action advance-fly-to-oslo-paid
    :parameters (?from - city ?d - day ?d2 - day)
    :precondition (and (today ?d) (next ?d ?d2) (at ?from ?d) (edge ?from oslo))
    :effect (and (not (today ?d)) (today ?d2) (at oslo ?d2) (increase (total-cost) 1))
  )

  (:action advance-stay-dublin-free
    :parameters (?d - day ?d2 - day ?t - token)
    :precondition (and (today ?d) (next ?d ?d2) (at dublin ?d) (dublin-token ?t) (unused ?t))
    :effect (and (not (today ?d)) (today ?d2) (at dublin ?d2) (not (unused ?t)) (used ?t))
  )

  (:action advance-stay-dublin-paid
    :parameters (?d - day ?d2 - day)
    :precondition (and (today ?d) (next ?d ?d2) (at dublin ?d))
    :effect (and (not (today ?d)) (today ?d2) (at dublin ?d2) (increase (total-cost) 1))
  )

  (:action advance-fly-to-dublin-free
    :parameters (?from - city ?d - day ?d2 - day ?t - token)
    :precondition (and (today ?d) (next ?d ?d2) (at ?from ?d) (edge ?from dublin) (dublin-token ?t) (unused ?t))
    :effect (and (not (today ?d)) (today ?d2) (at dublin ?d2) (not (unused ?t)) (used ?t))
  )

  (:action advance-fly-to-dublin-paid
    :parameters (?from - city ?d - day ?d2 - day)
    :precondition (and (today ?d) (next ?d ?d2) (at ?from ?d) (edge ?from dublin))
    :effect (and (not (today ?d)) (today ?d2) (at dublin ?d2) (increase (total-cost) 1))
  )

  (:action advance-stay-valencia
    :parameters (?d - day ?d2 - day)
    :precondition (and (today ?d) (next ?d ?d2) (at valencia ?d))
    :effect (and (not (today ?d)) (today ?d2) (at valencia ?d2))
  )

  (:action advance-fly-to-valencia
    :parameters (?from - city ?d - day ?d2 - day)
    :precondition (and (today ?d) (next ?d ?d2) (at ?from ?d) (edge ?from valencia))
    :effect (and (not (today ?d)) (today ?d2) (at valencia ?d2))
  )

  (:action charge-unused-oslo
    :parameters (?t - token ?d - day)
    :precondition (and (today ?d) (last ?d) (oslo-token ?t) (unused ?t))
    :effect (and (not (unused ?t)) (used ?t) (increase (total-cost) 1))
  )

  (:action charge-unused-dublin
    :parameters (?t - token ?d - day)
    :precondition (and (today ?d) (last ?d) (dublin-token ?t) (unused ?t))
    :effect (and (not (unused ?t)) (used ?t) (increase (total-cost) 1))
  )
)