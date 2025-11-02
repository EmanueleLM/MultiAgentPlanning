(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types participant timeslot)

  (:predicates
    (available ?p - participant ?t - timeslot)
    (preferred ?t - timeslot)    ; timeslots that are preferred by Zachary (start before 14:00)
    (scheduled)                   ; becomes true once a meeting slot is chosen
    (meeting-at ?t - timeslot)    ; records chosen timeslot
  )

  (:functions
    (total-cost)                  ; accumulates cost for soft preferences
  )

  ;; Schedule a meeting in a preferred timeslot (cost 0)
  (:action schedule-meeting-preferred
    :parameters (?t - timeslot)
    :precondition (and
      (available heather ?t)
      (available nicholas ?t)
      (available zachary ?t)
      (preferred ?t)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting-at ?t)
      (increase (total-cost) 0)
    )
  )

  ;; Schedule a meeting in a dispreferred timeslot (cost 1)
  (:action schedule-meeting-dispreferred
    :parameters (?t - timeslot)
    :precondition (and
      (available heather ?t)
      (available nicholas ?t)
      (available zachary ?t)
      (not (preferred ?t))
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting-at ?t)
      (increase (total-cost) 1)
    )
  )
)