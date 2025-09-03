(define (domain integrated-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs :equality)
  (:types person slot)

  (:constants michelle steven jerry - person)

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

  (:action schedule_michelle
    :parameters (?start - slot ?next - slot)
    :precondition (and
      (next ?start ?next)
      (available michelle ?start)
      (available michelle ?next)
      (not (busy michelle ?start))
      (not (busy michelle ?next))
      (not (meeting_scheduled michelle))
    )
    :effect (and
      (busy michelle ?start)
      (busy michelle ?next)
      (meeting_scheduled michelle)
      (meeting_start michelle ?start)
    )
    :cost 1
  )

  (:action schedule_steven
    :parameters (?start - slot ?next - slot)
    :precondition (and
      (next ?start ?next)
      (available steven ?start)
      (available steven ?next)
      (not (busy steven ?start))
      (not (busy steven ?next))
      (not (meeting_scheduled steven))
    )
    :effect (and
      (busy steven ?start)
      (busy steven ?next)
      (meeting_scheduled steven)
      (meeting_start steven ?start)
    )
    :cost 1
  )

  (:action schedule_jerry
    :parameters (?start - slot ?next - slot)
    :precondition (and
      (next ?start ?next)
      (available jerry ?start)
      (available jerry ?next)
      (not (busy jerry ?start))
      (not (busy jerry ?next))
      (not (meeting_scheduled jerry))
    )
    :effect (and
      (busy jerry ?start)
      (busy jerry ?next)
      (meeting_scheduled jerry)
      (meeting_start jerry ?start)
    )
    :cost 1
  )

  ;; Combined instantaneous scheduling action: schedules the one-hour meeting for all three participants
  (:action schedule_meeting_michelle_steven_jerry
    :parameters
      (?m_start - slot ?m_next - slot
       ?s_start - slot ?s_next - slot
       ?j_start - slot ?j_next - slot)
    :precondition (and
      (next ?m_start ?m_next)
      (next ?s_start ?s_next)
      (next ?j_start ?j_next)

      (same-slot ?m_start ?s_start)
      (same-slot ?m_start ?j_start)
      (same-slot ?m_next ?s_next)
      (same-slot ?m_next ?j_next)

      (available michelle ?m_start)
      (available michelle ?m_next)

      (available steven ?s_start)
      (available steven ?s_next)

      (available jerry ?j_start)
      (available jerry ?j_next)

      (not (busy michelle ?m_start))
      (not (busy michelle ?m_next))
      (not (busy steven ?s_start))
      (not (busy steven ?s_next))
      (not (busy jerry ?j_start))
      (not (busy jerry ?j_next))

      (not (meeting_scheduled michelle))
      (not (meeting_scheduled steven))
      (not (meeting_scheduled jerry))

      (not (meeting_scheduled_global))
    )
    :effect (and
      (meeting_scheduled_global)
      (meeting_start_at ?m_start)

      (busy michelle ?m_start)
      (busy michelle ?m_next)
      (meeting_scheduled michelle)
      (meeting_start michelle ?m_start)

      (busy steven ?s_start)
      (busy steven ?s_next)
      (meeting_scheduled steven)
      (meeting_start steven ?s_start)

      (busy jerry ?j_start)
      (busy jerry ?j_next)
      (meeting_scheduled jerry)
      (meeting_start jerry ?j_start)
    )
    :cost 0
  )
)