(define (domain integrated-scheduling)
  (:requirements :strips :typing)
  (:types timeslot meeting)

  (:predicates
    (time ?t - timeslot)
    (next ?t1 ?t2 - timeslot)                    ; immediate next half-hour slot
    (startable ?t - timeslot)                    ; valid meeting start (fits within 9:00-17:00)
    (free-michelle ?t - timeslot)                ; Michelle is free for this half-hour slot
    (free-steven-start ?t - timeslot)            ; Steven is free if meeting starts at ?t (60-min)
    (free-jerry ?t - timeslot)                   ; Jerry is free for this half-hour slot
    (meeting ?m - meeting)
    (meeting-start ?m ?t - timeslot)             ; meeting m starts at timeslot t
    (meeting-confirm-michelle ?m ?t - timeslot)  ; Michelle confirms meeting m if starting at t
    (meeting-confirm-steven ?m ?t - timeslot)    ; Steven confirms meeting m if starting at t
    (meeting-confirm-jerry ?m ?t - timeslot)     ; Jerry confirms meeting m if starting at t
    (meeting-finalized ?m - meeting)
  )

  ;; Agent 1 (Michelle) schedules requiring Michelle be free for both consecutive half-hour slots.
  (:action schedule-michelle
    :parameters (?m - meeting ?t1 - timeslot ?t2 - timeslot)
    :precondition (and
      (meeting ?m)
      (startable ?t1)
      (next ?t1 ?t2)
      (free-michelle ?t1)
      (free-michelle ?t2)
    )
    :effect (and
      (meeting-confirm-michelle ?m ?t1)
    )
  )

  ;; Agent 2 (Steven) schedules using start-based availability (precomputed free starts).
  (:action schedule-steven
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (meeting ?m)
      (startable ?t)
      (free-steven-start ?t)
    )
    :effect (and
      (meeting-confirm-steven ?m ?t)
    )
  )

  ;; Agent 3 (Jerry) schedules requiring Jerry be free for both consecutive half-hour slots.
  (:action schedule-jerry
    :parameters (?m - meeting ?t1 - timeslot ?t2 - timeslot)
    :precondition (and
      (meeting ?m)
      (startable ?t1)
      (next ?t1 ?t2)
      (free-jerry ?t1)
      (free-jerry ?t2)
    )
    :effect (and
      (meeting-confirm-jerry ?m ?t1)
    )
  )

  ;; Finalizing action: only when all three agents have confirmed the same start time do we finalize.
  (:action finalize-meeting
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (meeting ?m)
      (meeting-confirm-michelle ?m ?t)
      (meeting-confirm-steven ?m ?t)
      (meeting-confirm-jerry ?m ?t)
    )
    :effect (and
      (meeting-finalized ?m)
      (meeting-start ?m ?t)
    )
  )
)