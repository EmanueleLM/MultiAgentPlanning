(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)
    (succ ?s1 - slot ?s2 - slot)
    (reserved ?p - person ?s1 - slot ?s2 - slot)
    (meeting-scheduled ?s1 - slot ?s2 - slot)
  )

  ;; Participant-specific reservation actions (keeps actions distinct and enforces ordering)
  (:action reserve-p1
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (succ ?s1 ?s2)
      (available p1 ?s1)
      (available p1 ?s2)
      (not (reserved p1 ?s1 ?s2))
    )
    :effect (and
      (reserved p1 ?s1 ?s2)
    )
  )

  (:action reserve-p2
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (succ ?s1 ?s2)
      (reserved p1 ?s1 ?s2)            ;; enforces order: p1 must reserve this slot-pair first
      (available p2 ?s1)
      (available p2 ?s2)
      (not (reserved p2 ?s1 ?s2))
    )
    :effect (and
      (reserved p2 ?s1 ?s2)
    )
  )

  (:action reserve-p3
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (succ ?s1 ?s2)
      (reserved p2 ?s1 ?s2)            ;; enforces order: p2 must reserve before p3
      (available p3 ?s1)
      (available p3 ?s2)
      (not (reserved p3 ?s1 ?s2))
    )
    :effect (and
      (reserved p3 ?s1 ?s2)
    )
  )

  ;; Finalize the meeting once all participants have reserved the same contiguous slot pair.
  (:action finalize-meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (succ ?s1 ?s2)
      (reserved p1 ?s1 ?s2)
      (reserved p2 ?s1 ?s2)
      (reserved p3 ?s1 ?s2)
      (not (meeting-scheduled ?s1 ?s2))
    )
    :effect (and
      (meeting-scheduled ?s1 ?s2)
    )
  )
)