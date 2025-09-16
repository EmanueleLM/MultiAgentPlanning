(define (domain calendar-scheduling)
  (:requirements :typing)
  (:types person time)
  (:constants billy maria william - person
              t12_00 - time)

  (:predicates
     (free ?p - person ?t - time)
     (meeting-at ?t - time)
     (meeting-scheduled)
  )

  (:action billy-schedule-meeting
     :parameters (?t - time)
     :precondition (and (free billy ?t)
                        (not (meeting-at ?t)))
     :effect (and (not (free billy ?t))
                  (meeting-at ?t))
  )

  (:action maria-schedule-meeting
     :parameters (?t - time)
     :precondition (and (meeting-at ?t)
                        (free maria ?t)
                        (not (meeting-scheduled)))
     :effect (and (not (free maria ?t))
                  (meeting-scheduled))
  )

  (:action william-schedule-meeting
     :parameters (?t - time)
     :precondition (and (meeting-at ?t)
                        (free william ?t)
                        (meeting-scheduled))
     :effect (and (not (free william ?t))
                  (meeting-scheduled))
  )
)