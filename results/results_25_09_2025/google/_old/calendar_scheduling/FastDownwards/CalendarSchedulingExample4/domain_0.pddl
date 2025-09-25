(define (domain integrated-meeting-domain)
  (:requirements :strips :typing)
  (:types slot)
  (:predicates
    (slot ?s - slot)

    ; Per-agent availability facts (keeps agents' viewpoints distinct)
    (free-donna ?s - slot)
    (free-agent2 ?s - slot)
    (free-billy ?s - slot)

    ; Per-agent proposal markers (agents keep their actions distinct)
    (proposed-donna ?s - slot)
    (proposed-agent2 ?s - slot)
    (proposed-billy ?s - slot)

    ; Global scheduled marker and meeting goal predicate
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  ; Donna proposes a slot when she is free
  (:action propose-donna
    :parameters (?s - slot)
    :precondition (and (slot ?s) (free-donna ?s))
    :effect (and (proposed-donna ?s))
  )

  ; Agent2 proposes a slot when agent2 is free
  (:action propose-agent2
    :parameters (?s - slot)
    :precondition (and (slot ?s) (free-agent2 ?s))
    :effect (and (proposed-agent2 ?s))
  )

  ; Billy proposes a slot when Billy is free
  (:action propose-billy
    :parameters (?s - slot)
    :precondition (and (slot ?s) (free-billy ?s))
    :effect (and (proposed-billy ?s))
  )

  ; Finalize meeting: requires all three agents to have proposed the same slot
  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (slot ?s)
                       (proposed-donna ?s)
                       (proposed-agent2 ?s)
                       (proposed-billy ?s))
    :effect (and
             (scheduled ?s)
             (meeting-scheduled)
             (not (free-donna ?s))
             (not (free-agent2 ?s))
             (not (free-billy ?s))
    )
  )
)