(define (domain integrated-meeting-scheduling)
  (:requirements :typing :strips)
  (:types person slot)

  (:predicates
    (slot ?s - slot)
    (person ?p - person)
    ;; per-person availability for a specific slot
    (free ?p - person ?s - slot)
    ;; a person has indicated they will attend a meeting at a slot
    (attends ?p - person ?s - slot)
    ;; meeting chosen and recorded at a slot
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  ;; Each participant action is kept distinct (one action per agent).
  ;; An agent may indicate attendance for a slot only if they are free at that slot
  ;; and no meeting has yet been globally scheduled.
  (:action schedule-theresa
    :parameters (?s - slot)
    :precondition (and (slot ?s) (person theresa) (free theresa ?s) (not (meeting-scheduled)))
    :effect (and (attends theresa ?s) (not (free theresa ?s)))
  )

  (:action schedule-alexander
    :parameters (?s - slot)
    :precondition (and (slot ?s) (person alexander) (free alexander ?s) (not (meeting-scheduled)))
    :effect (and (attends alexander ?s) (not (free alexander ?s)))
  )

  (:action schedule-virginia
    :parameters (?s - slot)
    :precondition (and (slot ?s) (person virginia) (free virginia ?s) (not (meeting-scheduled)))
    :effect (and (attends virginia ?s) (not (free virginia ?s)))
  )

  (:action schedule-lisa
    :parameters (?s - slot)
    :precondition (and (slot ?s) (person lisa) (free lisa ?s) (not (meeting-scheduled)))
    :effect (and (attends lisa ?s) (not (free lisa ?s)))
  )

  (:action schedule-natalie
    :parameters (?s - slot)
    :precondition (and (slot ?s) (person natalie) (free natalie ?s) (not (meeting-scheduled)))
    :effect (and (attends natalie ?s) (not (free natalie ?s)))
  )

  (:action schedule-victoria
    :parameters (?s - slot)
    :precondition (and (slot ?s) (person victoria) (free victoria ?s) (not (meeting-scheduled)))
    :effect (and (attends victoria ?s) (not (free victoria ?s)))
  )

  ;; Once every participant has indicated attendance for the same slot,
  ;; confirm the meeting. This action sets the global meeting marker
  ;; and records the chosen slot.
  (:action confirm-meeting
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (attends theresa ?s)
      (attends alexander ?s)
      (attends virginia ?s)
      (attends lisa ?s)
      (attends natalie ?s)
      (attends victoria ?s)
      (not (meeting-scheduled))
    )
    :effect (and (meeting-scheduled) (scheduled-at ?s))
  )

)