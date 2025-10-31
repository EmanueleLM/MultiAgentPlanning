(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types participant slot)

  (:predicates
    (slot ?s - slot)
    (participant ?p - participant)
    ; participant ?p is available for 30-minute slot ?s
    (available ?p - participant ?s - slot)
    ; a meeting has been scheduled in slot ?s
    (meeting-scheduled ?s - slot)
    ; a meeting has been scheduled (global flag to allow only one meeting)
    (scheduled)
  )

  ;; Schedule action: schedule a 30-minute meeting in one slot for all participants.
  ;; For this problem instance there is a single explicit participant (william).
  ;; Preconditions require the participant to be available in that slot
  ;; and that no meeting is already scheduled.
  (:action schedule
    :parameters (?p - participant ?s - slot)
    :precondition (and (participant ?p) (slot ?s) (available ?p ?s) (not (scheduled)))
    :effect (and (meeting-scheduled ?s) (scheduled))
  )
)