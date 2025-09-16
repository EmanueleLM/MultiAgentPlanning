(define (domain meeting-scheduler-merged)
  (:requirements :typing)
  (:types person time-slot)

  (:constants
     kathryn charlotte lauren - person
     t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time-slot
  )

  (:predicates
     (available ?p - person ?t - time-slot)
     (meeting_at ?t - time-slot)
  )

  (:action kathryn-schedule-meeting
     :parameters (?t - time-slot)
     :precondition (and (available kathryn ?t)
                        (available charlotte ?t)
                        (available lauren ?t)
                        (not (meeting_at ?t)))
     :effect (meeting_at ?t)
  )

  (:action charlotte-schedule-meeting
     :parameters (?t - time-slot)
     :precondition (and (available kathryn ?t)
                        (available charlotte ?t)
                        (available lauren ?t)
                        (not (meeting_at ?t)))
     :effect (meeting_at ?t)
  )

  (:action lauren-schedule-meeting
     :parameters (?t - time-slot)
     :precondition (and (available kathryn ?t)
                        (available charlotte ?t)
                        (available lauren ?t)
                        (not (meeting_at ?t)))
     :effect (meeting_at ?t)
  )
)