(define (domain meeting_scheduling)
  (:requirements :strips :typing)
  (:types person time)
  (:constants michelle steven jerry - person)
  (:predicates
    (next ?t1 ?t2 - time)
    (available ?p - person ?t - time)
    (meeting_scheduled)
  )

  (:action schedule_one_hour_meeting
    :parameters (?t_start - time ?t_mid - time ?t_end - time)
    :precondition (and
      (next ?t_start ?t_mid)
      (next ?t_mid ?t_end)
      (available michelle ?t_start)
      (available michelle ?t_mid)
      (available steven ?t_start)
      (available steven ?t_mid)
      (available jerry ?t_start)
      (available jerry ?t_mid)
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)