(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types participant slot)
  (:constants denise joseph henry christian - participant
              s09_10 s10_11 s11_12 s12_13 s13_14 s14_15 s15_16 s16_17 - slot)
  (:predicates
    (available ?p - participant ?s - slot)
    (meeting-not-scheduled)
    (meeting-scheduled)
    (meeting-scheduled-at ?s - slot)
    (attending ?p - participant ?s - slot)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (meeting-not-scheduled)
      (available denise ?s)
      (available joseph ?s)
      (available henry ?s)
      (available christian ?s)
    )
    :effect (and
      (not (meeting-not-scheduled))
      (meeting-scheduled)
      (meeting-scheduled-at ?s)
      (attending denise ?s)
      (attending joseph ?s)
      (attending henry ?s)
      (attending christian ?s)
    )
  )
)