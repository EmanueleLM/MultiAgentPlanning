(define (domain orchestrated-scheduling)
  (:requirements :strips)
  (:predicates
    (person ?p)
    (slot ?s)
    (next ?s1 ?s2)                          ; consecutive half-hour slots
    (free ?p ?s)                            ; person ?p is free during slot ?s
    (duration-60 ?m)                        ; meeting requires 60 minutes
    (scheduled-michelle ?m ?s)              ; michelle scheduled for meeting ?m starting at ?s (her view)
    (scheduled-steven ?m ?s)                ; steven scheduled for meeting ?m starting at ?s (his view)
    (scheduled-jerry ?m ?s)                 ; jerry scheduled for meeting ?m starting at ?s (his view)
    (meeting-finalized ?m)                  ; meeting has been finalized (agreed by all)
    (meeting-time ?m ?s)                    ; meeting ?m scheduled to start at slot ?s (global record)
  )

  ;; Michelle's scheduling action (keeps agent action distinct)
  (:action schedule-michelle
    :parameters (?m ?s1 ?s2 ?p)
    :precondition (and
      (person ?p)
      (next ?s1 ?s2)
      (free ?p ?s1)
      (free ?p ?s2)
      (duration-60 ?m)
      ;; we expect ?p to be michelle when used in the problem instance
    )
    :effect (and
      (scheduled-michelle ?m ?s1)
      (not (free ?p ?s1))
      (not (free ?p ?s2))
    )
  )

  ;; Steven's scheduling action (keeps agent action distinct)
  (:action schedule-steven
    :parameters (?m ?p ?s1 ?s2)
    :precondition (and
      (person ?p)
      (next ?s1 ?s2)
      (free ?p ?s1)
      (free ?p ?s2)
      (duration-60 ?m)
      ;; we expect ?p to be steven when used in the problem instance
    )
    :effect (and
      (scheduled-steven ?m ?s1)
      (not (free ?p ?s1))
      (not (free ?p ?s2))
    )
  )

  ;; Jerry's scheduling action (keeps agent action distinct)
  (:action schedule-jerry
    :parameters (?m ?p ?s1 ?s2)
    :precondition (and
      (person ?p)
      (next ?s1 ?s2)
      (free ?p ?s1)
      (free ?p ?s2)
      (duration-60 ?m)
      ;; we expect ?p to be jerry when used in the problem instance
    )
    :effect (and
      (scheduled-jerry ?m ?s1)
      (not (free ?p ?s1))
      (not (free ?p ?s2))
    )
  )

  ;; Finalization action: requires all three agents to have scheduled the same start slot.
  (:action finalize-meeting
    :parameters (?m ?s1 ?s2)
    :precondition (and
      (next ?s1 ?s2)
      (scheduled-michelle ?m ?s1)
      (scheduled-steven ?m ?s1)
      (scheduled-jerry ?m ?s1)
      (duration-60 ?m)
    )
    :effect (and
      (meeting-finalized ?m)
      (meeting-time ?m ?s1)
    )
  )
)