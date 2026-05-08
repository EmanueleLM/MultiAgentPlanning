(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time meeting_stage)
  (:predicates
    (agent_at ?l - location)
    (current_time ?t - time)
    (next_time ?t1 ?t2 - time)
    (travel_time ?l1 ?l2 - location ?t1 ?t2 - time)
    (jessica_at ?l - location ?t - time)
    (meeting_progress ?ms - meeting_stage)
    (next_stage ?ms1 ?ms2 - meeting_stage)
  )

  (:action move
    :parameters (?from ?to - location ?t1 ?t2 - time)
    :precondition (and
      (agent_at ?from)
      (current_time ?t1)
      (travel_time ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (agent_at ?from))
      (agent_at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action wait
    :parameters (?l - location ?t1 ?t2 - time)
    :precondition (and
      (agent_at ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet
    :parameters (?l - location ?t1 ?t2 - time ?s1 ?s2 - meeting_stage)
    :precondition (and
      (agent_at ?l)
      (current_time ?t1)
      (jessica_at ?l ?t1)
      (next_time ?t1 ?t2)
      (meeting_progress ?s1)
      (next_stage ?s1 ?s2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_progress ?s1))
      (meeting_progress ?s2)
    )
  )
)