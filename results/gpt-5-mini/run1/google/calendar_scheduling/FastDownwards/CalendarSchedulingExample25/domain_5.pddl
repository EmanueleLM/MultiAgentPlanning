(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)

  (:constants anthony pamela zachary - person)

  (:predicates
    (succ ?t1 - timeslot ?t2 - timeslot)
    (available ?p - person ?t - timeslot)
    (no_proposal_yet)
    (proposal ?s - timeslot ?s2 - timeslot)
    (pamela_accepted ?s - timeslot ?s2 - timeslot)
    (zachary_accepted ?s - timeslot ?s2 - timeslot)
    (meeting_scheduled)
    (attending ?p - person)
  )

  (:action propose_by_anthony
    :parameters (?s - timeslot ?s2 - timeslot)
    :precondition (and
      (no_proposal_yet)
      (succ ?s ?s2)
      (available anthony ?s)
      (available anthony ?s2)
      (not (meeting_scheduled))
    )
    :effect (and
      (not (no_proposal_yet))
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
      (not (meeting_scheduled))
    )
    :effect (and
      (pamela_accepted ?s ?s2)
    )
  )

  (:action accept_by_zachary
    :parameters (?s - timeslot ?s2 - timeslot)
    :precondition (and
      (proposal ?s ?s2)
      (pamela_accepted ?s ?s2)
      (succ ?s ?s2)
      (available zachary ?s)
      (available zachary ?s2)
      (not (meeting_scheduled))
    )
    :effect (and
      (zachary_accepted ?s ?s2)
    )
  )

  (:action finalize_meeting
    :parameters (?s - timeslot ?s2 - timeslot)
    :precondition (and
      (proposal ?s ?s2)
      (pamela_accepted ?s ?s2)
      (zachary_accepted ?s ?s2)
      (succ ?s ?s2)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (attending anthony)
      (attending pamela)
      (attending zachary)
    )
  )
)