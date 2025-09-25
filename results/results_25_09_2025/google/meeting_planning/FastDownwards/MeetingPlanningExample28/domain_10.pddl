(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions :equality :action-costs)
  (:types agent location time meetidx)
  (:constants you joshua - agent union_square chinatown - location)
  (:predicates
    (at ?a - agent ?l - location)
    (current ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (next_time7 ?t1 - time ?t2 - time)
    (time_ge1080 ?t - time)
    (time_le1289 ?t - time)
    (time_ge1290 ?t - time)
    (met ?m - meetidx)
    (next_meet ?m1 - meetidx ?m2 - meetidx)
  )

  (:action travel-you-us-to-ch
    :parameters (?t - time ?t2 - time)
    :precondition (and (at you union_square) (current ?t) (next_time7 ?t ?t2))
    :effect (and (not (at you union_square)) (at you chinatown) (not (current ?t)) (current ?t2))
    :cost 7
  )

  (:action travel-you-ch-to-us
    :parameters (?t - time ?t2 - time)
    :precondition (and (at you chinatown) (current ?t) (next_time7 ?t ?t2))
    :effect (and (not (at you chinatown)) (at you union_square) (not (current ?t)) (current ?t2))
    :cost 7
  )

  (:action you-wait-at-us
    :parameters (?t - time ?t2 - time)
    :precondition (and (at you union_square) (current ?t) (next_time ?t ?t2))
    :effect (and (not (current ?t)) (current ?t2))
    :cost 1
  )

  (:action you-wait-at-ch
    :parameters (?t - time ?t2 - time)
    :precondition (and (at you chinatown) (current ?t) (next_time ?t ?t2))
    :effect (and (not (current ?t)) (current ?t2))
    :cost 1
  )

  (:action joshua-arrive-chinatown
    :parameters (?t - time)
    :precondition (and (not (at joshua chinatown)) (current ?t) (time_ge1080 ?t))
    :effect (and (at joshua chinatown))
    :cost 0
  )

  (:action joshua-leave-chinatown
    :parameters (?t - time)
    :precondition (and (at joshua chinatown) (current ?t) (time_ge1290 ?t))
    :effect (and (not (at joshua chinatown)))
    :cost 0
  )

  (:action joshua-wait-at-ch
    :parameters (?t - time ?t2 - time)
    :precondition (and (at joshua chinatown) (current ?t) (next_time ?t ?t2))
    :effect (and (not (current ?t)) (current ?t2))
    :cost 1
  )

  (:action you-meet-with-joshua
    :parameters (?t - time ?t2 - time ?m1 - meetidx ?m2 - meetidx)
    :precondition (and
      (at you chinatown)
      (at joshua chinatown)
      (current ?t)
      (time_ge1080 ?t)
      (time_le1289 ?t)
      (met ?m1)
      (next_meet ?m1 ?m2)
      (next_time ?t ?t2)
    )
    :effect (and (not (met ?m1)) (met ?m2) (not (current ?t)) (current ?t2))
    :cost 1
  )
)