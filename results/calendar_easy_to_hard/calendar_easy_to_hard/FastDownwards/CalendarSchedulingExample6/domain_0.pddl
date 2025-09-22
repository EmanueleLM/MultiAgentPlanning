(define (domain meeting-scheduling-integrated)
  (:requirements :typing :strips :negative-preconditions)
  (:types person timeslot day)

  (:predicates
    ;; types / membership
    (participant ?p - person)
    (timeslot ?t - timeslot)
    (day ?d - day)

    ;; temporal / scheduling predicates
    (on-day ?t - timeslot ?d - day)      ; slot occurs on day
    (within-workhours ?t - timeslot)     ; slot fits within 9:00-17:00
    (startable ?t - timeslot)            ; start times that fit a 60-minute meeting

    ;; availability, two predicate names used by different agents
    (available ?p - person ?t - timeslot) ; participant available for meeting starting at ?t (60 minutes)
    (free ?p - person ?t - timeslot)      ; synonym used by one agent

    ;; proposal / booking bookkeeping
    (proposed ?t - timeslot)
    (unscheduled)                         ; bookkeeping bit used by agent 2
    (meeting-unscheduled)                 ; bookkeeping bit used by agent 3
    (scheduled)                           ; bookkeeping bit used by agent 2/3 when scheduled
    (meeting-scheduled ?t - timeslot)     ; meeting has been scheduled at ?t
    (starts-at ?t - timeslot)
    (feasible-for-all ?t - timeslot)      ; public assertion from agent 3 that a specific time is known good
  )

  ;; Action contributed by Agent 1 (Thomas): propose a tentative slot if proposer is available.
  (:action propose-thomas
    :parameters (?p - person ?t - timeslot ?d - day)
    :precondition (and
      (participant ?p)
      (timeslot ?t)
      (day ?d)
      (on-day ?t ?d)
      (within-workhours ?t)
      (available ?p ?t)
      (not (proposed ?t))
      (not (meeting-scheduled ?t))
    )
    :effect (proposed ?t)
  )

  ;; Action contributed by Agent 2: schedule at a 30-minute-start timeslot if all participants are available.
  (:action schedule-30min
    :parameters (?t - timeslot)
    :precondition (and
      (timeslot ?t)
      (unscheduled)
      (available thomas ?t)
      (available dylan ?t)
      (available jerry ?t)
      (not (meeting-scheduled ?t))
    )
    :effect (and
      (not (unscheduled))
      (scheduled)
      (starts-at ?t)
      (meeting-scheduled ?t)
    )
  )

  ;; Action contributed by Agent 3: schedule using the "feasible-for-all" public fact and a per-person "free" fact.
  ;; (keeps action distinct by name and parameterization)
  (:action schedule-feasible
    :parameters (?t - timeslot ?p - person)
    :precondition (and
      (startable ?t)
      (feasible-for-all ?t)
      (free ?p ?t)
      (meeting-unscheduled)
      (not (meeting-scheduled ?t))
    )
    :effect (and
      (not (meeting-unscheduled))
      (meeting-scheduled ?t)
      (scheduled)
      (starts-at ?t)
    )
  )
)