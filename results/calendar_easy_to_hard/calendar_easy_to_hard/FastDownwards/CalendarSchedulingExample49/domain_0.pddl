(define (domain meeting-schedule)
  (:requirements :typing :strips :negative-preconditions :universal-preconditions :existential-preconditions)
  (:types participant timeslot)

  (:predicates
    (available ?p - participant ?t - timeslot)    ;; participant ?p is available at timeslot ?t
    (meeting-at ?t - timeslot)                    ;; a meeting is scheduled to start at timeslot ?t
  )

  ;; Schedule a meeting at a single 30-minute timeslot.
  ;; Preconditions:
  ;;  - every declared participant must be available at the chosen timeslot (universal precondition)
  ;;  - no meeting is already scheduled (ensures only one meeting)
  ;; Effects:
  ;;  - meeting-at ?t is set
  (:action schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
      (forall (?p - participant) (available ?p ?t))
      (not (exists (?t2 - timeslot) (meeting-at ?t2)))
    )
    :effect (meeting-at ?t)
  )
)