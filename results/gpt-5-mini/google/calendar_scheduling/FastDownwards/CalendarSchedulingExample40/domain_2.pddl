(define (domain jack_of_all_trades_domain)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types person meeting slot)
  (:predicates
    (busy ?p - person ?s - slot)                     ; existing calendar busy slots
    (next_slot ?s1 - slot ?s2 - slot)                ; successor relation between consecutive half-hour slots
    (requires_participant ?m - meeting ?p - person)  ; meeting requires this participant
    (meeting_scheduled ?m - meeting)
    (meeting_start ?m - meeting ?s - slot)
    (meeting_occupies ?m - meeting ?s - slot)
    (occupied ?p - person ?s - slot)                 ; person occupied by a (newly scheduled) meeting
  )

  ;; Schedule a meeting for its required participants across two consecutive half-hour slots
  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot ?s2 - slot
                 ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (next_slot ?s ?s2)
      (not (meeting_scheduled ?m))

      ;; The three persons must be exactly required participants for the meeting
      (requires_participant ?m ?p1)
      (requires_participant ?m ?p2)
      (requires_participant ?m ?p3)

      ;; Ensure the three participant parameters are distinct persons
      (not (= ?p1 ?p2))
      (not (= ?p1 ?p3))
      (not (= ?p2 ?p3))

      ;; None of the participants can be busy in either slot
      (not (busy ?p1 ?s)) (not (busy ?p1 ?s2))
      (not (busy ?p2 ?s)) (not (busy ?p2 ?s2))
      (not (busy ?p3 ?s)) (not (busy ?p3 ?s2))

      ;; And they must not already be occupied by another scheduled meeting in those slots
      (not (occupied ?p1 ?s)) (not (occupied ?p1 ?s2))
      (not (occupied ?p2 ?s)) (not (occupied ?p2 ?s2))
      (not (occupied ?p3 ?s)) (not (occupied ?p3 ?s2))
    )
    :effect (and
      (meeting_scheduled ?m)
      (meeting_start ?m ?s)
      (meeting_occupies ?m ?s)
      (meeting_occupies ?m ?s2)

      ;; mark the participants occupied for both half-hour slots
      (occupied ?p1 ?s) (occupied ?p1 ?s2)
      (occupied ?p2 ?s) (occupied ?p2 ?s2)
      (occupied ?p3 ?s) (occupied ?p3 ?s2)
    )
  )
)