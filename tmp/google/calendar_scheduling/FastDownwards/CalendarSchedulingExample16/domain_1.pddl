(define (domain multi_agent_scheduling)
  (:requirements :typing)
  (:types person slot meeting)

  (:predicates
    (a1_slot ?s - slot)
    (a1_free ?p - person ?s - slot)
    (a1_scheduled ?p - person ?s - slot)
    (a1_meeting_scheduled)

    (g_work_slot ?s - slot)
    (g_slot_free ?s - slot)
    (g_scheduled ?m - meeting ?s - slot)

    (c_slot ?s - slot)
    (c_work_slot ?s - slot)
    (c_busy ?s - slot)
    (c_scheduled ?s - slot)
    (c_meeting_scheduled)
  )

  (:action a1_schedule
    :parameters (?p - person ?s - slot)
    :precondition (and (a1_slot ?s) (a1_free ?p ?s))
    :effect (and (a1_scheduled ?p ?s) (a1_meeting_scheduled) (not (a1_free ?p ?s)))
  )

  (:action g_schedule
    :parameters (?m - meeting ?s - slot)
    :precondition (and (g_work_slot ?s) (g_slot_free ?s))
    :effect (and (g_scheduled ?m ?s) (not (g_slot_free ?s)))
  )

  (:action c_schedule
    :parameters (?s - slot)
    :precondition (and (c_slot ?s) (c_work_slot ?s) (not (c_busy ?s)) (not (c_scheduled ?s)))
    :effect (and (c_scheduled ?s) (c_meeting_scheduled))
  )
)