(define (domain calendar-scheduling)
  (:requirements :strips :typing)
  (:types agent time)
  (:predicates 
    (available ?agent - agent ?time - time)
    (meeting-scheduled ?agent - agent))
  (:action schedule-meeting
    :parameters (?agent1 - agent ?agent2 - agent ?agent3 - agent ?time - time)
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