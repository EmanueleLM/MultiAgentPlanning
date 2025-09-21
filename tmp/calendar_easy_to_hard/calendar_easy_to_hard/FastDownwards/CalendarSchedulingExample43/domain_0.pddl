(define (domain orchestrated-multiagent-scheduling)
  (:requirements :typing :negative-preconditions :adl)
  (:types slot)
  (:predicates
    ; global meeting control
    (meeting-not-scheduled)
    (meeting-scheduled ?s - slot)
    (meeting-found)

    ; participant-specific availability and busy predicates (kept distinct)
    (p1-available ?s - slot)
    (p1-busy ?s - slot)

    (p2-available ?s - slot)
    (p2-busy ?s - slot)

    (p3-available ?s - slot)
    (p3-busy ?s - slot)

    (p4-available ?s - slot)
    (p4-busy ?s - slot)

    (p5-available ?s - slot)
    (p5-busy ?s - slot)

    (p6-available ?s - slot)
    (p6-busy ?s - slot)

    (p7-available ?s - slot)
    (p7-busy ?s - slot)
  )

  ; Single action to schedule the meeting at a chosen 30-min slot.
  ; Preconditions require every participant to be explicitly available for that slot and not explicitly busy.
  (:action schedule-at
    :parameters (?s - slot)
    :precondition (and
      (meeting-not-scheduled)

      (p1-available ?s) (not (p1-busy ?s))
      (p2-available ?s) (not (p2-busy ?s))
      (p3-available ?s) (not (p3-busy ?s))
      (p4-available ?s) (not (p4-busy ?s))
      (p5-available ?s) (not (p5-busy ?s))
      (p6-available ?s) (not (p6-busy ?s))
      (p7-available ?s) (not (p7-busy ?s))
    )
    :effect (and
      (not (meeting-not-scheduled))
      (meeting-scheduled ?s)
    )
  )

  ; Finalize action to mark a meeting as found (goal uses meeting-found).
  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (meeting-scheduled ?s)
    :effect (meeting-found)
  )
)