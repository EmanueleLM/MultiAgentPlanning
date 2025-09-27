(define (domain meeting-scheduling)
  (:requirements :typing :strips :equality :universal-preconditions)
  (:types participant slot meeting)
  (:predicates
    (attendee ?p - participant ?m - meeting)        ; participant ?p is required for meeting ?m
    (available ?p - participant ?s - slot)         ; participant ?p is available at slot ?s
    (scheduled ?m - meeting)                       ; meeting ?m has been scheduled
    (meeting-at ?m - meeting ?s - slot)            ; meeting ?m is scheduled at slot ?s
  )

  ;; Schedule the meeting at a particular slot if all attendees are available at that slot
  (:action schedule-meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
                    (not (scheduled ?m))
                    ;; For every participant that is an attendee of the meeting, they must be available at ?s
                    (forall (?p - participant)
                      (imply (attendee ?p ?m) (available ?p ?s)))
                  )
    :effect (and
              (scheduled ?m)
              (meeting-at ?m ?s)
            )
  )
)