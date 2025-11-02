(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot)

  (:predicates
    (free ?a - agent ?s - slot)               ; agent is free in slot
    (next ?s1 - slot ?s2 - slot)             ; s2 immediately follows s1 (30-min increments)
    (proposed ?s - slot)                     ; a proposal exists to start meeting at slot s
    (approved-charles ?s - slot)             ; Charles approved proposal at slot s
    (approved-betty ?s - slot)               ; Betty approved proposal at slot s
    (meeting-scheduled ?s - slot)            ; meeting scheduled starting at slot s
  )

  ; Theresa proposes a 60-minute meeting starting at ?s (requires both ?s and its next slot free for Theresa)
  (:action propose-theresa
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (next ?s ?s2)
                       (free theresa ?s)
                       (free theresa ?s2)
                       (not (proposed ?s)))
    :effect (and (proposed ?s))
  )

  ; Charles approves a proposed start ?s (requires both ?s and next slot free for Charles)
  (:action approve-charles
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (proposed ?s)
                       (next ?s ?s2)
                       (free charles ?s)
                       (free charles ?s2)
                       (not (approved-charles ?s)))
    :effect (and (approved-charles ?s))
  )

  ; Betty approves a proposed start ?s (requires both ?s and next slot free for Betty)
  (:action approve-betty
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (proposed ?s)
                       (next ?s ?s2)
                       (free betty ?s)
                       (free betty ?s2)
                       (not (approved-betty ?s)))
    :effect (and (approved-betty ?s))
  )

  ; Theresa finalizes the meeting once both other participants have approved and Theresa is free
  (:action finalize-theresa
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (proposed ?s)
                       (approved-charles ?s)
                       (approved-betty ?s)
                       (next ?s ?s2)
                       (free theresa ?s)
                       (free theresa ?s2)
                       (not (meeting-scheduled ?s)))
    :effect (and (meeting-scheduled ?s))
  )
)