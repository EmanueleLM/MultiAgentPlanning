(define (domain integrated-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :fluents :action-costs)
  (:types person slot)

  (:predicates
    (next ?s1 - slot ?s2 - slot)
    (same-slot ?s1 - slot ?s2 - slot)

    (available_p1 ?p - person ?s - slot)
    (busy_p1 ?s - slot)

    (slot_steven ?s - slot)
    (free_steven ?s - slot)
    (meeting-scheduled-steven)
    (meeting-at-steven ?s - slot)

    (available_p3 ?s - slot)
    (meeting-scheduled-p3)
    (meeting_start_p3 ?s - slot)

    (meeting_scheduled_global)
    (meeting_start_at ?s - slot)
  )

  (:functions (total-cost))

  (:action schedule_michelle
    :parameters (?start - slot ?next - slot)
    :precondition (and
      (next ?start ?next)
      (available_p1 michelle ?start)
      (available_p1 michelle ?next)
      (not (busy_p1 ?start))
      (not (busy_p1 ?next))
    )
    :effect (and
      (busy_p1 ?start)
      (busy_p1 ?next)
    )
  )

  (:action schedule_steven
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (slot_steven ?s)
      (slot_steven ?s2)
      (next ?s ?s2)
      (free_steven ?s)
      (free_steven ?s2)
      (not (meeting-scheduled-steven))
    )
    :effect (and
      (not (free_steven ?s))
      (not (free_steven ?s2))
      (meeting-scheduled-steven)
      (meeting-at-steven ?s)
    )
  )

  (:action schedule_p3
    :parameters (?t1 - slot ?t2 - slot)
    :precondition (and
      (next ?t1 ?t2)
      (available_p3 ?t1)
      (available_p3 ?t2)
      (not (meeting-scheduled-p3))
    )
    :effect (and
      (not (available_p3 ?t1))
      (not (available_p3 ?t2))
      (meeting-scheduled-p3)
      (meeting_start_p3 ?t1)
    )
  )

  (:action schedule_meeting_all_participants
    :parameters
      (?m_start - slot ?m_next - slot
       ?s_start - slot ?s_next - slot
       ?p3_start - slot ?p3_next - slot)
    :precondition (and
      (next ?m_start ?m_next)
      (next ?s_start ?s_next)
      (next ?p3_start ?p3_next)

      (same-slot ?m_start ?s_start)
      (same-slot ?m_start ?p3_start)
      (same-slot ?m_next ?s_next)
      (same-slot ?m_next ?p3_next)

      (available_p1 michelle ?m_start)
      (available_p1 michelle ?m_next)

      (free_steven ?s_start)
      (free_steven ?s_next)

      (available_p3 ?p3_start)
      (available_p3 ?p3_next)

      (not (meeting_scheduled_global))
    )
    :effect (and
      (meeting_scheduled_global)
      (meeting_start_at ?m_start)

      ;; mark michelle busy for both slots
      (busy_p1 ?m_start)
      (busy_p1 ?m_next)

      ;; mark steven's slots as no longer free and his meeting flag
      (not (free_steven ?s_start))
      (not (free_steven ?s_next))
      (meeting-scheduled-steven)
      (meeting-at-steven ?s_start)

      ;; mark p3 slots as no longer available and set his meeting flag
      (not (available_p3 ?p3_start))
      (not (available_p3 ?p3_next))
      (meeting-scheduled-p3)
      (meeting_start_p3 ?p3_start)

      ;; cost for coordinating the global meeting
      (increase (total-cost) 1)
    )
  )
)