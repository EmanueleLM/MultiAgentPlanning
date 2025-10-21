(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types slot)

  (:predicates
    ;; availability per participant
    (available-raymond ?s - slot)
    (available-billy ?s - slot)
    (available-donald ?s - slot)

    ;; preferred slot (before 15:00) as a soft preference marker
    (preferred ?s - slot)

    ;; meeting bookkeeping
    (meeting-scheduled)
    (scheduled ?s - slot)

    ;; attendance facts
    (attends-raymond ?s - slot)
    (attends-billy ?s - slot)
    (attends-donald ?s - slot)

    ;; work hours and meeting duration encoded as facts
    (work-hours-start ?s - slot)
    (work-hours-end ?s - slot)
    (meeting-duration-30)
  )

  (:functions
    (total-cost)
  )

  ;; Preferred scheduling action: zero cost (respects Billy's preference to avoid after 15:00)
  (:action schedule-meeting-preferred
    :parameters (?s - slot)
    :precondition (and
      (available-raymond ?s)
      (available-billy ?s)
      (available-donald ?s)
      (preferred ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
      (attends-raymond ?s)
      (attends-billy ?s)
      (attends-donald ?s)
      (increase (total-cost) 0)
    )
  )

  ;; Non-preferred scheduling action: higher cost (used only if no preferred slot is possible)
  (:action schedule-meeting-nonpreferred
    :parameters (?s - slot)
    :precondition (and
      (available-raymond ?s)
      (available-billy ?s)
      (available-donald ?s)
      (not (preferred ?s))
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
      (attends-raymond ?s)
      (attends-billy ?s)
      (attends-donald ?s)
      (increase (total-cost) 1)
    )
  )
)