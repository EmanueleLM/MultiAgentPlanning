(define (domain meeting-scheduling)
  (:requirements :adl :typing :fluents)
  (:types slot participant)
  (:predicates
    (slot ?s - slot)
    (participant ?p - participant)
    (free ?p - participant ?s - slot)    ; participant ?p is available in slot ?s
    (scheduled)                          ; a meeting has been scheduled
    (meeting-at ?s - slot)               ; meeting is scheduled at slot ?s
  )
  (:functions
    (total-cost)                         ; objective to minimize (earlier slots have lower cost)
    (slot-cost ?s - slot)
  )

  ;; Schedule action: can be applied to a slot only if no meeting has been scheduled yet
  ;; and every participant is free in that slot.
  (:action schedule
     :parameters (?s - slot)
     :precondition (and
                     (slot ?s)
                     (not (scheduled))
                     (forall (?p - participant) (free ?p ?s))
                   )
     :effect (and
               (scheduled)
               (meeting-at ?s)
               (increase (total-cost) (slot-cost ?s))
             )
  )

  (:metric minimize (total-cost))
)