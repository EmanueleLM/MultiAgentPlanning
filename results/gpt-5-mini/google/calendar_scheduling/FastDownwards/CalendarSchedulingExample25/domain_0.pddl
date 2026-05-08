(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)

  (:predicates
    ; basic types
    (person ?p - person)
    (timeslot ?t - timeslot)

    ; temporal structure
    (succ ?t1 - timeslot ?t2 - timeslot)    ; immediate 30-minute successor

    ; availability per participant per 30-min timeslot
    (available ?p - person ?t - timeslot)

    ; scheduling bookkeeping / sequencing
    (no-proposal-yet)                        ; there is not yet a proposal
    (proposal ?s - timeslot ?s2 - timeslot) ; a proposed contiguous pair (start, next)
    (pamela-accepted ?s - timeslot ?s2 - timeslot)
    (zachary-accepted ?s - timeslot ?s2 - timeslot)

    ; final meeting state
    (meeting-scheduled)
    (occupied ?t - timeslot)                ; meeting occupies this timeslot
    (attending ?p - person)                 ; participant confirmed attendance
  )

  ; Anthony proposes a 1-hour meeting consisting of two contiguous 30-min slots
  (:action propose-anthony
    :parameters (?s - timeslot ?s2 - timeslot)
    :precondition (and
      (no-proposal-yet)
      (succ ?s ?s2)
      (available anthony ?s)
      (available anthony ?s2)
      (not (meeting-scheduled))
    )
    :effect (and
      (not (no-proposal-yet))
      (proposal ?s ?s2)
    )
  )

  ; Pamela must accept the same contiguous pair; her availability is checked (her preference is enforced
  ; by not making her available after 14:30 in the problem file)
  (:action accept-by-pamela
    :parameters (?s - timeslot ?s2 - timeslot)
    :precondition (and
      (proposal ?s ?s2)
      (succ ?s ?s2)
      (available pamela ?s)
      (available pamela ?s2)
      (not (meeting-scheduled))
    )
    :effect (and
      (pamela-accepted ?s ?s2)
    )
  )

  ; Zachary accepts the proposed contiguous pair; his availability is checked
  (:action accept-by-zachary
    :parameters (?s - timeslot ?s2 - timeslot)
    :precondition (and
      (proposal ?s ?s2)
      (pamela-accepted ?s ?s2)
      (succ ?s ?s2)
      (available zachary ?s)
      (available zachary ?s2)
      (not (meeting-scheduled))
    )
    :effect (and
      (zachary-accepted ?s ?s2)
    )
  )

  ; Finalize: when all three have agreed, create the final meeting occupation and attendance facts.
  (:action finalize-meeting
    :parameters (?s - timeslot ?s2 - timeslot)
    :precondition (and
      (proposal ?s ?s2)
      (pamela-accepted ?s ?s2)
      (zachary-accepted ?s ?s2)
      (succ ?s ?s2)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (attending anthony)
      (attending pamela)
      (attending zachary)
      (occupied ?s)
      (occupied ?s2)
    )
  )
)