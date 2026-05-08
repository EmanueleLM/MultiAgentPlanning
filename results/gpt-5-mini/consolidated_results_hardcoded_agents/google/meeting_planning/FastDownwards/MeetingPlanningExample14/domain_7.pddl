(define (domain meeting-schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)

  (:predicates
    (at ?loc - location ?t - time)
    (edge11 ?from - location ?to - location)  ; Nob Hill -> Marina (11 minutes)
    (edge12 ?from - location ?to - location)  ; Marina -> Nob Hill (12 minutes)
    (succ ?t1 - time ?t2 - time)              ; immediate successor stage
    (dur-wait ?t1 - time ?t2 - time)         ; allowed wait interval
    (dur-move11 ?t1 - time ?t2 - time)       ; allowed move interval for 11-min edge
    (dur-move12 ?t1 - time ?t2 - time)       ; allowed move interval for 12-min edge
    (dur-meet ?t1 - time ?t2 - time)         ; allowed contiguous meeting interval
    (mary-at ?loc - location ?t1 - time ?t2 - time) ; Mary's availability interval
    (met-mary)
  )

  (:action wait
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?loc ?t1)
      (dur-wait ?t1 ?t2)
      (succ ?t1 ?t2)
    )
    :effect (and
      (not (at ?loc ?t1))
      (at ?loc ?t2)
    )
  )

  (:action move-11
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from ?t1)
      (edge11 ?from ?to)
      (dur-move11 ?t1 ?t2)
      (succ ?t1 ?t2)
    )
    :effect (and
      (not (at ?from ?t1))
      (at ?to ?t2)
    )
  )

  (:action move-12
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from ?t1)
      (edge12 ?from ?to)
      (dur-move12 ?t1 ?t2)
      (succ ?t1 ?t2)
    )
    :effect (and
      (not (at ?from ?t1))
      (at ?to ?t2)
    )
  )

  (:action meet-mary
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?loc ?t1)
      (dur-meet ?t1 ?t2)
      (succ ?t1 ?t2)
      (mary-at ?loc ?t1 ?t2)
    )
    :effect (and
      (not (at ?loc ?t1))
      (at ?loc ?t2)
      (met-mary)
    )
  )
)