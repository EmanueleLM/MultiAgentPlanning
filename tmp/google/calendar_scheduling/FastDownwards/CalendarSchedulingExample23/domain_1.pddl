(define (domain orchestrated-meeting)
  (:requirements :typing)
  (:types start person)
  (:constants
     p1 p2 p3 - person
  )
  (:predicates
     (billy-free ?t - start)
     (slot-available ?t - start)
     (pair-free ?p - person ?t - start)
     (meeting_time ?t - start)
     (meeting_scheduled)
  )

  (:action billy-schedule-meeting
     :parameters (?t - start)
     :precondition (and (billy-free ?t)
                        (not (meeting_time ?t)))
     :effect (and (not (billy-free ?t))
                  (meeting_time ?t))
  )

  (:action maria-schedule-meeting
     :parameters (?t - start)
     :precondition (and (meeting_time ?t)
                        (slot-available ?t)
                        (not (meeting_scheduled)))
     :effect (and (not (slot-available ?t))
                  (meeting_scheduled))
  )

  (:action william-schedule-meeting
     :parameters (?t - start)
     :precondition (and (meeting_time ?t)
                        (pair-free p1 ?t)
                        (pair-free p2 ?t)
                        (pair-free p3 ?t))
     :effect (meeting_scheduled)
  )
)