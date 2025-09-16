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
     (meeting-scheduled)
  )

  ; Billy's action: choose a time not yet reserved by him
  (:action billy-schedule-meeting
     :parameters (?t - start)
     :precondition (and (billy-free ?t)
                        (not (meeting_time ?t)))
     :effect (and (not (billy-free ?t))
                  (meeting_time ?t))
  )

  ; Maria's action: if a meeting_time has been chosen and the slot is available, schedule the meeting
  (:action maria-schedule-meeting
     :parameters (?t - start)
     :precondition (and (meeting_time ?t)
                        (slot-available ?t)
                        (not (meeting-scheduled)))
     :effect (and (not (slot-available ?t))
                  (meeting-scheduled))
  )

  ; William's action: if a meeting_time has been chosen and all three participants are pair-free for that time, schedule (redundant but valid)
  (:action william-schedule-meeting
     :parameters (?t - start)
     :precondition (and (meeting_time ?t)
                        (pair-free p1 ?t)
                        (pair-free p2 ?t)
                        (pair-free p3 ?t))
     :effect (meeting-scheduled)
  )
)