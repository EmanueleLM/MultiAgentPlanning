(define (domain integrated-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types person slot)

  (:predicates
    (next ?s1 - slot ?s2 - slot)
    (same-slot ?s1 - slot ?s2 - slot)

    (available ?p - person ?s - slot)
    (busy ?p - person ?s - slot)

    (meeting_scheduled ?p - person)
    (meeting_start ?p - person ?s - slot)

    (meeting_scheduled_global)
    (meeting_start_at ?s - slot)
  )

  (:action schedule_person
    :parameters (?p - person ?start - slot ?next - slot)
    :cost 0
    :precondition (and
      (next ?start ?next)
      (available ?p ?start)
      (available ?p ?next)
      (not (busy ?p ?start))
      (not (busy ?p ?next))
      (not (meeting_scheduled ?p))
    )
    :effect (and
      (busy ?p ?start)
      (busy ?p ?next)
      (meeting_scheduled ?p)
      (meeting_start ?p ?start)
    )
  )

  (:action schedule_meeting_all_participants
    :parameters
      (?p1 - person ?p2 - person ?p3 - person
       ?m_start - slot ?m_next - slot
       ?s_start - slot ?s_next - slot
       ?p3_start - slot ?p3_next - slot)
    :cost 1
    :precondition (and
      (next ?m_start ?m_next)
      (next ?s_start ?s_next)
      (next ?p3_start ?p3_next)

      (same-slot ?m_start ?s_start)
      (same-slot ?m_start ?p3_start)
      (same-slot ?m_next ?s_next)
      (same-slot ?m_next ?p3_next)

      (available ?p1 ?m_start)
      (available ?p1 ?m_next)

      (available ?p2 ?s_start)
      (available ?p2 ?s_next)

      (available ?p3 ?p3_start)
      (available ?p3 ?p3_next)

      (not (meeting_scheduled_global))
    )
    :effect (and
      (meeting_scheduled_global)
      (meeting_start_at ?m_start)

      (busy ?p1 ?m_start)
      (busy ?p1 ?m_next)
      (meeting_scheduled ?p1)
      (meeting_start ?p1 ?m_start)

      (busy ?p2 ?s_start)
      (busy ?p2 ?s_next)
      (meeting_scheduled ?p2)
      (meeting_start ?p2 ?s_start)

      (busy ?p3 ?p3_start)
      (busy ?p3 ?p3_next)
      (meeting_scheduled ?p3)
      (meeting_start ?p3 ?p3_start)
    )
  )
)