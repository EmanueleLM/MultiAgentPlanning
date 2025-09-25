(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types slot)

  (:predicates
    (slot ?s - slot)
    (available-brian ?s - slot)
    (available-billy ?s - slot)
    (available-patricia ?s - slot)

    (accepted-brian ?s - slot)
    (accepted-billy ?s - slot)
    (accepted-patricia ?s - slot)

    (meeting-scheduled ?s - slot)
    (meeting-not-scheduled)
    (meeting-done)
  )

  ;; Each participant has a distinct "accept" action that records acceptance of a specific discrete 30-min slot.
  (:action brian-accept
    :parameters (?s - slot)
    :precondition (and (slot ?s) (available-brian ?s) (meeting-not-scheduled))
    :effect (and (accepted-brian ?s))
  )

  (:action billy-accept
    :parameters (?s - slot)
    :precondition (and (slot ?s) (available-billy ?s) (meeting-not-scheduled))
    :effect (and (accepted-billy ?s))
  )

  (:action patricia-accept
    :parameters (?s - slot)
    :precondition (and (slot ?s) (available-patricia ?s) (meeting-not-scheduled))
    :effect (and (accepted-patricia ?s))
  )

  ;; Finalize the meeting once all participants have accepted the same slot.
  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and
                   (slot ?s)
                   (accepted-brian ?s)
                   (accepted-billy ?s)
                   (accepted-patricia ?s)
                   (meeting-not-scheduled))
    :effect (and
             (meeting-scheduled ?s)
             (meeting-done)
             (not (meeting-not-scheduled))
            )
  )
)