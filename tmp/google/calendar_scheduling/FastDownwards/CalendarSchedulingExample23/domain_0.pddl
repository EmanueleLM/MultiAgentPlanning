(define (domain multi-agent-meeting-scheduling)
  (:requirements :typing :adl)
  (:types slot start)

  (:predicates
    ;; time topology
    (next ?s1 - slot ?s2 - slot)

    ;; per-agent availability predicates (keeps agents' calendars distinct)
    (free-billy ?s - slot)
    (free-maria ?s - slot)
    (free-william ?s - slot)

    ;; global / coordination predicates
    (meeting-scheduled)

    ;; maria's internal bookkeeping
    (unscheduled)

    ;; maria records meeting start; william records scheduled start
    (meeting-start ?s - slot)
    (scheduled ?st - start)

    ;; william's mapping from start to two consecutive slots
    (uses ?st - start ?s1 - slot ?s2 - slot)
  )

  ;; Billy's scheduling action (keeps action distinct)
  (:action schedule-billy
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      ;; require the two slots to be free in all agents' calendars
      (free-billy ?s1) (free-billy ?s2)
      (free-maria ?s1) (free-maria ?s2)
      (free-william ?s1) (free-william ?s2)
      ;; Billy's original domain did not require an "unscheduled" flag,
      ;; so no unscheduled precondition here.
    )
    :effect (and
      (meeting-scheduled)
      ;; occupy the slots in everyone's calendars
      (not (free-billy ?s1)) (not (free-billy ?s2))
      (not (free-maria ?s1)) (not (free-maria ?s2))
      (not (free-william ?s1)) (not (free-william ?s2))
    )
  )

  ;; Maria's scheduling action (keeps action distinct)
  (:action schedule-maria
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (unscheduled)            ; maria's original requirement
      (next ?s1 ?s2)
      ;; require free in all calendars
      (free-maria ?s1) (free-maria ?s2)
      (free-billy ?s1) (free-billy ?s2)
      (free-william ?s1) (free-william ?s2)
    )
    :effect (and
      (not (unscheduled))
      (meeting-scheduled)
      (meeting-start ?s1)
      ;; occupy the slots in everyone's calendars
      (not (free-maria ?s1)) (not (free-maria ?s2))
      (not (free-billy ?s1)) (not (free-billy ?s2))
      (not (free-william ?s1)) (not (free-william ?s2))
    )
  )

  ;; William's scheduling action (keeps action distinct)
  (:action schedule-william
    :parameters (?st - start ?s1 - slot ?s2 - slot)
    :precondition (and
      (uses ?st ?s1 ?s2)
      ;; require free in william's calendar and in others to ensure meeting fits everyone's calendars
      (free-william ?s1) (free-william ?s2)
      (free-billy ?s1) (free-billy ?s2)
      (free-maria ?s1) (free-maria ?s2)
    )
    :effect (and
      (scheduled ?st)
      (meeting-scheduled)
      ;; occupy the slots in everyone's calendars
      (not (free-william ?s1)) (not (free-william ?s2))
      (not (free-billy ?s1)) (not (free-billy ?s2))
      (not (free-maria ?s1)) (not (free-maria ?s2))
    )
  )
)