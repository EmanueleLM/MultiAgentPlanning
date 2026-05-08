(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    s-09-00 s-09-30 s-10-00 s-10-30 s-11-00 s-11-30 s-12-00 s-12-30
    s-13-00 s-13-30 s-14-00 s-14-30 s-15-00 s-15-30 s-16-00 s-16-30 - slot

    monday - day
  )

  (:init
    ;; slot -> day mapping
    (slot-on s-09-00 monday) (slot-on s-09-30 monday) (slot-on s-10-00 monday) (slot-on s-10-30 monday)
    (slot-on s-11-00 monday) (slot-on s-11-30 monday) (slot-on s-12-00 monday) (slot-on s-12-30 monday)
    (slot-on s-13-00 monday) (slot-on s-13-30 monday) (slot-on s-14-00 monday) (slot-on s-14-30 monday)
    (slot-on s-15-00 monday) (slot-on s-15-30 monday) (slot-on s-16-00 monday) (slot-on s-16-30 monday)

    ;; next-slot chain (keeps a canonical ordering of slots)
    (slot-next s-09-00 s-09-30) (slot-next s-09-30 s-10-00) (slot-next s-10-00 s-10-30) (slot-next s-10-30 s-11-00)
    (slot-next s-11-00 s-11-30) (slot-next s-11-30 s-12-00) (slot-next s-12-00 s-12-30) (slot-next s-12-30 s-13-00)
    (slot-next s-13-00 s-13-30) (slot-next s-13-30 s-14-00) (slot-next s-14-00 s-14-30) (slot-next s-14-30 s-15-00)
    (slot-next s-15-00 s-15-30) (slot-next s-15-30 s-16-00) (slot-next s-16-00 s-16-30)

    ;; Availability reports (after auditor corrections if any).
    ;; These reflect the participants' free 30-minute windows within 09:00-17:00.
    ;; Brittany busy 13:00-13:30 and 16:00-16:30 -> available all other listed slots
    (available brittany s-09-00) (available brittany s-09-30)
    (available brittany s-10-00) (available brittany s-10-30)
    (available brittany s-11-00) (available brittany s-11-30)
    (available brittany s-12-00) (available brittany s-12-30)
    (available brittany s-13-30) (available brittany s-14-00) (available brittany s-14-30)
    (available brittany s-15-00) (available brittany s-15-30) (available brittany s-16-30)

    ;; Emily is free the entire day -> mark at least a representative set;
    ;; it's sufficient to include the earliest common candidate slot.
    (available emily s-09-00) (available emily s-09-30) (available emily s-10-00)
    (available emily s-10-30) (available emily s-11-00) (available emily s-11-30)
    (available emily s-12-00) (available emily s-12-30) (available emily s-13-00)
    (available emily s-13-30) (available emily s-14-00) (available emily s-14-30)
    (available emily s-15-00) (available emily s-15-30) (available emily s-16-00) (available emily s-16-30)

    ;; Doris busy 09:00-11:00, 11:30-14:30, 15:00-17:00 -> free only at 11:00 and 14:30 as given
    (available doris s-11-00) (available doris s-14-30)

    ;; The orchestrator/auditor determined s-11-00 is the earliest common 30-min slot.
    (earliest-common s-11-00)
  )

  (:goal (and
    (audited)
    (meeting-scheduled)
    (meeting-at s-11-00)
  ))
)