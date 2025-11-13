(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot segment)
  (:predicates
    (participant_exists ?p - participant)
    (slot_exists ?s - slot)
    (segment_exists ?seg - segment)
    (available ?p - participant ?seg - segment)
    (covers ?s - slot ?seg - segment)
    (next ?seg1 - segment ?seg2 - segment)
    (chosen ?s - slot)
    (scheduled)
  )

  ;; Select a slot that covers two contiguous segments and for which each participant
  ;; is available on both segments. The action is irreversible: once a slot is chosen
  ;; the meeting is scheduled (no action can unset these facts).
  (:action select_slot
    :parameters (?s - slot
                 ?seg1 - segment
                 ?seg2 - segment
                 ?p1 - participant
                 ?p2 - participant
                 ?p3 - participant)
    :precondition (and
      (slot_exists ?s)
      (segment_exists ?seg1)
      (segment_exists ?seg2)
      (covers ?s ?seg1)
      (covers ?s ?seg2)
      (next ?seg1 ?seg2)
      (not (chosen ?s))
      (participant_exists ?p1)
      (participant_exists ?p2)
      (participant_exists ?p3)
      (available ?p1 ?seg1)
      (available ?p1 ?seg2)
      (available ?p2 ?seg1)
      (available ?p2 ?seg2)
      (available ?p3 ?seg1)
      (available ?p3 ?seg2)
    )
    :effect (and
      (chosen ?s)
      (scheduled)
    )
  )
)