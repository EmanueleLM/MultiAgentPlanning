(define (domain calendar-scheduling)
  (:requirements :strips)
  (:predicates 
    (available ?agent ?time)
    (meeting-scheduled ?agent))
  (:action schedule-meeting
    :parameters (?agent1 ?agent2 ?agent3 ?time)
    :precondition (and 
      (available ?agent1 ?time)
      (available ?agent2 ?time)
      (available ?agent3 ?time))
    :effect (and 
      (meeting-scheduled ?agent1)
      (meeting-scheduled ?agent2)
      (meeting-scheduled ?agent3))
  )
)