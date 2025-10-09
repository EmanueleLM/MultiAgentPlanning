(define (domain schedule-meeting)
  (:requirements :strips :typing)
  (:types participant slot)

  ;; Predicates:
  ;; (available ?p - participant ?s - slot)  -- participant is available at that slot
  ;; (free-slot ?s - slot)                   -- slot is currently free (not scheduled)
  ;; (attends ?p - participant ?s - slot)    -- participant has indicated they will attend that slot
  ;; (meeting-scheduled ?s - slot)           -- meeting has been scheduled at that slot
  (:predicates
    (available ?p - participant ?s - slot)
    (free-slot ?s - slot)
    (attends ?p - participant ?s - slot)
    (meeting-scheduled ?s - slot)
  )

  ;; Each participant executes an 'attend' action when they commit to a slot
  (:action attend
    :parameters (?p - participant ?s - slot)
    :precondition (and (available ?p ?s) (free-slot ?s))
    :effect (and (attends ?p ?s))
  )

  ;; Finalize the meeting at a slot once every participant has executed attend for that slot.
  ;; The problem file will instantiate the preconditions for the actual participants.
  (:action finalize
    :parameters (?s - slot)
    :precondition (and (free-slot ?s)
                       ;; NOTE: concrete attend predicates for all participants at ?s
                       ;; are required in the problem's goal or will be injected as add-preconds there.
                      )
    :effect (and (meeting-scheduled ?s)
                 (not (free-slot ?s))
                )
  )
)