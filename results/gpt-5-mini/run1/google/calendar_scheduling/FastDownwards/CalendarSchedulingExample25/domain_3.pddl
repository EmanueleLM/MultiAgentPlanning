(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)

  (:predicates
    (succ ?t1 - timeslot ?t2 - timeslot)
    (available ?p - person ?t - timeslot)
    (no-proposal-yet)
    (proposal ?s - timeslot ?s2 - timeslot)
    (pamela-accepted ?s - timeslot ?s2 - timeslot)
    (zachary-accepted ?s - timeslot ?s2 - timeslot)
    (meeting-scheduled)
    (attending ?p - person)
  )

  (:action propose_by_anthony
    :parameters (?s - timeslot ?s2 - timeslot)
    :precondition (and
      (no-proposal-yet)
      (succ ?s ?s2)
      (available anthony ?s)
      (available anthony ?s2)
      (not (meeting-scheduled))
    )
    :effect (and
      (not (no-proposal-yet))
      (proposal ?s ?s2)
    )
  )

  (:action accept_by_pamela
    :parameters (?s - timeslot ?s2 - timeslot)
    :precondition (and
      (proposal ?s ?s2)
      (succ ?s ?s2)
      (available pamela ?s)
      (available pamela ?s2)
      (not (meeting-scheduled))
    )
    :effect (and
      (pamela-accepted ?s ?s2)
    )
  )

  (:action accept_by_zachary
    :parameters (?s - timeslot ?s2 - timeslot)
    :precondition (and
      (proposal ?s ?s2)
      (pamela-accepted ?s ?s2)
      (succ ?s ?s2)
      (available zachary ?s)
      (available zachary ?s2)
      (not (meeting-scheduled))
    )
    :effect (and
      (zachary-accepted ?s ?s2)
    )
  )

  (:action finalize_meeting
    :parameters (?s - timeslot ?s2 - timeslot)
    :precondition (and
      (proposal ?s ?s2)
      (pamela-accepted ?s ?s2)
      (zachary-accepted ?s ?s2)
      (succ ?s ?s2)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (attending anthony)
      (attending pamela)
      (attending zachary)
    )
  )
)