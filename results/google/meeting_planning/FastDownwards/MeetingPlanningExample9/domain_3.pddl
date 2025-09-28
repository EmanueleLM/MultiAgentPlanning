(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions :equality :adl :action-costs)
  (:types agent location time count)

  (:predicates
    (at-time ?t - time)
    (next ?t1 - time ?t2 - time)
    (at ?a - agent ?l - location)
    (mary-available ?t - time)
    (meeting-active)
    (met-count ?c - count)
    (nextcount ?c1 - count ?c2 - count)
    (met-started-at ?t - time)
  )

  (:action travel-us-to-nh
    :parameters (?t ?t1 ?t2 ?t3 ?t4 ?t5 ?t6 ?t7 ?t8 ?t9 - time)
    :precondition (and
      (at-time ?t)
      (next ?t ?t1) (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4) (next ?t4 ?t5) (next ?t5 ?t6) (next ?t6 ?t7) (next ?t7 ?t8) (next ?t8 ?t9)
      (at visitor union-square)
      (not (meeting-active))
    )
    :effect (and
      (not (at-time ?t))
      (at-time ?t9)
      (not (at visitor union-square))
      (at visitor nob-hill)
    )
    :cost 9
  )

  (:action travel-nh-to-us
    :parameters (?t ?t1 ?t2 ?t3 ?t4 ?t5 ?t6 ?t7 - time)
    :precondition (and
      (at-time ?t)
      (next ?t ?t1) (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4) (next ?t4 ?t5) (next ?t5 ?t6) (next ?t6 ?t7)
      (at visitor nob-hill)
      (not (meeting-active))
    )
    :effect (and
      (not (at-time ?t))
      (at-time ?t7)
      (not (at visitor nob-hill))
      (at visitor union-square)
    )
    :cost 7
  )

  (:action start-meeting
    :parameters (?t - time ?loc - location)
    :precondition (and
      (at-time ?t)
      (at visitor ?loc)
      (at mary ?loc)
      (mary-available ?t)
      (not (meeting-active))
    )
    :effect (and
      (meeting-active)
      (met-started-at ?t)
      (met-count c0)
    )
    :cost 0
  )

  (:action meet-advance
    :parameters (?t ?tnext - time ?c ?cnext - count ?loc - location)
    :precondition (and
      (at-time ?t)
      (next ?t ?tnext)
      (meeting-active)
      (met-count ?c)
      (nextcount ?c ?cnext)
      (mary-available ?tnext)
      (at visitor ?loc)
      (at mary ?loc)
    )
    :effect (and
      (not (at-time ?t))
      (at-time ?tnext)
      (not (met-count ?c))
      (met-count ?cnext)
    )
    :cost -1
  )

  (:action end-meeting
    :parameters (?t - time)
    :precondition (and
      (at-time ?t)
      (meeting-active)
      (met-count c75)
      (mary-available ?t)
    )
    :effect (and
      (not (meeting-active))
      (not (met-count c75))
    )
    :cost 0
  )
)