(define (domain schedule_meeting_monday)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timepoint
    start_time
  )

  (:constants
    david debra kevin - participant
  )

  (:predicates
    (busy ?p - participant ?t1 - timepoint ?t2 - timepoint)
    (next_time ?t1 - timepoint ?t2 - timepoint)
    (start_first ?s - start_time ?t - timepoint)
    (start_second ?s - start_time ?t - timepoint)
    (scheduled ?s - start_time)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?s - start_time ?t1 - timepoint ?t2 - timepoint ?t3 - timepoint)
    :precondition (and
      (not (meeting_scheduled))
      (start_first ?s ?t1)
      (start_second ?s ?t2)
      (next_time ?t1 ?t2)
      (next_time ?t2 ?t3)
      (not (busy david ?t1 ?t2))
      (not (busy debra ?t1 ?t2))
      (not (busy kevin ?t1 ?t2))
      (not (busy david ?t2 ?t3))
      (not (busy debra ?t2 ?t3))
      (not (busy kevin ?t2 ?t3))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled ?s)
    )
  )
)