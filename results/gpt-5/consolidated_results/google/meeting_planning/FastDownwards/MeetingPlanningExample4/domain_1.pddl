(define (domain meetingplanningexample4-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types time location count)
  (:predicates
    (at ?l - location)
    (at-time ?t - time)
    (next ?t1 - time ?t2 - time)       ; 5-minute successor
    (next10 ?t1 - time ?t2 - time)     ; 10-minute leap (two 5-minute steps)
    (jessica-available ?t - time)      ; Jessica present at Marina at time t
    (streak ?c - count)                ; current contiguous meeting streak in 5-min units
    (nextCount ?c1 - count ?c2 - count)
    (isC12 ?c - count)                 ; marks count representing 60 minutes (12*5)
    (achieved60)                       ; goal flag: met Jessica >= 60 contiguous minutes
  )

  (:action move-presidio-to-marina
    :parameters (?t1 - time ?t2 - time ?c - count)
    :precondition (and
      (at presidio)
      (at-time ?t1)
      (next10 ?t1 ?t2)
      (streak ?c)
    )
    :effect (and
      (not (at presidio))
      (at marina)
      (not (at-time ?t1))
      (at-time ?t2)
      (not (streak ?c))
      (streak c0)
    )
  )

  (:action move-marina-to-presidio
    :parameters (?t1 - time ?t2 - time ?c - count)
    :precondition (and
      (at marina)
      (at-time ?t1)
      (next10 ?t1 ?t2)
      (streak ?c)
    )
    :effect (and
      (not (at marina))
      (at presidio)
      (not (at-time ?t1))
      (at-time ?t2)
      (not (streak ?c))
      (streak c0)
    )
  )

  (:action wait-one
    :parameters (?t1 - time ?t2 - time ?c - count)
    :precondition (and
      (at-time ?t1)
      (next ?t1 ?t2)
      (streak ?c)
    )
    :effect (and
      (not (at-time ?t1))
      (at-time ?t2)
      (not (streak ?c))
      (streak c0)
    )
  )

  (:action meet-minute
    :parameters (?t1 - time ?t2 - time ?c1 - count ?c2 - count)
    :precondition (and
      (at marina)
      (at-time ?t1)
      (next ?t1 ?t2)
      (jessica-available ?t1)
      (jessica-available ?t2)  ; ensures entire 5-min interval is within availability
      (streak ?c1)
      (nextCount ?c1 ?c2)
      (not (isC12 ?c2))        ; regular increment, not yet reaching 60 minutes
    )
    :effect (and
      (not (at-time ?t1))
      (at-time ?t2)
      (not (streak ?c1))
      (streak ?c2)
    )
  )

  (:action meet-minute-hit-60
    :parameters (?t1 - time ?t2 - time ?c1 - count ?c2 - count)
    :precondition (and
      (at marina)
      (at-time ?t1)
      (next ?t1 ?t2)
      (jessica-available ?t1)
      (jessica-available ?t2)
      (streak ?c1)
      (nextCount ?c1 ?c2)
      (isC12 ?c2)              ; this step reaches exactly 60 minutes
    )
    :effect (and
      (not (at-time ?t1))
      (at-time ?t2)
      (not (streak ?c1))
      (streak ?c2)
      (achieved60)
    )
  )
)