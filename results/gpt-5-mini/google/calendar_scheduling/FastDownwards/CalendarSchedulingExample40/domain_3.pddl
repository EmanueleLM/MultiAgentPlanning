(define (domain jack_of_all_trades_domain)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types person meeting slot)

  (:predicates
    ;; existing calendar busy half-hour slots
    (busy ?p - person ?s - slot)

    ;; successor relation between consecutive half-hour slots
    (next_slot ?s1 - slot ?s2 - slot)

    ;; meeting requires these participants (instance-specific facts in problem)
    (requires_participant ?m - meeting ?p - person)

    ;; meeting scheduling bookkeeping
    (meeting_scheduled ?m - meeting)
    (meeting_start ?m - meeting ?s - slot)
    (meeting_occupies ?m - meeting ?s - slot)

    ;; persons occupied by newly scheduled meetings (distinct from existing busy)
    (occupied ?p - person ?s - slot)
  )

  ;; Schedule a meeting that occupies two consecutive half-hour slots (one hour total).
  ;; This action is written for meetings with exactly three required participants
  ;; (the problem provides exactly three requires_participant facts for meeting1).
  (:action schedule_meeting
    :parameters (?m - meeting
                 ?s - slot ?s2 - slot
                 ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      ;; the two slots must be consecutive to represent a one-hour meeting
      (next_slot ?s ?s2)

      ;; meeting not already scheduled
      (not (meeting_scheduled ?m))

      ;; these persons are the meeting's required participants
      (requires_participant ?m ?p1)
      (requires_participant ?m ?p2)
      (requires_participant ?m ?p3)

      ;; ensure the participant parameters are distinct
      (not (= ?p1 ?p2))
      (not (= ?p1 ?p3))
      (not (= ?p2 ?p3))

      ;; none of the required participants are busy (existing calendar) in either slot
      (not (busy ?p1 ?s)) (not (busy ?p1 ?s2))
      (not (busy ?p2 ?s)) (not (busy ?p2 ?s2))
      (not (busy ?p3 ?s)) (not (busy ?p3 ?s2))

      ;; and none are already occupied by another newly scheduled meeting in those slots
      (not (occupied ?p1 ?s)) (not (occupied ?p1 ?s2))
      (not (occupied ?p2 ?s)) (not (occupied ?p2 ?s2))
      (not (occupied ?p3 ?s)) (not (occupied ?p3 ?s2))
    )
    :effect (and
      (meeting_scheduled ?m)
      (meeting_start ?m ?s)
      (meeting_occupies ?m ?s)
      (meeting_occupies ?m ?s2)

      ;; mark participants occupied for both half-hour slots
      (occupied ?p1 ?s) (occupied ?p1 ?s2)
      (occupied ?p2 ?s) (occupied ?p2 ?s2)
      (occupied ?p3 ?s) (occupied ?p3 ?s2)
    )
  )
)