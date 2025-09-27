(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :universal-preconditions :adl)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)        ; participant ?p is free for slot ?s
    (checked ?s - slot)                     ; slot ?s has been checked
    (candidate ?s - slot)                   ; slot ?s is a candidate (all participants free)
    (assigned ?s - slot)                    ; the meeting has been assigned to slot ?s
    (meeting-scheduled)                     ; meeting has been scheduled
    (earlier ?s1 - slot ?s2 - slot)         ; ?s1 is strictly earlier than ?s2
  )

  ;; Check an available slot: succeeds only when every participant is free for that slot.
  (:action check-slot-available
    :parameters (?s - slot)
    :precondition (and
      (not (checked ?s))
      ;; all participants must be free at ?s
      (free rachel ?s)
      (free katherine ?s)
      (free kelly ?s)
      (free cynthia ?s)
      (free anthony ?s)
      (free ryan ?s)
      (free richard ?s)
    )
    :effect (and (checked ?s) (candidate ?s))
  )

  ;; Mark a slot checked when at least one participant is not free there.
  ;; This action can be applied for any participant who is not free at ?s.
  (:action mark-checked-unavailable
    :parameters (?s - slot ?p - participant)
    :precondition (and
      (not (checked ?s))
      (not (free ?p ?s))
    )
    :effect (checked ?s)
  )

  ;; Assign the meeting to a candidate slot. To enforce choosing the earliest candidate,
  ;; the action requires that every strictly earlier slot ?s2 is already checked and is NOT a candidate.
  (:action assign-slot
    :parameters (?s - slot)
    :precondition (and
      (candidate ?s)
      (not (meeting-scheduled))
      (forall (?s2 - slot)
        (imply (earlier ?s2 ?s)
               (and (checked ?s2) (not (candidate ?s2)))
        )
      )
    )
    :effect (and (meeting-scheduled) (assigned ?s))
  )
)