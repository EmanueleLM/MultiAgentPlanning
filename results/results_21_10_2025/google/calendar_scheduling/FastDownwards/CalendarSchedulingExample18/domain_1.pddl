(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)
    (meeting-scheduled ?s - slot)
    (meeting-made) ; becomes true once a meeting is scheduled (ensures single meeting)
  )

  ;; Three distinct scheduling actions (one per agent). Any of the three agents may schedule the meeting.
  ;; Each action requires all three participants be available at the chosen slot, the slot not already scheduled,
  ;; and that no meeting has yet been made. The action marks the slot as scheduled, clears the participants'
  ;; availability for that slot, and sets the global meeting-made flag.
  (:action schedule-by-brian
    :parameters (?s - slot)
    :precondition (and
      (available brian ?s)
      (available billy ?s)
      (available patricia ?s)
      (not (meeting-scheduled ?s))
      (not (meeting-made))
    )
    :effect (and
      (meeting-scheduled ?s)
      (meeting-made)
      (not (available brian ?s))
      (not (available billy ?s))
      (not (available patricia ?s))
    )
  )

  (:action schedule-by-billy
    :parameters (?s - slot)
    :precondition (and
      (available brian ?s)
      (available billy ?s)
      (available patricia ?s)
      (not (meeting-scheduled ?s))
      (not (meeting-made))
    )
    :effect (and
      (meeting-scheduled ?s)
      (meeting-made)
      (not (available brian ?s))
      (not (available billy ?s))
      (not (available patricia ?s))
    )
  )

  (:action schedule-by-patricia
    :parameters (?s - slot)
    :precondition (and
      (available brian ?s)
      (available billy ?s)
      (available patricia ?s)
      (not (meeting-scheduled ?s))
      (not (meeting-made))
    )
    :effect (and
      (meeting-scheduled ?s)
      (meeting-made)
      (not (available brian ?s))
      (not (available billy ?s))
      (not (available patricia ?s))
    )
  )
)