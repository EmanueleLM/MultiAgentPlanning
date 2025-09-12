(define (domain meeting_scheduler)
  (:requirements :strips :typing)
  (:types agent time)
  (:predicates
    (available ?agent - agent ?time - time)
    (meeting_set ?time - time))

  (:action raymond_available
    :parameters (?time - time)
    :precondition ()
    :effect (available raymond ?time))

  (:action billy_available
    :parameters (?time - time)
    :precondition ()
    :effect (available billy ?time))
  
  (:action donald_available
    :parameters (?time - time)
    :precondition ()
    :effect (available donald ?time))

  (:action set_meeting
    :parameters (?time - time)
    :precondition (and (available raymond ?time)
                       (available billy ?time)
                       (available donald ?time))
    :effect (meeting_set ?time))
)