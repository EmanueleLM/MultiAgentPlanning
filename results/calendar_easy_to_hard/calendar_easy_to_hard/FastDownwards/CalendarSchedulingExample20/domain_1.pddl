(define (domain integrated-meeting-scheduling)
  (:requirements :typing :negative-preconditions :adl :action-costs)
  (:types participant slot)

  (:predicates
    (slot ?s - slot)
    (participant ?p - participant)
    (busy ?p - participant ?s - slot)
    (free ?p - participant ?s - slot)
    (occupied ?s - slot)
    (unscheduled)
    (scheduled)
    (meeting-scheduled ?p1 - participant ?p2 - participant ?s - slot)
    (meeting-with ?p - participant)
    (meeting-at ?s - slot)
    (preferred ?p - participant ?s - slot)
    (early ?s - slot)
  )

  (:action schedule_agent1
    :parameters (?p1 - participant ?p2 - participant ?s - slot)
    :precondition (and
      (slot ?s)
      (participant ?p1) (participant ?p2)
      (unscheduled)
      (not (busy ?p1 ?s)) (not (busy ?p2 ?s))
      (not (occupied ?s))
    )
    :effect (and
      (occupied ?s)
      (meeting-scheduled ?p1 ?p2 ?s)
      (meeting-at ?s)
      (meeting-with ?p1) (meeting-with ?p2)
      (scheduled)
      (not (unscheduled))
    )
    :cost 1
  )

  (:action schedule_preferred_agent1_p1pref
    :parameters (?p1 - participant ?p2 - participant ?s - slot)
    :precondition (and
      (slot ?s)
      (participant ?p1) (participant ?p2)
      (unscheduled)
      (preferred ?p1 ?s)
      (not (busy ?p1 ?s)) (not (busy ?p2 ?s))
      (not (occupied ?s))
    )
    :effect (and
      (occupied ?s)
      (meeting-scheduled ?p1 ?p2 ?s)
      (meeting-at ?s)
      (meeting-with ?p1) (meeting-with ?p2)
      (scheduled)
      (not (unscheduled))
    )
    :cost 0
  )

  (:action schedule_preferred_agent1_p2pref
    :parameters (?p1 - participant ?p2 - participant ?s - slot)
    :precondition (and
      (slot ?s)
      (participant ?p1) (participant ?p2)
      (unscheduled)
      (preferred ?p2 ?s)
      (not (busy ?p1 ?s)) (not (busy ?p2 ?s))
      (not (occupied ?s))
    )
    :effect (and
      (occupied ?s)
      (meeting-scheduled ?p1 ?p2 ?s)
      (meeting-at ?s)
      (meeting-with ?p1) (meeting-with ?p2)
      (scheduled)
      (not (unscheduled))
    )
    :cost 0
  )

  (:action schedule_agent2
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (unscheduled)
      (free peter ?s) (free ralph ?s) (free daniel ?s)
      (not (busy peter ?s)) (not (busy ralph ?s)) (not (busy daniel ?s))
      (not (occupied ?s))
    )
    :effect (and
      (not (unscheduled))
      (scheduled)
      (meeting-at ?s)
      (meeting-with peter)
      (meeting-with ralph)
      (meeting-with daniel)
      (occupied ?s)
      (meeting-scheduled peter ralph ?s)
      (meeting-scheduled peter daniel ?s)
      (meeting-scheduled ralph daniel ?s)
    )
    :cost 1
  )

  (:action schedule_early_agent3
    :parameters (?s - slot)
    :precondition (and
      (early ?s)
      (unscheduled)
      (slot ?s)
      (not (occupied ?s))
      (not (busy daniel ?s))
      (not (busy ralph ?s))
      (not (busy peter ?s))
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
      (meeting-with daniel) (meeting-with ralph) (meeting-with peter)
      (occupied ?s)
      (meeting-scheduled daniel ralph ?s)
      (meeting-scheduled daniel peter ?s)
      (meeting-scheduled ralph peter ?s)
      (not (unscheduled))
    )
    :cost 0
  )

  (:action schedule_late_agent3
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (unscheduled)
      (not (early ?s))
      (not (occupied ?s))
      (not (busy daniel ?s))
      (not (busy ralph ?s))
      (not (busy peter ?s))
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
      (meeting-with daniel) (meeting-with ralph) (meeting-with peter)
      (occupied ?s)
      (meeting-scheduled daniel ralph ?s)
      (meeting-scheduled daniel peter ?s)
      (meeting-scheduled ralph peter ?s)
      (not (unscheduled))
    )
    :cost 1
  )
)