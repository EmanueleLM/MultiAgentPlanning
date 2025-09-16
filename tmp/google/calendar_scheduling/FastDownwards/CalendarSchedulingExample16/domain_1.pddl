(define (domain integrated-meeting)
  (:requirements :typing)
  (:types time-slot participant person)
  (:predicates
    (a1_busy ?p - participant ?t - time-slot)
    (a1_meeting_scheduled ?t - time-slot)

    (a2_free ?p - person ?t - time-slot)
    (a2_work_time ?t - time-slot)
    (a2_meeting_scheduled ?t - time-slot)

    (a3_available ?t - time-slot)
    (a3_meeting_at ?t - time-slot)
    (a3_meeting_scheduled)
  )

  (:action a1_schedule_meeting
    :parameters (?t - time-slot
                ?p1 - participant ?p2 - participant ?p3 - participant ?p4 - participant ?p5 - participant)
    :precondition (and
      (not (a1_busy ?p1 ?t))
      (not (a1_busy ?p2 ?t))
      (not (a1_busy ?p3 ?t))
      (not (a1_busy ?p4 ?t))
      (not (a1_busy ?p5 ?t))
    )
    :effect (a1_meeting_scheduled ?t)
  )

  (:action a2_schedule_meeting
    :parameters (?t - time-slot)
    :precondition (and
                    (a2_work_time ?t)
                    (a2_free alice ?t)
                    (a2_free bob ?t))
    :effect (and
              (a2_meeting_scheduled ?t)
              (not (a2_free alice ?t))
              (not (a2_free bob ?t)))
  )

  (:action a3_schedule_meeting
    :parameters (?t - time-slot)
    :precondition (and (a3_available ?t)
                       (not (a3_meeting_at ?t))
                       (not (a3_meeting_scheduled)))
    :effect (and (a3_meeting_at ?t)
                 (a3_meeting_scheduled)
                 (not (a3_available ?t)))
  )
)