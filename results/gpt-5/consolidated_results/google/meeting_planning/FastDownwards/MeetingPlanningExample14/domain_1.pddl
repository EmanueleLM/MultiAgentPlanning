(define (domain meeting-planning-14)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)

  (:predicates
    ; agent state
    (at ?l - location)
    (at-time ?t - time)

    ; directed travel graph (asymmetric)
    (r11 ?from - location ?to - location)   ; 11-minute edge
    (r12 ?from - location ?to - location)   ; 12-minute edge

    ; enumerated time transitions
    (plus11 ?t1 - time ?t2 - time)          ; t2 = t1 + 11
    (plus12 ?t1 - time ?t2 - time)          ; t2 = t1 + 12
    (plus120 ?t1 - time ?t2 - time)         ; t2 = t1 + 120
    (waitpair ?t1 - time ?t2 - time)        ; allowed waiting jump

    ; Mary's venue and availability endpoints
    (mary-venue ?l - location)
    (mary-start ?t - time)
    (mary-end ?t - time)

    ; goal completion flag
    (met-mary)
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (at-time ?t1)
      (waitpair ?t1 ?t2)
    )
    :effect (and
      (not (at-time ?t1))
      (at-time ?t2)
    )
  )

  (:action move-r11
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (at-time ?t1)
      (r11 ?from ?to)
      (plus11 ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (at-time ?t1))
      (at-time ?t2)
    )
  )

  (:action move-r12
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (at-time ?t1)
      (r12 ?from ?to)
      (plus12 ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (at-time ?t1))
      (at-time ?t2)
    )
  )

  (:action meet-mary-120
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (mary-venue ?l)
      (at ?l)
      (at-time ?t1)
      (mary-start ?t1)
      (mary-end ?t2)
      (plus120 ?t1 ?t2)
      (not (met-mary))
    )
    :effect (and
      (met-mary)
      (not (at-time ?t1))
      (at-time ?t2)
    )
  )
)