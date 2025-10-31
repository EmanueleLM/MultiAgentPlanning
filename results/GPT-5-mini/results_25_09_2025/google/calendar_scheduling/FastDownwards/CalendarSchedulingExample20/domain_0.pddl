(define (domain meeting-orchestration)
  (:requirements :strips :typing)
  (:types slot agent)
  (:predicates
    (free-ralph ?s - slot)
    (free-peter ?s - slot)
    (free-daniel ?s - slot)
    (preferred-daniel ?s - slot)
    (accepted-ralph ?s - slot)
    (accepted-peter ?s - slot)
    (accepted-daniel ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )

  ;; Ralph accepts a slot if he is free at that slot
  (:action ralph-accept
    :parameters (?s - slot)
    :precondition (free-ralph ?s)
    :effect (accepted-ralph ?s)
  )

  ;; Peter accepts a slot if he is free at that slot
  (:action peter-accept
    :parameters (?s - slot)
    :precondition (free-peter ?s)
    :effect (accepted-peter ?s)
  )

  ;; Daniel will accept only preferred slots (his stated preference: avoid after 13:30 if possible).
  ;; This encodes the "respect preference when possible" by making Daniel accept only preferred slots;
  ;; if no preferred slot is possible, an alternative model (not included here) would be needed to allow fallback.
  (:action daniel-accept-preferred
    :parameters (?s - slot)
    :precondition (and (free-daniel ?s) (preferred-daniel ?s))
    :effect (accepted-daniel ?s)
  )

  ;; Finalize the meeting at a slot when all participants have accepted the same slot.
  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (accepted-ralph ?s) (accepted-peter ?s) (accepted-daniel ?s))
    :effect (and (meeting-scheduled) (meeting-at ?s))
  )
)