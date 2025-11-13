(define (domain meetingplanningexample11)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location person slot)
  (:predicates
    (time ?t - slot)
    (next ?t1 - slot ?t2 - slot)
    (at ?l - location)
    (available ?p - person ?t - slot)
    (meet-loc ?p - person ?l - location)
    (road ?from - location ?to - location)
    (meeting-stage0)
    (meeting-stage1)
    (meeting-stage2)
    (meeting-complete)
    (in_meeting)
  )
  (:functions
    (total-cost)
    (tt ?from - location ?to - location)
  )

  (:action wait
    :parameters (?t - slot ?t2 - slot)
    :precondition (and (time ?t) (next ?t ?t2) (not (in_meeting)))
    :effect (and (not (time ?t)) (time ?t2))
  )

  (:action travel
    :parameters (?from - location ?to - location ?t - slot ?t2 - slot)
    :precondition (and
      (time ?t) (next ?t ?t2)
      (at ?from)
      (road ?from ?to)
      (not (in_meeting))
    )
    :effect (and
      (not (time ?t)) (time ?t2)
      (not (at ?from)) (at ?to)
      (increase (total-cost) (tt ?from ?to))
    )
  )

  (:action start_meeting
    :parameters (?p - person ?l - location ?t - slot ?t2 - slot)
    :precondition (and
      (time ?t) (next ?t ?t2)
      (at ?l)
      (meet-loc ?p ?l)
      (available ?p ?t)
      (meeting-stage0)
      (not (in_meeting))
    )
    :effect (and
      (not (time ?t)) (time ?t2)
      (not (meeting-stage0))
      (meeting-stage1)
      (in_meeting)
    )
  )

  (:action continue_meeting_1
    :parameters (?p - person ?l - location ?t - slot ?t2 - slot)
    :precondition (and
      (time ?t) (next ?t ?t2)
      (at ?l)
      (meet-loc ?p ?l)
      (available ?p ?t)
      (meeting-stage1)
      (in_meeting)
    )
    :effect (and
      (not (time ?t)) (time ?t2)
      (not (meeting-stage1))
      (meeting-stage2)
    )
  )

  (:action continue_meeting_2
    :parameters (?p - person ?l - location ?t - slot ?t2 - slot)
    :precondition (and
      (time ?t) (next ?t ?t2)
      (at ?l)
      (meet-loc ?p ?l)
      (available ?p ?t)
      (meeting-stage2)
      (in_meeting)
    )
    :effect (and
      (not (time ?t)) (time ?t2)
      (not (meeting-stage2))
      (meeting-complete)
      (not (in_meeting))
    )
  )
)