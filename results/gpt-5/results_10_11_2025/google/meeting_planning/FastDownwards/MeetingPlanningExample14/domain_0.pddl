(define (domain schedule-mary)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)

  (:predicates
    (at ?l - location)
    (at-time ?t - time)

    ; travel modes as per graph (asymmetric)
    (r11 ?from - location ?to - location)   ; duration 11 minutes
    (r12 ?from - location ?to - location)   ; duration 12 minutes

    ; time relations explicitly enumerated in the problem
    (plus11 ?t1 - time ?t2 - time)
    (plus12 ?t1 - time ?t2 - time)
    (plus120 ?t1 - time ?t2 - time)
    (waitpair ?t1 - time ?t2 - time)

    ; meeting venue and window
    (mary-venue ?l - location)
    (mary-start ?t - time)
    (mary-end ?t - time)

    ; completion flag
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