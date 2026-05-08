(define (domain meeting_scheduling)
  ;; Solver target: FastDownwards
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types participant slot)

  (:predicates
    (available ?p - participant ?s - slot)   ; participant ?p is available at slot ?s
    (before_1330 ?s - slot)                  ; slot starts at or before 13:00 (meeting ends by 13:30)
    (preferred_slot ?s - slot)              ; slot is a preferred slot (before_1330 and free for all)
    (preferred_exists)                      ; there exists at least one preferred slot
    (meeting_scheduled)                      ; global flag: a meeting has been scheduled
    (scheduled_at ?s - slot)                 ; meeting is scheduled at slot ?s
  )

  ;; Schedule using a preferred slot (respects Daniel's preference).
  ;; This action is only applicable for the specific participants required by the task.
  (:action schedule_preferred
    :parameters (?s - slot)
    :precondition (and
      (preferred_slot ?s)
      (available ralph ?s) (available peter ?s) (available daniel ?s)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
      (not (available ralph ?s)) (not (available peter ?s)) (not (available daniel ?s))
      (not (preferred_exists))
    )
  )

  ;; Fallback schedule action: only allowed when no preferred slot exists.
  (:action schedule_any
    :parameters (?s - slot)
    :precondition (and
      (available ralph ?s) (available peter ?s) (available daniel ?s)
      (not (meeting_scheduled))
      (not (preferred_exists))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
      (not (available ralph ?s)) (not (available peter ?s)) (not (available daniel ?s))
    )
  )
)