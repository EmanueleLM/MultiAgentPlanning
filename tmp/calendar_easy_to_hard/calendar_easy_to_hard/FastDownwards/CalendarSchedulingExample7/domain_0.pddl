(define (domain integrated-meeting-scheduler)
  (:requirements :typing :strips :negative-preconditions)
  (:types meeting person slot)

  (:predicates
    (meeting-scheduled ?m - meeting)
    (scheduled-at ?m - meeting ?s - slot)
    (available ?p - person ?s - slot)
    (meeting-with ?m - meeting ?p - person ?s - slot)
    (person ?p - person)
    (slot ?s - slot)
  )

  ;; Heather's action: can schedule the meeting if Heather is available at the slot.
  ;; It records the meeting, its slot, and that Heather, Nicholas and Zachary are included.
  (:action schedule_heather
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (meeting-scheduled ?m))
      (available heather ?s)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m ?s)
      (meeting-with ?m heather ?s)
      (meeting-with ?m nicholas ?s)
      (meeting-with ?m zachary ?s)
    )
  )

  ;; Nicholas's action: requires three people to be available at the chosen slot.
  ;; We keep all three participant parameters distinct so the planner can bind them.
  (:action schedule_nicholas
    :parameters (?m - meeting ?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (not (meeting-scheduled ?m))
      (available ?p1 ?s)
      (available ?p2 ?s)
      (available ?p3 ?s)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m ?s)
      (meeting-with ?m ?p1 ?s)
      (meeting-with ?m ?p2 ?s)
      (meeting-with ?m ?p3 ?s)
    )
  )

  ;; Zachary's action: can schedule if Zachary is available at the slot.
  ;; It records the meeting similarly and removes Zachary's availability at that slot.
  (:action schedule_zachary
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (meeting-scheduled ?m))
      (available zachary ?s)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m ?s)
      (meeting-with ?m heather ?s)
      (meeting-with ?m nicholas ?s)
      (meeting-with ?m zachary ?s)
      (not (available zachary ?s))
    )
  )
)