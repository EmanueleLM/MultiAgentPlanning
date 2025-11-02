(define (domain trip9scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types city day token)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (today ?d - day)
    (last ?d - day)
    (edge ?c1 - city ?c2 - city)
    (visited-oslo)
    (visited-dublin)
    (oslo-token ?t - token)
    (dublin-token ?t - token)
    (unused ?t - token)
    (used ?t - token)
    (start-claimed-oslo)
    (start-claimed-dublin)
  )
  (:functions (total-cost))

  ; Claim starting-day presence tokens (optional, does not advance the day)
  (:action claim-start-oslo
    :parameters (?t - token)
    :precondition (and (today d1) (at oslo d1) (oslo-token ?t) (unused ?t) (not (start-claimed-oslo)))
    :effect (and (visited-oslo) (not (unused ?t)) (used ?t) (start-claimed-oslo))
  )

  (:action claim-start-dublin
    :parameters (?t - token)
    :precondition (and (today d1) (at dublin d1) (dublin-token ?t) (unused ?t) (not (start-claimed-dublin)))
    :effect (and (visited-dublin) (not (unused ?t)) (used ?t) (start-claimed-dublin))
  )

  ; Advance within/into Oslo (free uses token, paid increases cost)
  (:action advance-stay-oslo-free
    :parameters (?d - day ?d2 - day ?t - token)
    :precondition (and (today ?d) (next ?d ?d2) (at oslo ?d) (oslo-token ?t) (unused ?t))
    :effect (and (not (today ?d)) (today ?d2) (at oslo ?d2) (visited-oslo) (not (unused ?t)) (used ?t))
  )

  (:action advance-stay-oslo-paid
    :parameters (?d - day ?d2 - day)
    :precondition (and (today ?d) (next ?d ?d2) (at oslo ?d))
    :effect (and (not (today ?d)) (today ?d2) (at oslo ?d2) (visited-oslo) (increase (total-cost) 1))
  )

  (:action advance-fly-to-oslo-free
    :parameters (?from - city ?d - day ?d2 - day ?t - token)
    :precondition (and (today ?d) (next ?d ?d2) (at ?from ?d) (edge ?from oslo) (oslo-token ?t) (unused ?t))
    :effect (and (not (today ?d)) (today ?d2) (at oslo ?d2) (visited-oslo) (not (unused ?t)) (used ?t))
  )

  (:action advance-fly-to-oslo-paid
    :parameters (?from - city ?d - day ?d2 - day)
    :precondition (and (today ?d) (next ?d ?d2) (at ?from ?d) (edge ?from oslo))
    :effect (and (not (today ?d)) (today ?d2) (at oslo ?d2) (visited-oslo) (increase (total-cost) 1))
  )

  ; Advance within/into Dublin
  (:action advance-stay-dublin-free
    :parameters (?d - day ?d2 - day ?t - token)
    :precondition (and (today ?d) (next ?d ?d2) (at dublin ?d) (dublin-token ?t) (unused ?t))
    :effect (and (not (today ?d)) (today ?d2) (at dublin ?d2) (visited-dublin) (not (unused ?t)) (used ?t))
  )

  (:action advance-stay-dublin-paid
    :parameters (?d - day ?d2 - day)
    :precondition (and (today ?d) (next ?d ?d2) (at dublin ?d))
    :effect (and (not (today ?d)) (today ?d2) (at dublin ?d2) (visited-dublin) (increase (total-cost) 1))
  )

  (:action advance-fly-to-dublin-free
    :parameters (?from - city ?d - day ?d2 - day ?t - token)
    :precondition (and (today ?d) (next ?d ?d2) (at ?from ?d) (edge ?from dublin) (dublin-token ?t) (unused ?t))
    :effect (and (not (today ?d)) (today ?d2) (at dublin ?d2) (visited-dublin) (not (unused ?t)) (used ?t))
  )

  (:action advance-fly-to-dublin-paid
    :parameters (?from - city ?d - day ?d2 - day)
    :precondition (and (today ?d) (next ?d ?d2) (at ?from ?d) (edge ?from dublin))
    :effect (and (not (today ?d)) (today ?d2) (at dublin ?d2) (visited-dublin) (increase (total-cost) 1))
  )

  ; Advance within/into Valencia (no soft preference tokens; hard days enforced in goals)
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

  ; Charge for any shortfall tokens at the trip end
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