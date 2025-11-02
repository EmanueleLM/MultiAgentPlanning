(define (domain schedule-meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)    ; person ?p is available at slot ?s
    (gerald-pref ?s - slot)              ; slot ?s satisfies Gerald's preference (at/after 13:00 and acceptable to Gerald)
    (scheduled)                          ; a meeting has been scheduled
    (meeting-at ?s - slot)               ; the meeting is scheduled at slot ?s
  )

  ;; Single scheduling action: requires all participants to be available and the slot to satisfy Gerald's preference.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (available gerald ?s)
      (available roy ?s)
      (available barbara ?s)
      (gerald-pref ?s)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
    )
  )
)