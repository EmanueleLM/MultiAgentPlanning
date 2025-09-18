(define (domain integrated-meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types participant hour slot time meeting)

  (:predicates
    (agent1_free ?p - participant ?h - hour)
    (scheduled_by_agent1 ?h - hour)

    (agent2_free ?p - participant ?s - slot)
    (next ?s - slot ?s2 - slot)
    (scheduled_by_agent2 ?s - slot)

    (agent3_available ?p - participant ?t - time)
    (unscheduled ?m - meeting)
    (scheduled_by_agent3 ?m - meeting ?t - time)

    (hour_slots ?h - hour ?s1 - slot ?s2 - slot)
    (hour_time ?h - hour ?t - time)

    (unified_free ?p - participant ?h - hour)

    (meeting_planned)
  )

  (:action schedule_by_agent1
    :parameters (?h - hour ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (agent1_free ?p1 ?h) (agent1_free ?p2 ?h) (agent1_free ?p3 ?h)
      (unified_free ?p1 ?h) (unified_free ?p2 ?h) (unified_free ?p3 ?h)
    )
    :effect (and
      (meeting_planned)
      (scheduled_by_agent1 ?h)
      (not (unified_free ?p1 ?h)) (not (unified_free ?p2 ?h)) (not (unified_free ?p3 ?h))
      (not (agent1_free ?p1 ?h)) (not (agent1_free ?p2 ?h)) (not (agent1_free ?p3 ?h))
    )
  )

  (:action schedule_by_agent2
    :parameters (?s1 - slot ?s2 - slot ?h - hour ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (next ?s1 ?s2)
      (hour_slots ?h ?s1 ?s2)
      (agent2_free ?p1 ?s1) (agent2_free ?p1 ?s2)
      (agent2_free ?p2 ?s1) (agent2_free ?p2 ?s2)
      (agent2_free ?p3 ?s1) (agent2_free ?p3 ?s2)
      (unified_free ?p1 ?h) (unified_free ?p2 ?h) (unified_free ?p3 ?h)
    )
    :effect (and
      (meeting_planned)
      (scheduled_by_agent2 ?s1)
      (not (agent2_free ?p1 ?s1)) (not (agent2_free ?p1 ?s2))
      (not (agent2_free ?p2 ?s1)) (not (agent2_free ?p2 ?s2))
      (not (agent2_free ?p3 ?s1)) (not (agent2_free ?p3 ?s2))
      (not (unified_free ?p1 ?h)) (not (unified_free ?p2 ?h)) (not (unified_free ?p3 ?h))
    )
  )

  (:action schedule_by_agent3
    :parameters (?m - meeting ?h - hour ?t - time ?s1 - slot ?s2 - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (unscheduled ?m)
      (hour_time ?h ?t)
      (hour_slots ?h ?s1 ?s2)
      (agent3_available ?p1 ?t) (agent3_available ?p2 ?t) (agent3_available ?p3 ?t)
      (unified_free ?p1 ?h) (unified_free ?p2 ?h) (unified_free ?p3 ?h)
    )
    :effect (and
      (meeting_planned)
      (scheduled_by_agent3 ?m ?t)
      (not (unscheduled ?m))
      (not (agent3_available ?p1 ?t)) (not (agent3_available ?p2 ?t)) (not (agent3_available ?p3 ?t))
      (not (unified_free ?p1 ?h)) (not (unified_free ?p2 ?h)) (not (unified_free ?p3 ?h))
    )
  )
)