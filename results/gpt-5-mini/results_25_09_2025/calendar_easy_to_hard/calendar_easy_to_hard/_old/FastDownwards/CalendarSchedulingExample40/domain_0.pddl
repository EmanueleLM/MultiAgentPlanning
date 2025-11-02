(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    (avail ?p - participant ?s - slot)        ; aggregated availability facts (from participants)
    (confirmed-p1 ?s - slot)
    (confirmed-p2 ?s - slot)
    (confirmed-p3 ?s - slot)
    (confirmed-p4 ?s - slot)
    (confirmed-p5 ?s - slot)
    (confirmed-p6 ?s - slot)
    (confirmed-p7 ?s - slot)
    (meeting-scheduled)                       ; goal atom (true once a meeting is scheduled)
  )

  ; Distinct confirm actions per participant. Each requires that participant's availability for the chosen slot.
  (:action confirm-p1
    :parameters (?s - slot)
    :precondition (and (avail p1 ?s) (not (confirmed-p1 ?s)))
    :effect (confirmed-p1 ?s)
  )

  (:action confirm-p2
    :parameters (?s - slot)
    :precondition (and (avail p2 ?s) (not (confirmed-p2 ?s)))
    :effect (confirmed-p2 ?s)
  )

  (:action confirm-p3
    :parameters (?s - slot)
    :precondition (and (avail p3 ?s) (not (confirmed-p3 ?s)))
    :effect (confirmed-p3 ?s)
  )

  (:action confirm-p4
    :parameters (?s - slot)
    :precondition (and (avail p4 ?s) (not (confirmed-p4 ?s)))
    :effect (confirmed-p4 ?s)
  )

  (:action confirm-p5
    :parameters (?s - slot)
    :precondition (and (avail p5 ?s) (not (confirmed-p5 ?s)))
    :effect (confirmed-p5 ?s)
  )

  (:action confirm-p6
    :parameters (?s - slot)
    :precondition (and (avail p6 ?s) (not (confirmed-p6 ?s)))
    :effect (confirmed-p6 ?s)
  )

  (:action confirm-p7
    :parameters (?s - slot)
    :precondition (and (avail p7 ?s) (not (confirmed-p7 ?s)))
    :effect (confirmed-p7 ?s)
  )

  ; Central scheduling action: can fire for a slot only after all participants have confirmed that same slot.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (confirmed-p1 ?s)
      (confirmed-p2 ?s)
      (confirmed-p3 ?s)
      (confirmed-p4 ?s)
      (confirmed-p5 ?s)
      (confirmed-p6 ?s)
      (confirmed-p7 ?s)
      (not (meeting-scheduled))
    )
    :effect (and (meeting-scheduled))
  )
)