(define (domain meeting-scheduling)
  (:requirements :typing)
  (:types participant slot)

  (:predicates
    ;; object typing predicates (useful but not strictly required)
    (participant ?p - participant)
    (slot ?s - slot)

    ;; availability: participant ?p is free at slot ?s
    (free ?p - participant ?s - slot)

    ;; meeting control: a meeting has been started/chosen at slot ?s
    (meeting-started ?s - slot)

    ;; attendance: participant ?p attends the meeting at slot ?s
    (attends ?p - participant ?s - slot)
  )

  ;; choose a slot to start the meeting (no availability check here).
  ;; Attendance actions enforce participant-specific availability constraints.
  (:action start-meeting
    :parameters (?s - slot)
    :precondition (slot ?s)
    :effect (meeting-started ?s)
  )

  ;; a participant attends the meeting at the chosen slot only if they are free then.
  ;; This is a distinct, agent-specific attendance action so the final plan shows who attends.
  (:action attend
    :parameters (?p - participant ?s - slot)
    :precondition (and (participant ?p) (slot ?s) (free ?p ?s) (meeting-started ?s))
    :effect (attends ?p ?s)
  )
)