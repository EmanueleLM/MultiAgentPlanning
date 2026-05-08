(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    ;; people
    brittany emily - person

    ;; 30-minute start slots within Monday 09:00-17:00 (last start at 16:30)
    s-09-00 s-09-30 s-10-00 s-10-30 s-11-00 s-11-30 s-12-00 s-12-30
    s-13-00 s-13-30 s-14-00 s-14-30 s-15-00 s-15-30 s-16-00 s-16-30 - slot

    monday - day
  )

  (:init
    ;; Map every slot to Monday to represent the single-day timeline (contiguity)
    (slot-on s-09-00 monday) (slot-on s-09-30 monday) (slot-on s-10-00 monday) (slot-on s-10-30 monday)
    (slot-on s-11-00 monday) (slot-on s-11-30 monday) (slot-on s-12-00 monday) (slot-on s-12-30 monday)
    (slot-on s-13-00 monday) (slot-on s-13-30 monday) (slot-on s-14-00 monday) (slot-on s-14-30 monday)
    (slot-on s-15-00 monday) (slot-on s-15-30 monday) (slot-on s-16-00 monday) (slot-on s-16-30 monday)

    ;; Successor links for contiguous 30-minute slots (enforces explicit ordering)
    (slot-next s-09-00 s-09-30) (slot-next s-09-30 s-10-00) (slot-next s-10-00 s-10-30) (slot-next s-10-30 s-11-00)
    (slot-next s-11-00 s-11-30) (slot-next s-11-30 s-12-00) (slot-next s-12-00 s-12-30) (slot-next s-12-30 s-13-00)
    (slot-next s-13-00 s-13-30) (slot-next s-13-30 s-14-00) (slot-next s-14-00 s-14-30) (slot-next s-14-30 s-15-00)
    (slot-next s-15-00 s-15-30) (slot-next s-15-30 s-16-00) (slot-next s-16-00 s-16-30)

    ;; Participant availability facts derived from the provided and audited reports.
    ;; Brittany: available_intervals ["09:00-13:00", "13:30-16:00", "16:30-17:00"]
    ;; Allowed start times within those intervals (start + 30min must be <= interval end):
    ;; 09:00..12:30, 13:30..15:30, 16:30
    (available brittany s-09-00) (available brittany s-09-30)
    (available brittany s-10-00) (available brittany s-10-30)
    (available brittany s-11-00) (available brittany s-11-30)
    (available brittany s-12-00) (available brittany s-12-30)
    (available brittany s-13-30) (available brittany s-14-00) (available brittany s-14-30)
    (available brittany s-15-00) (available brittany s-15-30) (available brittany s-16-30)

    ;; Emily: audited/corrected explicit available slots: ["11:00-11:30", "14:30-15:00"]
    (available emily s-11-00) (available emily s-14-30)

    ;; The auditor determined the earliest common feasible 30-minute meeting start is 11:00.
    ;; This is encoded as a strict constraint; the scheduler action requires this predicate.
    (earliest-common s-11-00)
  )

  ;; Goal: the auditor's corrections have been applied and the meeting is scheduled
  ;; at the mandated earliest feasible slot (11:00-11:30 on Monday).
  ;; This fixes the terminal condition explicitly.
  (:goal (and
    (audited)
    (meeting-scheduled)
    (meeting-at s-11-00)
  ))
)