(define (domain integrated-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot day)
  (:predicates
    (a1_available ?p - person ?s - slot)
    (a1_slot ?s - slot)
    (a1_occupied ?s - slot)
    (a1_meeting_scheduled)
    (a2_slot_of ?s - slot ?d - day)
    (a2_work_hour ?s - slot)
    (a2_scheduled ?s - slot)
    (a2_no_meetings ?d - day)
    (a3_slot ?s - slot)
    (a3_busy ?s - slot)
    (a3_scheduled ?s - slot)
    (a3_meeting_scheduled)
    (orchestrator_confirmed ?s - slot)
  )

  (:action a1_schedule
    :parameters (?p - person ?s - slot)
    :precondition (and (a1_available ?p ?s) (a1_slot ?s))
    :effect (and
              (a1_meeting_scheduled)
              (a1_occupied ?s)
              (not (a1_available ?p ?s))
            )
  )

  (:action a2_schedule_meeting
    :parameters (?s - slot ?d - day)
    :precondition (and
                    (a2_slot_of ?s ?d)
                    (a2_work_hour ?s)
                    (not (a2_no_meetings ?d))
                    (not (a2_scheduled ?s))
                  )
    :effect (and
              (a2_scheduled ?s)
            )
  )

  (:action a3_schedule
    :parameters (?s - slot)
    :precondition (and
                    (a3_slot ?s)
                    (not (a3_busy ?s))
                    (not (a3_scheduled ?s))
                    (not (a3_meeting_scheduled))
                  )
    :effect (and
              (a3_scheduled ?s)
              (a3_meeting_scheduled)
            )
  )

  (:action orchestrator_schedule
    :parameters (?p - person ?s - slot ?d - day)
    :precondition (and
                    (a2_slot_of ?s ?d)
                    (a2_work_hour ?s)
                    (a1_available ?p ?s)
                    (a3_slot ?s)
                    (not (a3_busy ?s))
                    (not (a1_occupied ?s))
                    (not (a2_scheduled ?s))
                    (not (a3_scheduled ?s))
                    (not (a1_meeting_scheduled))
                    (not (a3_meeting_scheduled))
                  )
    :effect (and
              (a1_meeting_scheduled)
              (a1_occupied ?s)
              (not (a1_available ?p ?s))
              (a2_scheduled ?s)
              (a3_scheduled ?s)
              (a3_meeting_scheduled)
              (orchestrator_confirmed ?s)
            )
  )
)