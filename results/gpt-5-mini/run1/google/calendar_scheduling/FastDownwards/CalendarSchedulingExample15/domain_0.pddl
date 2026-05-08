(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (person ?p - person)
    (slot ?s - slot)
    (available ?p - person ?s - slot)      ; person is available for a 30-min meeting starting at slot
    (proposed ?s - slot)                   ; orchestrator proposed meeting at slot
    (attended ?p - person ?s - slot)       ; person has attended meeting proposed at slot
    (meeting-finalized)                    ; meeting confirmed with all required attendees
  )

  ;; Orchestrator action to propose a meeting start slot.
  (:action propose-meeting
    :parameters (?s - slot)
    :precondition (and (slot ?s) (not (proposed ?s)))
    :effect (proposed ?s)
  )

  ;; Distinct participant actions (ordered). Each participant action is distinct and enforces availability.
  ;; Joyce attends if orchestrator proposed the same slot and Joyce is available.
  (:action attend-joyce
    :parameters (?s - slot)
    :precondition (and (person joyce) (slot ?s) (proposed ?s) (available joyce ?s) (not (attended joyce ?s)))
    :effect (attended joyce ?s)
  )

  ;; Christine attends only after Joyce attended at the same slot and Christine is available.
  (:action attend-christine
    :parameters (?s - slot)
    :precondition (and (person christine) (slot ?s) (attended joyce ?s) (available christine ?s) (not (attended christine ?s)))
    :effect (attended christine ?s)
  )

  ;; Alexander attends only after Christine attended at the same slot and Alexander is available.
  (:action attend-alexander
    :parameters (?s - slot)
    :precondition (and (person alexander) (slot ?s) (attended christine ?s) (available alexander ?s) (not (attended alexander ?s)))
    :effect (attended alexander ?s)
  )

  ;; Finalize meeting once all three have attended the same proposed slot.
  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (slot ?s) (attended joyce ?s) (attended christine ?s) (attended alexander ?s) (not (meeting-finalized)))
    :effect (meeting-finalized)
  )
)