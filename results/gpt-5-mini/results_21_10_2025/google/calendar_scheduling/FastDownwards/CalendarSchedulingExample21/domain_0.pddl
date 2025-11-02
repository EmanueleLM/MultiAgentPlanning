;; Discretization: 30-minute slots; a 60-minute meeting occupies two consecutive half-hour slots.
(define (domain meeting-scheduling)
  :requirements (:strips :typing :negative-preconditions)
  :types person slot
  :predicates
    (slot ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (free ?p - person ?s - slot)
    (meeting-scheduled)
    (meeting-start ?s - slot)
  :action schedule-meeting
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
                    (slot ?s)
                    (slot ?s2)
                    (next ?s ?s2)
                    (not (meeting-scheduled))
                    (free bobby ?s) (free bobby ?s2)
                    (free scott ?s) (free scott ?s2)
                    (free kimberly ?s) (free kimberly ?s2))
    :effect (and
              (meeting-scheduled)
              (meeting-start ?s))
)