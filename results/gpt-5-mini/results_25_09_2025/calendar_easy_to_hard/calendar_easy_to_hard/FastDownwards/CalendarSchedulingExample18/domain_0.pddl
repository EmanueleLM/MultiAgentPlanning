(define (domain meeting-schedule-multiagent)
  (:requirements :strips :typing)
  (:predicates
    (slot ?s)
    (available-brian ?s)
    (available-billy ?s)
    (available-patricia ?s)
    (accepted-brian ?s)
    (accepted-billy ?s)
    (accepted-patricia ?s)
    (brian-unassigned)
    (billy-unassigned)
    (patricia-unassigned)
    (no-meeting)
    (meeting-scheduled ?s)
  )

  ; Actions are kept distinct per participant to model individual acceptance.
  (:action brian-accept
    :parameters (?s)
    :precondition (and (slot ?s) (available-brian ?s) (brian-unassigned))
    :effect (and (accepted-brian ?s) (not (brian-unassigned)))
  )

  (:action billy-accept
    :parameters (?s)
    :precondition (and (slot ?s) (available-billy ?s) (billy-unassigned))
    :effect (and (accepted-billy ?s) (not (billy-unassigned)))
  )

  (:action patricia-accept
    :parameters (?s)
    :precondition (and (slot ?s) (available-patricia ?s) (patricia-unassigned))
    :effect (and (accepted-patricia ?s) (not (patricia-unassigned)))
  )

  ; Finalize a meeting at a slot once all participants have accepted that slot.
  (:action finalize-meeting
    :parameters (?s)
    :precondition (and (accepted-brian ?s) (accepted-billy ?s) (accepted-patricia ?s) (no-meeting))
    :effect (and (meeting-scheduled ?s) (not (no-meeting)))
  )
)