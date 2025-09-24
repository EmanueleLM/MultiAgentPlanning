(define (domain integrated-meeting-planning)
  (:requirements :typing :adl :negative-preconditions :universal-preconditions)
  (:types participant day time duration)

  (:predicates
    ;; basic entities
    (participant ?p - participant)
    (day ?d - day)
    (time ?t - time)
    (next ?t1 - time ?t2 - time)            ; temporal succession (30-min steps)
    (in-work-hours ?t - time)               ; valid meeting start (9:00..16:00 inclusive)
    (free ?p - participant ?t - time)       ; person p is free at half-hour slot t
    (known ?p - participant)                ; we have availability info for this participant
    (feasible-exists)                       ; public fact: some feasible meeting exists
    (feasible-slot ?t - time)               ; public fact: a specific feasible start time
    (slot-on-day ?t - time ?d - day)        ; mapping slot -> day
    (slot-duration ?t - time ?dur - duration) ; duration (we use d60)
    (meeting-scheduled)                     ; meeting scheduled
    (meeting-at ?t - time)                  ; meeting starts at time t
    (scheduled-day ?d - day)
  )

  ;; Action contributed by Agent 1 (keeps agent1 action distinct)
  (:action schedule_by_agent1
    :parameters (?t - time ?t2 - time ?d - day ?dur - duration)
    :precondition (and
      (next ?t ?t2)
      (in-work-hours ?t)
      (feasible-slot ?t)
      (slot-on-day ?t ?d)
      (slot-duration ?t ?dur)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (scheduled-day ?d)
    )
  )

  ;; Action contributed by Agent 2 (keeps agent2 action distinct, checks Dylan's known 30-min free slots)
  (:action schedule_by_agent2_dylan
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (in-work-hours ?t)
      (feasible-exists)
      (free dylan ?t)
      (free dylan ?t2)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
    )
  )

  ;; Action contributed by Agent 3 (keeps agent3 action distinct, uses known info and universal conditions)
  (:action schedule_by_agent3_known
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (not (meeting-scheduled))
      ;; for every participant for whom we have known availability, they must be free at both slots
      (forall (?p - participant)
        (imply (known ?p)
               (and (free ?p ?t) (free ?p ?t2))))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      ;; mark occupied slots as no longer free for known participants
      (forall (?p - participant)
        (imply (known ?p)
               (and (not (free ?p ?t)) (not (free ?p ?t2)))))
    )
  )
)