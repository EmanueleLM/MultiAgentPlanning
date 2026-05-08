(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    ;; person p is available for a 30-min meeting starting at slot s
    (available ?p - person ?s - slot)
    ;; a meeting has been proposed to start at slot s
    (proposed ?s - slot)
    ;; person p has attended (accepted) the proposed meeting at slot s
    (attended ?p - person ?s - slot)
    ;; meeting confirmed that all required attendees have accepted
    (meeting-finalized)
  )

  ;; Orchestrator proposes a start slot for the meeting.
  (:action propose-meeting
    :parameters (?s - slot)
    :precondition (not (proposed ?s))
    :effect (proposed ?s)
  )

  ;; Distinct attend actions for each participant.
  ;; Each requires that the slot was proposed and that the specific person is available.
  ;; Use negative-preconditions to prevent duplicate attendance facts.
  (:action attend-joyce
    :parameters (?s - slot)
    :precondition (and (proposed ?s) (available joyce ?s) (not (attended joyce ?s)))
    :effect (attended joyce ?s)
  )

  (:action attend-christine
    :parameters (?s - slot)
    :precondition (and (proposed ?s) (available christine ?s) (not (attended christine ?s)))
    :effect (attended christine ?s)
  )

  (:action attend-alexander
    :parameters (?s - slot)
    :precondition (and (proposed ?s) (available alexander ?s) (not (attended alexander ?s)))
    :effect (attended alexander ?s)
  )

  ;; Finalize the meeting once all required attendees have attended for the same proposed slot.
  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (proposed ?s)
                       (attended joyce ?s)
                       (attended christine ?s)
                       (attended alexander ?s)
                       (not (meeting-finalized)))
    :effect (meeting-finalized)
  )
)