(define (domain multiagent-scheduling)
  (:requirements :typing)
  (:types start)

  (:predicates
    ;; availability facts computed from each agent's private busy intervals
    (available-billy ?s - start)
    (available-maria ?s - start)
    (available-william ?s - start)

    ;; per-agent acceptances for a proposed start time
    (accepted-billy ?s - start)
    (accepted-maria ?s - start)
    (accepted-william ?s - start)

    ;; final scheduled meeting at a chosen start
    (meeting-scheduled ?s - start)
  )

  ;; Actions are kept distinct per agent (as required).
  (:action billy-accept
    :parameters (?s - start)
    :precondition (available-billy ?s)
    :effect (accepted-billy ?s)
  )

  (:action maria-accept
    :parameters (?s - start)
    :precondition (available-maria ?s)
    :effect (accepted-maria ?s)
  )

  (:action william-accept
    :parameters (?s - start)
    :precondition (available-william ?s)
    :effect (accepted-william ?s)
  )

  ;; Orchestrator action: schedule the meeting once all participants have accepted the same start.
  (:action orchestrator-schedule
    :parameters (?s - start)
    :precondition (and (accepted-billy ?s) (accepted-maria ?s) (accepted-william ?s))
    :effect (meeting-scheduled ?s)
  )
)