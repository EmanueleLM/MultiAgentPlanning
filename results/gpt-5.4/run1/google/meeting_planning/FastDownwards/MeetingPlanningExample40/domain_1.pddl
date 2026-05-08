(define (domain meet_deborah_san_francisco)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    friend
    timepoint
    meet_stage
  )

  (:predicates
    (at ?l - location)
    (current ?t - timepoint)
    (next ?t1 - timepoint ?t2 - timepoint)
    (next2 ?t1 - timepoint ?t3 - timepoint)
    (connected ?from - location ?to - location)
    (friend_at ?f - friend ?l - location)
    (available ?f - friend ?t - timepoint)
    (meeting ?f - friend)
    (meet_progress ?s - meet_stage)
    (stage_next ?s1 - meet_stage ?s2 - meet_stage)
  )

  (:action wait_one_step
    :parameters (?t1 - timepoint ?t2 - timepoint ?f - friend)
    :precondition (and
      (current ?t1)
      (next ?t1 ?t2)
      (not (meeting ?f))
    )
    :effect (and
      (not (current ?t1))
      (current ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - timepoint ?t3 - timepoint ?f - friend)
    :precondition (and
      (at ?from)
      (connected ?from ?to)
      (current ?t1)
      (next2 ?t1 ?t3)
      (not (meeting ?f))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current ?t1))
      (current ?t3)
    )
  )

  (:action start_meeting_step
    :parameters (?f - friend ?l - location ?s1 - meet_stage ?s2 - meet_stage ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (current ?t1)
      (next ?t1 ?t2)
      (at ?l)
      (friend_at ?f ?l)
      (available ?f ?t1)
      (meet_progress ?s1)
      (stage_next ?s1 ?s2)
      (not (meeting ?f))
    )
    :effect (and
      (meeting ?f)
      (not (meet_progress ?s1))
      (meet_progress ?s2)
      (not (current ?t1))
      (current ?t2)
    )
  )

  (:action continue_meeting_step
    :parameters (?f - friend ?l - location ?from_stage - meet_stage ?to_stage - meet_stage ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (current ?t1)
      (next ?t1 ?t2)
      (at ?l)
      (friend_at ?f ?l)
      (available ?f ?t1)
      (meeting ?f)
      (meet_progress ?from_stage)
      (stage_next ?from_stage ?to_stage)
    )
    :effect (and
      (not (meet_progress ?from_stage))
      (meet_progress ?to_stage)
      (not (current ?t1))
      (current ?t2)
    )
  )
)