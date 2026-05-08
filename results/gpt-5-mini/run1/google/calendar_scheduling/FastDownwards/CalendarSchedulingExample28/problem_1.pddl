(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    brittany emily doris - person

    s-09-00 s-09-30 s-10-00 s-10-30 s-11-00 s-11-30 s-12-00 s-12-30
    s-13-00 s-13-30 s-14-00 s-14-30 s-15-00 s-15-30 s-16-00 s-16-30 - slot

    monday - day
  )

  (:init
    (slot-on s-09-00 monday) (slot-on s-09-30 monday) (slot-on s-10-00 monday) (slot-on s-10-30 monday)
    (slot-on s-11-00 monday) (slot-on s-11-30 monday) (slot-on s-12-00 monday) (slot-on s-12-30 monday)
    (slot-on s-13-00 monday) (slot-on s-13-30 monday) (slot-on s-14-00 monday) (slot-on s-14-30 monday)
    (slot-on s-15-00 monday) (slot-on s-15-30 monday) (slot-on s-16-00 monday) (slot-on s-16-30 monday)

    (slot-next s-09-00 s-09-30) (slot-next s-09-30 s-10-00) (slot-next s-10-00 s-10-30) (slot-next s-10-30 s-11-00)
    (slot-next s-11-00 s-11-30) (slot-next s-11-30 s-12-00) (slot-next s-12-00 s-12-30) (slot-next s-12-30 s-13-00)
    (slot-next s-13-00 s-13-30) (slot-next s-13-30 s-14-00) (slot-next s-14-00 s-14-30) (slot-next s-14-30 s-15-00)
    (slot-next s-15-00 s-15-30) (slot-next s-15-30 s-16-00) (slot-next s-16-00 s-16-30)

    (available brittany s-09-00) (available brittany s-09-30)
    (available brittany s-10-00) (available brittany s-10-30)
    (available brittany s-11-00) (available brittany s-11-30)
    (available brittany s-12-00) (available brittany s-12-30)
    (available brittany s-13-30) (available brittany s-14-00) (available brittany s-14-30)
    (available brittany s-15-00) (available brittany s-15-30) (available brittany s-16-30)

    (available emily s-11-00) (available emily s-14-30)

    (available doris s-11-00) (available doris s-14-30)

    (earliest-common s-11-00)
  )

  (:goal (and
    (audited)
    (meeting-scheduled)
    (meeting-at s-11-00)
  ))
)